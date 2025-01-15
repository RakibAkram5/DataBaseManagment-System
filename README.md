# DBMS Labs and Project (MySQL)

## Table of Contents
1. [Introduction to MySQL](#introduction-to-mysql)
2. [Database Design](#database-design)
3. [SQL Queries](#sql-queries)
4. [Normalization](#normalization)
5. [Transactions and Concurrency Control](#transactions-and-concurrency-control)
6. [Indexes](#indexes)
7. [Stored Procedures and Triggers](#stored-procedures-and-triggers)
8. [Backup and Recovery](#backup-and-recovery)

---

## Introduction to MySQL

MySQL is an open-source relational database management system (RDBMS). It uses Structured Query Language (SQL) for managing databases. It is known for its reliability, speed, and flexibility.

### Key Concepts:
- **Database**: A collection of related data.
- **Table**: A set of rows (records), with each row representing a record.
- **Column**: A single attribute of a record in the table.
- **Primary Key**: A unique identifier for a record in a table.

### Basic Commands:
- **Create Database**: `CREATE DATABASE dbname;`
- **Create Table**: `CREATE TABLE table_name (column1 datatype, column2 datatype, ...);`
- **Select**: `SELECT * FROM table_name;`

---

## Database Design

Database design involves creating tables, defining relationships, and organizing data efficiently.

### Key Concepts:
- **Entity-Relationship (ER) Model**: A graphical representation of entities and their relationships.
- **Foreign Key**: A field in one table that links to the primary key of another table.
- **Relationships**: One-to-one, one-to-many, and many-to-many relationships.

---

## SQL Queries

SQL is used to manage and manipulate data in a database. 

### Types of SQL Queries:
- **DDL (Data Definition Language)**: 
  - `CREATE`, `ALTER`, `DROP`
- **DML (Data Manipulation Language)**:
  - `SELECT`, `INSERT`, `UPDATE`, `DELETE`
- **DCL (Data Control Language)**:
  - `GRANT`, `REVOKE`
- **TCL (Transaction Control Language)**:
  - `COMMIT`, `ROLLBACK`, `SAVEPOINT`

### Examples:
- **Select Data**: `SELECT * FROM employees;`
- **Insert Data**: `INSERT INTO employees (name, age) VALUES ('John Doe', 30);`
- **Update Data**: `UPDATE employees SET age = 31 WHERE name = 'John Doe';`
- **Delete Data**: `DELETE FROM employees WHERE name = 'John Doe';`

---

## Normalization

Normalization is the process of organizing data to minimize redundancy and dependency. It involves dividing a database into smaller, related tables.

### Normal Forms:
- **1st Normal Form (1NF)**: Each column contains atomic (indivisible) values.
- **2nd Normal Form (2NF)**: Eliminate partial dependency (i.e., every non-key attribute is fully functionally dependent on the primary key).
- **3rd Normal Form (3NF)**: Eliminate transitive dependency (non-key attributes are not dependent on other non-key attributes).
- **BCNF (Boyce-Codd Normal Form)**: Stronger version of 3NF where every determinant is a candidate key.

---

## Transactions and Concurrency Control

A transaction is a sequence of SQL operations that are executed as a single unit. Concurrency control ensures that multiple transactions do not interfere with each other.

### Key Concepts:
- **ACID Properties**:
  - **Atomicity**: All operations in a transaction are completed successfully or none.
  - **Consistency**: The database moves from one valid state to another.
  - **Isolation**: Transactions are isolated from each other.
  - **Durability**: Once committed, the changes are permanent.
- **Locking**: Mechanism to ensure that data is not accessed simultaneously by multiple transactions.

---

## Indexes

Indexes are used to speed up query processing by providing a quick lookup of data. They are created on columns that are frequently used in `WHERE`, `JOIN`, or `ORDER BY` clauses.

### Key Concepts:
- **Primary Index**: Automatically created when a primary key is defined.
- **Secondary Index**: Manually created for faster search.
- **Unique Index**: Ensures that all values in a column are unique.
- **Full-Text Index**: Used for text searching.

### Creating an Index:
```sql
CREATE INDEX index_name ON table_name (column_name);
