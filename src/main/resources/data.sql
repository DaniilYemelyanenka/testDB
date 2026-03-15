-- ROLES
INSERT INTO roles(name) VALUES
                            ('administrator'),
                            ('exam_center'),
                            ('examinee');


-- USERS
INSERT INTO users(first_name,last_name,email,password_hash) VALUES
                                                                ('Admin','System','admin@test.com','hash1'),
                                                                ('Center','London','center1@test.com','hash2'),
                                                                ('Center','Berlin','center2@test.com','hash3'),
                                                                ('Ivan','Ivanov','exam1@test.com','hash4'),
                                                                ('Anna','Petrova','exam2@test.com','hash5'),
                                                                ('Sergey','Sidorov','exam3@test.com','hash6');


-- USER ROLES
INSERT INTO user_roles(user_id,role_id) VALUES
                                            (1,1),
                                            (2,2),
                                            (3,2),
                                            (4,3),
                                            (5,3),
                                            (6,3);


-- SUBJECTS
INSERT INTO subjects(name,description) VALUES
                                           ('Mathematics','Math exam'),
                                           ('Physics','Physics exam'),
                                           ('Chemistry','Chemistry exam'),
                                           ('Biology','Biology exam'),
                                           ('History','History exam');


-- TESTS
INSERT INTO tests(subject_id,title,duration_minutes) VALUES
                                                         (1,'Math Test',60),
                                                         (2,'Physics Test',60),
                                                         (3,'Chemistry Test',60),
                                                         (4,'Biology Test',60),
                                                         (5,'History Test',60);


-- QUESTIONS
INSERT INTO questions(test_id,question_text,score) VALUES
                                                       (1,'Math question 1',1),
                                                       (1,'Math question 2',1),
                                                       (1,'Math question 3',1),
                                                       (1,'Math question 4',1),
                                                       (1,'Math question 5',1),
                                                       (1,'Math question 6',1),
                                                       (1,'Math question 7',1),
                                                       (1,'Math question 8',1),
                                                       (1,'Math question 9',1),
                                                       (1,'Math question 10',1),

                                                       (2,'Physics question 1',1),
                                                       (2,'Physics question 2',1),
                                                       (2,'Physics question 3',1),
                                                       (2,'Physics question 4',1),
                                                       (2,'Physics question 5',1),
                                                       (2,'Physics question 6',1),
                                                       (2,'Physics question 7',1),
                                                       (2,'Physics question 8',1),
                                                       (2,'Physics question 9',1),
                                                       (2,'Physics question 10',1),

                                                       (3,'Chemistry question 1',1),
                                                       (3,'Chemistry question 2',1),
                                                       (3,'Chemistry question 3',1),
                                                       (3,'Chemistry question 4',1),
                                                       (3,'Chemistry question 5',1),
                                                       (3,'Chemistry question 6',1),
                                                       (3,'Chemistry question 7',1),
                                                       (3,'Chemistry question 8',1),
                                                       (3,'Chemistry question 9',1),
                                                       (3,'Chemistry question 10',1),

                                                       (4,'Biology question 1',1),
                                                       (4,'Biology question 2',1),
                                                       (4,'Biology question 3',1),
                                                       (4,'Biology question 4',1),
                                                       (4,'Biology question 5',1),
                                                       (4,'Biology question 6',1),
                                                       (4,'Biology question 7',1),
                                                       (4,'Biology question 8',1),
                                                       (4,'Biology question 9',1),
                                                       (4,'Biology question 10',1),

                                                       (5,'History question 1',1),
                                                       (5,'History question 2',1),
                                                       (5,'History question 3',1),
                                                       (5,'History question 4',1),
                                                       (5,'History question 5',1),
                                                       (5,'History question 6',1),
                                                       (5,'History question 7',1),
                                                       (5,'History question 8',1),
                                                       (5,'History question 9',1),
                                                       (5,'History question 10',1);


-- ANSWER OPTIONS (150)
INSERT INTO answer_options(question_id,option_text,is_correct) VALUES
                                                                   (1,'A',TRUE),(1,'B',FALSE),(1,'C',FALSE),
                                                                   (2,'A',TRUE),(2,'B',FALSE),(2,'C',FALSE),
                                                                   (3,'A',TRUE),(3,'B',FALSE),(3,'C',FALSE),
                                                                   (4,'A',TRUE),(4,'B',FALSE),(4,'C',FALSE),
                                                                   (5,'A',TRUE),(5,'B',FALSE),(5,'C',FALSE),
                                                                   (6,'A',TRUE),(6,'B',FALSE),(6,'C',FALSE),
                                                                   (7,'A',TRUE),(7,'B',FALSE),(7,'C',FALSE),
                                                                   (8,'A',TRUE),(8,'B',FALSE),(8,'C',FALSE),
                                                                   (9,'A',TRUE),(9,'B',FALSE),(9,'C',FALSE),
                                                                   (10,'A',TRUE),(10,'B',FALSE),(10,'C',FALSE),

                                                                   (11,'A',TRUE),(11,'B',FALSE),(11,'C',FALSE),
                                                                   (12,'A',TRUE),(12,'B',FALSE),(12,'C',FALSE),
                                                                   (13,'A',TRUE),(13,'B',FALSE),(13,'C',FALSE),
                                                                   (14,'A',TRUE),(14,'B',FALSE),(14,'C',FALSE),
                                                                   (15,'A',TRUE),(15,'B',FALSE),(15,'C',FALSE),
                                                                   (16,'A',TRUE),(16,'B',FALSE),(16,'C',FALSE),
                                                                   (17,'A',TRUE),(17,'B',FALSE),(17,'C',FALSE),
                                                                   (18,'A',TRUE),(18,'B',FALSE),(18,'C',FALSE),
                                                                   (19,'A',TRUE),(19,'B',FALSE),(19,'C',FALSE),
                                                                   (20,'A',TRUE),(20,'B',FALSE),(20,'C',FALSE),

                                                                   (21,'A',TRUE),(21,'B',FALSE),(21,'C',FALSE),
                                                                   (22,'A',TRUE),(22,'B',FALSE),(22,'C',FALSE),
                                                                   (23,'A',TRUE),(23,'B',FALSE),(23,'C',FALSE),
                                                                   (24,'A',TRUE),(24,'B',FALSE),(24,'C',FALSE),
                                                                   (25,'A',TRUE),(25,'B',FALSE),(25,'C',FALSE),
                                                                   (26,'A',TRUE),(26,'B',FALSE),(26,'C',FALSE),
                                                                   (27,'A',TRUE),(27,'B',FALSE),(27,'C',FALSE),
                                                                   (28,'A',TRUE),(28,'B',FALSE),(28,'C',FALSE),
                                                                   (29,'A',TRUE),(29,'B',FALSE),(29,'C',FALSE),
                                                                   (30,'A',TRUE),(30,'B',FALSE),(30,'C',FALSE),

                                                                   (31,'A',TRUE),(31,'B',FALSE),(31,'C',FALSE),
                                                                   (32,'A',TRUE),(32,'B',FALSE),(32,'C',FALSE),
                                                                   (33,'A',TRUE),(33,'B',FALSE),(33,'C',FALSE),
                                                                   (34,'A',TRUE),(34,'B',FALSE),(34,'C',FALSE),
                                                                   (35,'A',TRUE),(35,'B',FALSE),(35,'C',FALSE),
                                                                   (36,'A',TRUE),(36,'B',FALSE),(36,'C',FALSE),
                                                                   (37,'A',TRUE),(37,'B',FALSE),(37,'C',FALSE),
                                                                   (38,'A',TRUE),(38,'B',FALSE),(38,'C',FALSE),
                                                                   (39,'A',TRUE),(39,'B',FALSE),(39,'C',FALSE),
                                                                   (40,'A',TRUE),(40,'B',FALSE),(40,'C',FALSE),

                                                                   (41,'A',TRUE),(41,'B',FALSE),(41,'C',FALSE),
                                                                   (42,'A',TRUE),(42,'B',FALSE),(42,'C',FALSE),
                                                                   (43,'A',TRUE),(43,'B',FALSE),(43,'C',FALSE),
                                                                   (44,'A',TRUE),(44,'B',FALSE),(44,'C',FALSE),
                                                                   (45,'A',TRUE),(45,'B',FALSE),(45,'C',FALSE),
                                                                   (46,'A',TRUE),(46,'B',FALSE),(46,'C',FALSE),
                                                                   (47,'A',TRUE),(47,'B',FALSE),(47,'C',FALSE),
                                                                   (48,'A',TRUE),(48,'B',FALSE),(48,'C',FALSE),
                                                                   (49,'A',TRUE),(49,'B',FALSE),(49,'C',FALSE),
                                                                   (50,'A',TRUE),(50,'B',FALSE),(50,'C',FALSE);


-- EXAM CENTERS
INSERT INTO exam_centers(user_id,name,address,city,capacity) VALUES
                                                                 (2,'London Testing Center','221B Baker Street','London',100),
                                                                 (3,'Berlin Testing Center','Unter den Linden 5','Berlin',80);


-- SESSION STATUS
INSERT INTO exam_session_status(name) VALUES
                                          ('planned'),
                                          ('open'),
                                          ('closed');


-- EXAM SESSIONS
INSERT INTO exam_sessions(
    center_id,
    session_date,
    start_time,
    end_time,
    registration_deadline,
    max_participants,
    exam_session_status_id
) VALUES
      (1,'2026-07-01','09:00','12:00','2026-06-20',50,2),
      (2,'2026-07-05','10:00','13:00','2026-06-25',40,2);


-- EXAMNEES
INSERT INTO examinees(user_id,passport_number,phone,registration_date) VALUES
                                                                          (4,'AA123456','+1111111','2026-05-01'),
                                                                          (5,'BB123456','+2222222','2026-05-01'),
                                                                          (6,'CC123456','+3333333','2026-05-01');


-- EXAM REGISTRATIONS
INSERT INTO exam_registrations(examinee_id,session_id,registration_date,status) VALUES
                                                                                   (1,1,'2026-05-10','registered'),
                                                                                   (2,1,'2026-05-11','registered'),
                                                                                   (3,2,'2026-05-12','registered');


-- TEST ATTEMPTS
INSERT INTO test_attempts(test_id,exam_registration_id,start_time,end_time,status) VALUES
                                                                                       (1,1,'2026-07-01 09:00','2026-07-01 10:00','completed'),
                                                                                       (2,2,'2026-07-01 09:00','2026-07-01 10:00','completed'),
                                                                                       (3,3,'2026-07-05 10:00','2026-07-05 11:00','completed');


-- TEST RESULTS
INSERT INTO test_results(attempt_id,total_score,passed,calculated_at) VALUES
                                                                          (1,8,TRUE,'2026-07-01'),
                                                                          (2,6,TRUE,'2026-07-01'),
                                                                          (3,4,FALSE,'2026-07-05');


-- APPEALS
INSERT INTO appeals(
    attempt_id,
    appeal_text,
    status,
    submitted_at,
    reviewed_at,
    reviewed_by,
    decision_comment
) VALUES
    (3,'I think question 5 was incorrect','pending','2026-07-06',NULL,NULL,NULL);