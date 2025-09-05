-- Create sample database
CREATE DATABASE company_sales;
USE company_sales;

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE,
    region VARCHAR(50)
);

-- Create sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    sale_amount DECIMAL(10, 2),
    sale_date DATE,
    product_category VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert sample data
INSERT INTO employees (first_name, last_name, department, salary, hire_date, region) VALUES
('John', 'Doe', 'Sales', 50000.00, '2020-01-15', 'North'),
('Jane', 'Smith', 'Sales', 55000.00, '2019-03-20', 'South'),
('Mike', 'Johnson', 'IT', 60000.00, '2021-05-10', 'East'),
('Sarah', 'Wilson', 'IT', 62000.00, '2018-11-30', 'West'),
('David', 'Brown', 'HR', 48000.00, '2022-02-25', 'North'),
('Emily', 'Davis', 'HR', 52000.00, '2020-07-12', 'South'),
('Robert', 'Miller', 'Sales', 58000.00, '2019-09-05', 'North'),
('Lisa', 'Anderson', 'IT', 65000.00, '2021-01-20', 'East'),
('Tom', 'Wilson', 'Marketing', 53000.00, '2020-03-15', 'West'),
('Anna', 'Taylor', 'Marketing', 56000.00, '2021-08-10', 'South');

INSERT INTO sales (employee_id, sale_amount, sale_date, product_category) VALUES
(1, 1500.00, '2024-01-15', 'Electronics'),
(1, 2000.00, '2024-01-20', 'Furniture'),
(2, 3000.00, '2024-01-18', 'Electronics'),
(2, 2500.00, '2024-01-22', 'Clothing'),
(3, 1000.00, '2024-01-19', 'Books'),
(4, 3500.00, '2024-01-21', 'Electronics'),
(7, 4000.00, '2024-01-16', 'Furniture'),
(7, 1800.00, '2024-01-23', 'Electronics'),
(1, 2200.00, '2024-02-01', 'Clothing'),
(2, 3100.00, '2024-02-05', 'Electronics'),
(8, 2700.00, '2024-02-10', 'Books'),
(9, 1900.00, '2024-02-15', 'Clothing'),
(10, 3200.00, '2024-02-20', 'Electronics'),
(7, 1500.00, '2024-03-01', 'Books'),
(2, 2800.00, '2024-03-05', 'Furniture');
