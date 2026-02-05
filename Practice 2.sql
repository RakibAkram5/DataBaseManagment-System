CREATE DATABASE customers_db;
USE customers_db;

-- Customers Table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(50),
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Orders Table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    amount DOUBLE NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Addresses Table
CREATE TABLE addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    street VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50),
    zip_code INT,
    country VARCHAR(50) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- Insert 10 customers
INSERT INTO customers (first_name, last_name, email, phone, date_of_birth) VALUES
('Rakib', 'Akram', 'rakib@example.com', '03001234567', '2002-05-15'),
('Ameena', 'Khan', 'ameena@example.com', '03007654321', '2001-08-22'),
('Haseeb', 'Ali', 'haseeb@example.com', '03009876543', '2000-12-10'),
('Ayesha', 'Ajmal', 'ayesha@example.com', '03005556677', '2002-09-09'),
('Rafay', 'Imran', 'rafay@example.com', '03003334455', '2001-03-18'),
('Talha', 'Shoail', 'talha@example.com', '03007778899', '1999-07-30'),
('Khadija', 'Irshad', 'khadija@example.com', '03002223344', '2000-11-05'),
('Abdullah', 'Ahmed', 'abdullah@example.com', '03009998877', '2002-02-14'),
('Umair', 'Sufiyan', 'umair@example.com', '03006667788', '2001-06-21'),
('Arham', 'Sufiyan', 'arham@example.com', '03001112233', '2002-01-10');

-- Insert 10 orders (linked to customers)
INSERT INTO orders (customer_id, order_date, amount, status) VALUES
(1, '2026-01-05', 150.50, 'Completed'),
(2, '2026-01-10', 200.00, 'Pending'),
(3, '2026-01-12', 75.25, 'Completed'),
(4, '2026-01-15', 300.00, 'Cancelled'),
(5, '2026-01-18', 50.00, 'Completed'),
(6, '2026-01-20', 120.75, 'Pending'),
(7, '2026-01-22', 220.00, 'Completed'),
(8, '2026-01-25', 90.50, 'Pending'),
(9, '2026-01-28', 400.00, 'Completed'),
(10, '2026-01-30', 180.00, 'Completed');

-- Insert 10 addresses (linked to customers)
INSERT INTO addresses (customer_id, street, city, state, zip_code, country) VALUES
(1, '123 Main St', 'Lahore', 'Punjab', 54000, 'Pakistan'),
(2, '45 Park Avenue', 'Karachi', 'Sindh', 74000, 'Pakistan'),
(3, '78 Elm Street', 'Islamabad', 'ICT', 44000, 'Pakistan'),
(4, '90 Lake View', 'Lahore', 'Punjab', 54100, 'Pakistan'),
(5, '12 Garden Road', 'Faisalabad', 'Punjab', 38000, 'Pakistan'),
(6, '34 River Street', 'Multan', 'Punjab', 60000, 'Pakistan'),
(7, '56 Hilltop Ave', 'Peshawar', 'KPK', 25000, 'Pakistan'),
(8, '89 Sunset Blvd', 'Quetta', 'Balochistan', 87300, 'Pakistan'),
(9, '23 Ocean Drive', 'Karachi', 'Sindh', 74400, 'Pakistan'),
(10, '67 Maple Street', 'Islamabad', 'ICT', 44100, 'Pakistan');

select *from orders;
select *from customers;