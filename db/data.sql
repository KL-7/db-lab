INSERT INTO auditorium_types (id, name) VALUES (1,'lectures-hall');
INSERT INTO auditorium_types (id, name) VALUES (2,'Computer class');
INSERT INTO auditorium_types (id, name) VALUES (3,'Classroom');
INSERT INTO auditorium_types (id, name) VALUES (4,'Laboratory');

INSERT INTO lecturers (id, first_name, middle_name, last_name) VALUES (1,'Ivan','Ivanovich','Ivanov');
INSERT INTO lecturers (id, first_name, middle_name, last_name) VALUES (2,'Petr','Petrovich','Petrov');
INSERT INTO lecturers (id, first_name, middle_name, last_name) VALUES (3,'Dmitrij','Antonovich','Antonov');
INSERT INTO lecturers (id, first_name, middle_name, last_name) VALUES (4,'Sergey','Sergeyevich','Sergeev');
INSERT INTO lecturers (id, first_name, middle_name, last_name) VALUES (5,'Yurij','Yurjevich','Yurov');

INSERT INTO subjects (id, name) VALUES (1, 'Math');
INSERT INTO subjects (id, name) VALUES (2, 'Physics');
INSERT INTO subjects (id, name) VALUES (3, 'Programming');
INSERT INTO subjects (id, name) VALUES (4, 'Phylosophy');
INSERT INTO subjects (id, name) VALUES (5, 'Sociology');

INSERT INTO auditoria (id, auditorium_number, seats_number, building_number, auditorium_type_id) VALUES (1,1,20,1,1);
INSERT INTO auditoria (id, auditorium_number, seats_number, building_number, auditorium_type_id) VALUES (2,2,30,1,1);
INSERT INTO auditoria (id, auditorium_number, seats_number, building_number, auditorium_type_id) VALUES (3,3,15,1,3);
INSERT INTO auditoria (id, auditorium_number, seats_number, building_number, auditorium_type_id) VALUES (4,1,10,2,4);
INSERT INTO auditoria (id, auditorium_number, seats_number, building_number, auditorium_type_id) VALUES (5,2,25,2,2);

INSERT INTO courses (id, lecturer_id, subject_id, hours_per_week, students_number) VALUES (1,2,1,8,15);
INSERT INTO courses (id, lecturer_id, subject_id, hours_per_week, students_number) VALUES (2,1,2,8,10);
INSERT INTO courses (id, lecturer_id, subject_id, hours_per_week, students_number) VALUES (3,2,3,4,20);
INSERT INTO courses (id, lecturer_id, subject_id, hours_per_week, students_number) VALUES (4,3,4,2,10);
INSERT INTO courses (id, lecturer_id, subject_id, hours_per_week, students_number) VALUES (5,3,5,2,10);
INSERT INTO courses (id, lecturer_id, subject_id, hours_per_week, students_number) VALUES (6,4,2,2,15);

INSERT INTO lectures (id, course_id, auditorium_id, start_time, end_time, weekday) VALUES (5,3,1,'15:00:00','17:00:00','Mo');
INSERT INTO lectures (id, course_id, auditorium_id, start_time, end_time, weekday) VALUES (6,5,2,'13:00:00','15:00:00','Tu');
INSERT INTO lectures (id, course_id, auditorium_id, start_time, end_time, weekday) VALUES (7,1,1,'11:00:00','13:00:00','Th');
INSERT INTO lectures (id, course_id, auditorium_id, start_time, end_time, weekday) VALUES (8,1,3,'13:00:00','15:00:00','Fr');
INSERT INTO lectures (id, course_id, auditorium_id, start_time, end_time, weekday) VALUES (9,2,3,'15:00:00','17:00:00','Mo');
INSERT INTO lectures (id, course_id, auditorium_id, start_time, end_time, weekday) VALUES (10,2,3,'11:00:00','13:00:00','Tu');
INSERT INTO lectures (id, course_id, auditorium_id, start_time, end_time, weekday) VALUES (11,2,4,'13:00:00','15:00:00','We');
INSERT INTO lectures (id, course_id, auditorium_id, start_time, end_time, weekday) VALUES (12,2,3,'11:00:00','13:00:00','Fr');
INSERT INTO lectures (id, course_id, auditorium_id, start_time, end_time, weekday) VALUES (13,3,1,'13:00:00','15:00:00','Mo');
INSERT INTO lectures (id, course_id, auditorium_id, start_time, end_time, weekday) VALUES (14,3,5,'13:00:00','15:00:00','Th');
INSERT INTO lectures (id, course_id, auditorium_id, start_time, end_time, weekday) VALUES (15,4,1,'13:00:00','15:00:00','Mo');
INSERT INTO lectures (id, course_id, auditorium_id, start_time, end_time, weekday) VALUES (16,5,1,'15:00:00','17:00:00','Th');
INSERT INTO lectures (id, course_id, auditorium_id, start_time, end_time, weekday) VALUES (17,6,2,'13:00:00','15:00:00','We');