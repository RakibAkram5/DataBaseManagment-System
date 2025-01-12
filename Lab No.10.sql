CREATE DATABASE Mydatabase;
USE Mydatabase;

-- Employee Table
CREATE TABLE employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT, 
    employee_name CHAR(20) NOT NULL, 
    department_name CHAR(20) NOT NULL, 
    salary DECIMAL(10,2), 
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employee(employee_id)
);

-- Product Table
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT, 
    product_name CHAR(20) NOT NULL, 
    product_price DECIMAL(10,2)
);

-- Student Table
CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT, 
    student_name CHAR(20) NOT NULL,
    student_age INT
);

-- Project Table
CREATE TABLE project (
    project_id INT PRIMARY KEY AUTO_INCREMENT, 
    project_name CHAR(20) NOT NULL, 
    employee_id INT, 
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

-- Customer Table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT, 
    customer_name CHAR(20) NOT NULL
);

-- Order Table
CREATE TABLE Order_1 (
    order_id INT PRIMARY KEY AUTO_INCREMENT, 
    customer_id INT, 
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Insert 10 rows into each table
-- Employee Table
INSERT INTO employee (employee_name, department_name, salary, manager_id) VALUES
('Alice', 'HR', 50000.00, NULL),
('Bob', 'IT', 60000.00, 1),
('Charlie', 'Finance', 55000.00, 1),
('David', 'Marketing', 45000.00, 2),
('Eve', 'IT', 70000.00, 2),
('Frank', 'HR', 48000.00, NULL),
('Grace', 'Finance', 52000.00, 3),
('Hannah', 'Marketing', 46000.00, 4),
('Ivy', 'IT', 80000.00, 2),
('Jack', 'Finance', 50000.00, 3);

-- Product Table
INSERT INTO product (product_name, product_price) VALUES
('Laptop', 800.00),
('Phone', 500.00),
('Tablet', 300.00),
('Monitor', 200.00),
('Keyboard', 50.00),
('Mouse', 30.00),
('Speaker', 100.00),
('Headphones', 80.00),
('Charger', 25.00),
('Cable', 15.00);

-- Student Table
INSERT INTO student (student_name, student_age) VALUES
('John', 20),
('Emma', 22),
('Liam', 21),
('Olivia', 23),
('Noah', 20),
('Ava', 24),
('William', 21),
('Sophia', 22),
('James', 23),
('Isabella', 20);

-- Project Table
INSERT INTO project (project_name, employee_id) VALUES
('Project A', 1),
('Project B', 2),
('Project C', 3),
('Project D', 4),
('Project E', 5),
('Project F', 6),
('Project G', 7),
('Project H', 8),
('Project I', 9),
('Project J', 10);

-- Customer Table
INSERT INTO customer (customer_name) VALUES
('Customer 1'),
('Customer 2'),
('Customer 3'),
('Customer 4'),
('Customer 5'),
('Customer 6'),
('Customer 7'),
('Customer 8'),
('Customer 9'),
('Customer 10');

-- Order Table
INSERT INTO Order_1 (customer_id) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);
SELECT 
    SUBSTRING_INDEX(employee_name, ' ', 1) AS first_name,
    SUBSTRING_INDEX(employee_name, ' ', -1) AS last_name
FROM 
    employee
WHERE 
    department_name = 'Sales' 
    AND salary > 50000
ORDER BY 
    last_name DESC;
    SELECT 
    product_name, 
    product_price
FROM 
    product
ORDER BY 
    product_price DESC;
    
SELECT 
    student_id, 
    student_name, 
    student_age
FROM 
    student
LIMIT 5;
SELECT 
    e1.employee_id AS employee_id_1,
    e1.employee_name AS employee_name_1,
    e2.employee_id AS employee_id_2,
    e2.employee_name AS employee_name_2,
    e1.manager_id
FROM 
    employee e1
JOIN 
    employee e2
ON 
    e1.manager_id = e2.manager_id
WHERE 
    e1.employee_id != e2.employee_id
ORDER BY 
    e1.manager_id;
SELECT 
    employee.employee_name AS employee_name, 
    project.project_name AS project_name
FROM 
    employee
JOIN 
    project
ON 
    employee.employee_id = project.employee_id;
    SELECT 
    customer.customer_name, 
    order_1.product_name
FROM 

    customer
NATURAL JOIN 
    order_1;

