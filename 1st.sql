create database Employee;
create Table Employee(
EmployeeID varchar(10) primary Key,
Name varchar(50) Not Null,
Age int, 
Department INT,
DepartmentID varchar(10),
constraint FK_Department foreign key(DepartmentID) references(department)
)