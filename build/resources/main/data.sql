-- =========================
-- ROLES
-- =========================
INSERT INTO roles(name) VALUES
('admin'),
('student'),
('examiner');

-- =========================
-- USERS
-- =========================
INSERT INTO users(first_name,last_name,email,password_hash) VALUES
('Alice','Smith','alice@example.com','dummyhash'),
('Bob','Johnson','bob@example.com','dummyhash'),
('Charlie','Brown','charlie@example.com','dummyhash');

-- =========================
-- USER ROLES
-- =========================
INSERT INTO user_roles(user_id,role_id) VALUES
(1,2),(2,2),(3,2);

-- =========================
-- SUBJECTS
-- =========================
INSERT INTO subjects(name,description) VALUES
('Mathematics','Math exam'),
('Physics','Physics exam'),
('History','History exam');

-- =========================
-- TESTS
-- =========================
INSERT INTO tests(subject_id,title,duration_minutes) VALUES
(1,'Math Test',60),
(2,'Physics Test',60),
(3,'History Test',60);

-- =========================
-- QUESTIONS
-- =========================
-- Math
INSERT INTO questions(test_id,question_text,score) VALUES
(1,'2 + 2 = ?',1),(1,'5 * 6 = ?',1),(1,'Square root of 81?',1),
(1,'10 / 2 = ?',1),(1,'7 + 3 = ?',1),(1,'9 * 9 = ?',1),
(1,'15 - 5 = ?',1),(1,'6 * 7 = ?',1),(1,'8 + 12 = ?',1),(1,'100 / 10 = ?',1);
-- Physics
INSERT INTO questions(test_id,question_text,score) VALUES
(2,'Unit of force?',1),(2,'Speed of light?',1),(2,'Gravity on Earth?',1),
(2,'Unit of energy?',1),(2,'Who discovered gravity?',1),(2,'Acceleration unit?',1),
(2,'Unit of power?',1),(2,'Symbol of velocity?',1),(2,'What is inertia?',1),
(2,'Light is a?',1);
-- History
INSERT INTO questions(test_id,question_text,score) VALUES
(3,'Who discovered America?',1),(3,'Year of WW2 start?',1),(3,'First president of USA?',1),
(3,'Roman Empire capital?',1),(3,'Who was Napoleon?',1),(3,'Cold War period?',1),
(3,'Great Wall is in?',1),(3,'Who built pyramids?',1),(3,'Medieval knights were?',1),
(3,'Industrial revolution started in?',1);

-- =========================
-- ANSWER OPTIONS
-- =========================
-- Math
INSERT INTO answer_options(question_id,option_text,is_correct) VALUES
(1,'3',FALSE),(1,'4',TRUE),(1,'5',FALSE),(1,'6',FALSE),
(2,'30',TRUE),(2,'20',FALSE),(2,'25',FALSE),(2,'35',FALSE),
(3,'9',TRUE),(3,'8',FALSE),(3,'7',FALSE),(3,'6',FALSE),
(4,'5',TRUE),(4,'4',FALSE),(4,'6',FALSE),(4,'3',FALSE),
(5,'10',TRUE),(5,'9',FALSE),(5,'11',FALSE),(5,'12',FALSE),
(6,'81',TRUE),(6,'72',FALSE),(6,'90',FALSE),(6,'99',FALSE),
(7,'10',TRUE),(7,'9',FALSE),(7,'8',FALSE),(7,'7',FALSE),
(8,'42',TRUE),(8,'36',FALSE),(8,'48',FALSE),(8,'40',FALSE),
(9,'20',TRUE),(9,'18',FALSE),(9,'22',FALSE),(9,'24',FALSE),
(10,'10',TRUE),(10,'9',FALSE),(10,'8',FALSE),(10,'7',FALSE);
-- Physics
INSERT INTO answer_options(question_id,option_text,is_correct) VALUES
(11,'Newton',TRUE),(11,'Joule',FALSE),(11,'Watt',FALSE),(11,'Volt',FALSE),
(12,'3x10^8 m/s',TRUE),(12,'3x10^6',FALSE),(12,'3x10^5',FALSE),(12,'1x10^8',FALSE),
(13,'9.8 m/s²',TRUE),(13,'10 m/s',FALSE),(13,'8 m/s²',FALSE),(13,'12 m/s²',FALSE),
(14,'Joule',TRUE),(14,'Watt',FALSE),(14,'Volt',FALSE),(14,'Ampere',FALSE),
(15,'Newton',TRUE),(15,'Einstein',FALSE),(15,'Tesla',FALSE),(15,'Bohr',FALSE),
(16,'m/s²',TRUE),(16,'m/s',FALSE),(16,'kg',FALSE),(16,'N',FALSE),
(17,'Watt',TRUE),(17,'Volt',FALSE),(17,'Ampere',FALSE),(17,'Joule',FALSE),
(18,'v',TRUE),(18,'a',FALSE),(18,'s',FALSE),(18,'t',FALSE),
(19,'Resistance to motion',TRUE),(19,'Speed',FALSE),(19,'Force',FALSE),(19,'Energy',FALSE),
(20,'Wave',TRUE),(20,'Particle only',FALSE),(20,'Solid',FALSE),(20,'Gas',FALSE);
-- History
INSERT INTO answer_options(question_id,option_text,is_correct) VALUES
(21,'Columbus',TRUE),(21,'Magellan',FALSE),(21,'Cook',FALSE),(21,'Vespucci',FALSE),
(22,'1939',TRUE),(22,'1941',FALSE),(22,'1935',FALSE),(22,'1929',FALSE),
(23,'George Washington',TRUE),(23,'Lincoln',FALSE),(23,'Jefferson',FALSE),(23,'Adams',FALSE),
(24,'Rome',TRUE),(24,'Athens',FALSE),(24,'Paris',FALSE),(24,'Berlin',FALSE),
(25,'General',TRUE),(25,'King',FALSE),(25,'Scientist',FALSE),(25,'Artist',FALSE),
(26,'1947-1991',TRUE),(26,'1939-1945',FALSE),(26,'1914-1918',FALSE),(26,'2000-2020',FALSE),
(27,'China',TRUE),(27,'India',FALSE),(27,'Japan',FALSE),(27,'Korea',FALSE),
(28,'Egyptians',TRUE),(28,'Romans',FALSE),(28,'Greeks',FALSE),(28,'Mayans',FALSE),
(29,'Warriors',TRUE),(29,'Farmers',FALSE),(29,'Traders',FALSE),(29,'Scientists',FALSE),
(30,'England',TRUE),(30,'France',FALSE),(30,'Germany',FALSE),(30,'USA',FALSE);

-- =========================
-- EXAM CENTERS
-- =========================
INSERT INTO exam_centers(user_id,name,address,city,capacity) VALUES
(1,'Center A','123 Main St','CityX',50),
(2,'Center B','456 Elm St','CityY',50);

-- =========================
-- EXAM SESSION STATUS
-- =========================
INSERT INTO exam_session_status(name) VALUES
('Scheduled'),('Completed'),('Cancelled');

-- =========================
-- EXAM SESSIONS
-- =========================
INSERT INTO exam_sessions(center_id,session_date,start_time,end_time,registration_deadline,max_participants,exam_session_status_id) VALUES
(1,'2026-07-01','09:00','12:00','2026-06-25',50,1),
(2,'2026-07-01','09:00','12:00','2026-06-25',50,1);

-- =========================
-- EXAM SESSIONS SUBJECTS
-- =========================
INSERT INTO exam_sessions_subjects(session_id,subject_id,test_id) VALUES
(1,1,1),(1,2,2),(2,3,3);

-- =========================
-- EXAMINEES
-- =========================
INSERT INTO examinees(user_id,passport_number,phone,registration_date) VALUES
(1,'AA12345','111-1111','2026-06-01'),
(2,'BB23456','222-2222','2026-06-01'),
(3,'CC34567','333-3333','2026-06-01');

-- =========================
-- EXAM REGISTRATIONS
-- =========================
INSERT INTO exam_registrations(examinee_id,session_id,registration_date,status) VALUES
(1,1,'2026-06-10','Registered'),
(2,1,'2026-06-10','Registered'),
(3,2,'2026-06-10','Registered');

-- =========================
-- TEST ATTEMPTS
-- =========================
INSERT INTO test_attempts(test_id,exam_registration_id,start_time,end_time) VALUES
(1,1,'2026-07-01 09:00','2026-07-01 09:20'),
(2,2,'2026-07-01 09:00','2026-07-01 09:25'),
(3,3,'2026-07-01 09:00','2026-07-01 09:30');

-- =========================
-- PARTICIPANTS ANSWERS
-- =========================
INSERT INTO participants_answers(attempt_id,question_id,selected_option_id) VALUES
(1,1,2),(1,2,5),(1,3,9),(1,4,13),(1,5,17),
(2,11,41),(2,12,45),(2,13,49),(2,14,53),
(3,21,61),(3,22,65),(3,23,69),(3,24,73);

-- =========================
-- TEST RESULTS
-- =========================
INSERT INTO test_results(attempt_id,total_score,passed,calculated_at) VALUES
(1,5,TRUE,NOW()),
(2,4,TRUE,NOW()),
(3,4,TRUE,NOW());
