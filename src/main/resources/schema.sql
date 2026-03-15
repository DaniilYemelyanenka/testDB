DROP TABLE IF EXISTS appeals CASCADE;
DROP TABLE IF EXISTS test_attempts CASCADE;
DROP TABLE IF EXISTS exam_registrations CASCADE;
DROP TABLE IF EXISTS exam_sessions CASCADE;
DROP TABLE IF EXISTS answer_options CASCADE;
DROP TABLE IF EXISTS questions CASCADE;
DROP TABLE IF EXISTS tests CASCADE;
DROP TABLE IF EXISTS subjects CASCADE;
DROP TABLE IF EXISTS examinees CASCADE;
DROP TABLE IF EXISTS exam_centers CASCADE;
DROP TABLE IF EXISTS user_roles CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS roles CASCADE;
DROP TABLE IF EXISTS exam_session_status CASCADE;
DROP TABLE IF EXISTS exam_sessions_subjects CASCADE;
DROP TABLE IF EXISTS participants_answers CASCADE;
DROP TABLE IF EXISTS test_results CASCADE;





CREATE TABLE roles (
                       id SERIAL PRIMARY KEY,
                       name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       first_name VARCHAR(100),
                       last_name VARCHAR(100),
                       email VARCHAR(255) UNIQUE NOT NULL,
                       password_hash TEXT NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE user_roles (
                            user_id INT NOT NULL,
                            role_id INT NOT NULL,

                            PRIMARY KEY (user_id, role_id),

                            CONSTRAINT fk_user_roles_user
                                FOREIGN KEY (user_id)
                                    REFERENCES users(id)
                                    ON DELETE CASCADE,

                            CONSTRAINT fk_user_roles_role
                                FOREIGN KEY (role_id)
                                    REFERENCES roles(id)
                                    ON DELETE CASCADE
);

CREATE TABLE subjects (
                          id SERIAL PRIMARY KEY,
                          name VARCHAR(255) NOT NULL UNIQUE,
                          description TEXT,
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE tests (
                       id SERIAL PRIMARY KEY,
                       subject_id INT NOT NULL,
                       title VARCHAR(255) NOT NULL,
                       duration_minutes INT NOT NULL,

                       CONSTRAINT fk_tests_subject
                           FOREIGN KEY (subject_id)
                               REFERENCES subjects(id)
);

CREATE TABLE questions (
                           id SERIAL PRIMARY KEY,
                           test_id INT NOT NULL,
                           question_text TEXT NOT NULL,
                           score INT NOT NULL,

                           CONSTRAINT fk_questions_test
                               FOREIGN KEY (test_id)
                                   REFERENCES tests(id)
                                   ON DELETE CASCADE
);

CREATE TABLE answer_options (
                                id SERIAL PRIMARY KEY,
                                question_id INT NOT NULL,
                                option_text TEXT NOT NULL,
                                is_correct BOOLEAN DEFAULT FALSE,

                                CONSTRAINT fk_answer_options_question
                                    FOREIGN KEY (question_id)
                                        REFERENCES questions(id)
                                        ON DELETE CASCADE
);

CREATE TABLE exam_centers (
                              id SERIAL PRIMARY KEY,
                              user_id INT NOT NULL,
                              name VARCHAR(255),
                              address TEXT,
                              city VARCHAR(100),
                              capacity INT,

                              CONSTRAINT fk_exam_centers_user
                                  FOREIGN KEY (user_id)
                                      REFERENCES users(id)
                                      ON DELETE CASCADE
);

CREATE TABLE exam_session_status (
                                     id SERIAL PRIMARY KEY,
                                     name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE exam_sessions (
                               id SERIAL PRIMARY KEY,
                               center_id INT NOT NULL,
                               session_date DATE,
                               start_time TIME,
                               end_time TIME,
                               registration_deadline DATE,
                               max_participants INT,
                               exam_session_status_id INT,

                               CONSTRAINT fk_exam_sessions_center
                                   FOREIGN KEY (center_id)
                                       REFERENCES exam_centers(id),

                               CONSTRAINT fk_exam_sessions_status
                                   FOREIGN KEY (exam_session_status_id)
                                       REFERENCES exam_session_status(id)
);

CREATE TABLE exam_sessions_subjects (
                                        id SERIAL PRIMARY KEY,
                                        session_id INT NOT NULL,
                                        subject_id INT NOT NULL,
                                        test_id INT NOT NULL,

                                        CONSTRAINT fk_ess_session
                                            FOREIGN KEY (session_id)
                                                REFERENCES exam_sessions(id)
                                                ON DELETE CASCADE,

                                        CONSTRAINT fk_ess_subject
                                            FOREIGN KEY (subject_id)
                                                REFERENCES subjects(id),

                                        CONSTRAINT fk_ess_test
                                            FOREIGN KEY (test_id)
                                                REFERENCES tests(id)
);

CREATE TABLE examinees (
                          id SERIAL PRIMARY KEY,
                          user_id INT,
                          passport_number VARCHAR(50),
                          phone VARCHAR(50),
                          registration_date DATE,

                          CONSTRAINT fk_examinees_user
                              FOREIGN KEY (user_id)
                                  REFERENCES users(id)
);

CREATE TABLE exam_registrations (
                                    id SERIAL PRIMARY KEY,
                                    examinee_id INT NOT NULL,
                                    session_id INT NOT NULL,
                                    registration_date DATE,
                                    status VARCHAR(50),

                                    CONSTRAINT uq_exam_registration
                                        UNIQUE (examinee_id, session_id),

                                    CONSTRAINT fk_exam_reg_examinee
                                        FOREIGN KEY (examinee_id)
                                            REFERENCES examinees(id),

                                    CONSTRAINT fk_exam_reg_session
                                        FOREIGN KEY (session_id)
                                            REFERENCES exam_sessions(id)
);

CREATE TABLE test_attempts (
                               id SERIAL PRIMARY KEY,
                               test_id INT NOT NULL,
                               exam_registration_id INT,
                               start_time TIMESTAMP,
                               end_time TIMESTAMP,
                               status VARCHAR(50),

                               CONSTRAINT fk_attempt_test
                                   FOREIGN KEY (test_id)
                                       REFERENCES tests(id),

                               CONSTRAINT fk_attempt_registration
                                   FOREIGN KEY (exam_registration_id)
                                       REFERENCES exam_registrations(id)
);

CREATE TABLE participants_answers (
                                      id SERIAL PRIMARY KEY,
                                      attempt_id INT NOT NULL,
                                      question_id INT NOT NULL,
                                      selected_option_id INT,

                                      CONSTRAINT uq_attempt_question
                                          UNIQUE (attempt_id, question_id),

                                      CONSTRAINT fk_pa_attempt
                                          FOREIGN KEY (attempt_id)
                                              REFERENCES test_attempts(id)
                                              ON DELETE CASCADE,

                                      CONSTRAINT fk_pa_question
                                          FOREIGN KEY (question_id)
                                              REFERENCES questions(id),

                                      CONSTRAINT fk_pa_option
                                          FOREIGN KEY (selected_option_id)
                                              REFERENCES answer_options(id)
);

CREATE TABLE test_results (
                              id SERIAL PRIMARY KEY,
                              attempt_id INT NOT NULL UNIQUE,
                              total_score INT,
                              passed BOOLEAN,
                              calculated_at TIMESTAMP,

                              CONSTRAINT fk_results_attempt
                                  FOREIGN KEY (attempt_id)
                                      REFERENCES test_attempts(id)
                                      ON DELETE CASCADE
);

CREATE TABLE appeals (
                         id SERIAL PRIMARY KEY,
                         attempt_id INT NOT NULL,
                         appeal_text TEXT,
                         status VARCHAR(50),
                         submitted_at TIMESTAMP,
                         reviewed_at TIMESTAMP,
                         reviewed_by INT,
                         decision_comment TEXT,

                         CONSTRAINT fk_appeal_attempt
                             FOREIGN KEY (attempt_id)
                                 REFERENCES test_attempts(id),

                         CONSTRAINT fk_appeal_reviewer
                             FOREIGN KEY (reviewed_by)
                                 REFERENCES users(id)
);