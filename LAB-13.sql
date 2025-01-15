CREATE DATABASE StudentEmployeeProductDB;
USE StudentEmployeeProductDB;

-- Creating the Students table
CREATE TABLE StudentDetails (
    studentID INT PRIMARY KEY,
    studentName VARCHAR(100),
    studentDept VARCHAR(100),
    studentCGPA DECIMAL(3, 2)
);

-- Inserting data into the Students table
INSERT INTO StudentDetails (studentID, studentName, studentDept, studentCGPA) VALUES
(1, 'Alice', 'Computer Science', 3.9),
(2, 'Bob', 'Electrical Engineering', 2.8),
(3, 'Charlie', 'Computer Science', 3.4),
(4, 'David', 'Mechanical Engineering', 2.5),
(5, 'Eve', 'Computer Science', 3.7);

-- Creating the Employees table
CREATE TABLE EmployeeRecords (
    empID INT PRIMARY KEY,
    empName VARCHAR(100),
    empDept VARCHAR(100),
    baseSalary DECIMAL(10, 2),
    extraAllowance DECIMAL(10, 2)
);

-- Inserting data into the Employees table
INSERT INTO EmployeeRecords (empID, empName, empDept, baseSalary, extraAllowance) VALUES
(101, 'John Doe', 'Finance', 50000, 10000),
(102, 'Jane Smith', 'IT', 60000, 12000),
(103, 'Mike Johnson', 'Finance', 55000, 8000),
(104, 'Emily Davis', 'HR', 45000, 7000),
(105, 'Robert Brown', 'IT', 65000, 15000);

-- Creating the Departments table
CREATE TABLE DepartmentInfo (
    deptID INT PRIMARY KEY,
    deptName VARCHAR(100)
);

-- Inserting data into the Departments table
INSERT INTO DepartmentInfo (deptID, deptName) VALUES
(1, 'Finance'),
(2, 'IT'),
(3, 'HR'),
(4, 'Mechanical Engineering');

-- Creating the Products table
CREATE TABLE ProductCatalog (
    prodID INT PRIMARY KEY,
    prodName VARCHAR(100),
    prodCategory VARCHAR(100),
    prodPrice DECIMAL(10, 2)
);

-- Inserting data into the Products table
INSERT INTO ProductCatalog (prodID, prodName, prodCategory, prodPrice) VALUES
(1, 'Laptop', 'Electronics', 1200),
(2, 'Mobile Phone', 'Electronics', 800),
(3, 'Tablet', 'Electronics', 600),
(4, 'Chair', 'Furniture', 150),
(5, 'Table', 'Furniture', 300);

-- Creating a view for students with CGPA above 3.0
CREATE VIEW HighCGPAStudents AS
SELECT studentID, studentName, studentCGPA
FROM StudentDetails
WHERE studentCGPA > 3.0;

-- Displaying the HighCGPAStudents view
SELECT * FROM HighCGPAStudents;

-- Creating a view for employee salary details
CREATE VIEW EmployeeTotalSalary AS
SELECT 
    empID, 
    empName, 
    empDept, 
    (baseSalary + extraAllowance) AS totalPay
FROM EmployeeRecords;

-- Displaying the EmployeeTotalSalary view
SELECT * FROM EmployeeTotalSalary;

-- Creating a view with student grades
CREATE VIEW StudentGrades AS
SELECT 
    studentID, 
    studentName, 
    CASE 
        WHEN studentCGPA >= 3.7 THEN 'Excellent'
        WHEN studentCGPA >= 3.0 THEN 'Good'
        ELSE 'Average'
    END AS gradeCategory
FROM StudentDetails;

-- Displaying the StudentGrades view
SELECT * FROM StudentGrades;

-- Finding the student with the highest CGPA
SELECT studentName
FROM StudentDetails
WHERE studentCGPA = (
    SELECT MAX(studentCGPA) 
    FROM StudentDetails
);

-- Finding employees earning above the average total salary
SELECT empName
FROM EmployeeRecords
WHERE (baseSalary + extraAllowance) > (
    SELECT AVG(baseSalary + extraAllowance)
    FROM EmployeeRecords
);

-- Finding the department with the highest total salary
SELECT empDept
FROM EmployeeRecords
GROUP BY empDept
HAVING SUM(baseSalary + extraAllowance) = (
    SELECT MAX(departmentTotal)
    FROM (
        SELECT empDept, SUM(baseSalary + extraAllowance) AS departmentTotal
        FROM EmployeeRecords
        GROUP BY empDept
    ) AS DeptSalaries
);

-- Finding students performing above the departmental average CGPA
SELECT studentName
FROM StudentDetails s
WHERE studentCGPA > (
    SELECT AVG(studentCGPA)
    FROM StudentDetails
    WHERE studentDept = s.studentDept
);

-- Finding employees earning above their department's average
SELECT empName
FROM EmployeeRecords e
WHERE (e.baseSalary + e.extraAllowance) > (
    SELECT AVG(baseSalary + extraAllowance)
    FROM EmployeeRecords
    WHERE empDept = e.empDept
);

-- Finding products priced above their category average
SELECT prodName
FROM ProductCatalog p
WHERE prodPrice > (
    SELECT AVG(prodPrice)
    FROM ProductCatalog
    WHERE prodCategory = p.prodCategory
);
