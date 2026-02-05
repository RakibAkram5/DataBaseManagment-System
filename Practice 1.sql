CREATE DATABASE university_db;
USE university_db;

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    department VARCHAR(50),
    semester INT
);
Create Table Teacher(
	teacher_id INT primary Key,
    name varchar(50),
    email varchar(50),
    department varchar(50)
);
create table course(
 course_id INT primary Key, 
 course_name varchar(50),
 credit_hours INT, 
 teacher_id INT, 
 foreign key(teacher_id) references Teacher(teacher_id)
);
Create table Enrollment(
	enrollment_id INT primary Key, 
    student_id INT, 
    course_id INT, 
    foreign key (student_id) references Student(student_id),
    foreign key (course_id) references Course(course_id)
);
insert into Student values (1,'Rakib','rakibakram@gmail.com','BSCS','6');
INSERT INTO Teacher VALUES (101, 'Sir Ali', 'ali@uni.edu', 'CS');
INSERT INTO Course VALUES (501, 'Database Systems', 3, 101);
INSERT INTO Enrollment VALUES (1, 1, 501);
select *from Course;