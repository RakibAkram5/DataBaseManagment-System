create database Lab_No_11;
use Lab_No_11;
create table student(
	student_id int primary key,
    student_name char (20), 
    department_name varchar(20), 
    age int
);
create table course(
	course_id int primary key, 
    student_id int, 
    foreign key (student_id) references student(student_id), 
    course_Name varchar(20), 
    grade char (1)

);
insert into student(student_id,student_name, department_name,age) values 
(1,'Ali','CS',21),
(2,'Sara','EE',22), 
(3,'Ahmad','CS',20), 
(4,'Fatima','ME',24); 
insert into course(course_id,student_id,course_Name,grade) values
(101,1,'Database','A'),
(102,2,'Circuit','B'),
(103,1,'Algorithm','A'),
(104,3,'Mechine Learning','C');

select student.student_name, course.course_Name from student 
join course on student.student_id=course.student_id;
SELECT student.student_name, course.course_Name
FROM student
LEFT JOIN course ON student.student_id = course.student_id;
SELECT course.course_Name, student.student_name
FROM course
LEFT JOIN student ON course.student_id = student.student_id;
SELECT *
FROM student
NATURAL JOIN course;
