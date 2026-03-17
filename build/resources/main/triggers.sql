--проверяет дедлайн регистрациии
CREATE OR REPLACE FUNCTION check_registration_deadline()
RETURNS TRIGGER
LANGUAGE plpgsql
AS '
DECLARE
    deadline DATE;
BEGIN
    SELECT registration_deadline
    INTO deadline
    FROM exam_sessions
    WHERE id = NEW.session_id;

    IF NEW.registration_date > deadline THEN
        RAISE EXCEPTION ''Registration deadline has passed'';
    END IF;

    RETURN NEW;
END;
';

CREATE TRIGGER trg_check_deadline
BEFORE INSERT ON exam_registrations
FOR EACH ROW
EXECUTE FUNCTION check_registration_deadline();

--- нельязя начать вторую попытку если есть незавершенные
CREATE OR REPLACE FUNCTION prevent_multiple_active_attempts()
RETURNS TRIGGER
LANGUAGE plpgsql
AS '
BEGIN
    IF EXISTS (
        SELECT 1 FROM test_attempts
        WHERE exam_registration_id = NEW.exam_registration_id
          AND end_time IS NULL
    ) THEN
        RAISE EXCEPTION ''Active attempt already exists'';
    END IF;

    RETURN NEW;
END;
';

CREATE TRIGGER trg_prevent_multiple_attempts
BEFORE INSERT ON test_attempts
FOR EACH ROW
EXECUTE FUNCTION prevent_multiple_active_attempts();

--еслми время вышло попытка автоматически закрывается
CREATE OR REPLACE FUNCTION auto_finish_attempt()
RETURNS TRIGGER
LANGUAGE plpgsql
AS '
DECLARE
    duration INT;
BEGIN
    SELECT t.duration_minutes
    INTO duration
    FROM tests t
    WHERE t.id = NEW.test_id;

    IF NEW.start_time + (duration || '' minutes'')::interval <= NOW() THEN
        NEW.end_time := NOW();
    END IF;

    RETURN NEW;
END;
';
CREATE TRIGGER trg_auto_finish_attempt
BEFORE UPDATE ON test_attempts
FOR EACH ROW
EXECUTE FUNCTION auto_finish_attempt();

--создание профиля при добавлении роли
CREATE OR REPLACE FUNCTION create_profile_by_role()
RETURNS TRIGGER
LANGUAGE plpgsql
AS '
DECLARE
    role_name TEXT;
BEGIN
    -- получаем имя роли
    SELECT name INTO role_name
    FROM roles
    WHERE id = NEW.role_id;

    -- если экзаменационный центр
    IF role_name = ''exam_center'' THEN
        INSERT INTO exam_centers(user_id, name, city, capacity)
        VALUES (
            NEW.user_id,
            ''Center '' || NEW.user_id,
            ''Unknown'',
            0
        );
    END IF;

    -- если экзаменуемый
    IF role_name = ''examinee'' THEN
        INSERT INTO examinees(user_id, passport_number, phone, registration_date)
        VALUES (
            NEW.user_id,
            ''TEMP'' || NEW.user_id,
            ''UNKNOWN'',
            CURRENT_DATE
        );
    END IF;

    RETURN NEW;
END;
';
CREATE TRIGGER trg_create_profile_by_role
AFTER INSERT ON user_roles
FOR EACH ROW
EXECUTE FUNCTION create_profile_by_role();

--нельзя удалить пользователя с активными
CREATE OR REPLACE FUNCTION prevent_user_delete_if_active()
RETURNS TRIGGER
LANGUAGE plpgsql
AS '
DECLARE
    active_attempts INT;
    active_registrations INT;
BEGIN
    -- проверяем активные попытки тестов
    SELECT COUNT(*) INTO active_attempts
    FROM test_attempts ta
    JOIN exam_registrations er ON ta.exam_registration_id = er.id
    JOIN examinees e ON er.examinee_id = e.id
    WHERE e.user_id = OLD.id
      AND ta.end_time IS NULL;

    -- проверяем активные регистрации
    SELECT COUNT(*) INTO active_registrations
    FROM exam_registrations er
    JOIN examinees e ON er.examinee_id = e.id
    WHERE e.user_id = OLD.id
      AND er.status = ''registered'';

    IF active_attempts > 0 OR active_registrations > 0 THEN
        RAISE EXCEPTION ''Cannot delete user with active attempts or registrations'';
    END IF;

    RETURN OLD;
END;
';
CREATE TRIGGER trg_prevent_user_delete
BEFORE DELETE ON users
FOR EACH ROW
EXECUTE FUNCTION prevent_user_delete_if_active();