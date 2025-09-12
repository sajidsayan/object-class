-- 1. Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    City VARCHAR(50),
    Country VARCHAR(50),
    Email VARCHAR(100)
);

-- 2. Insert sample data
INSERT INTO Customers (CustomerID, FirstName, LastName, City, Country, Email) VALUES
(1, 'Sajid', 'Ahmed', 'Chattogram', 'Bangladesh', 'sajid.ahmed@example.com'),
(2, 'Ayesha', 'Rahman', 'Dhaka', 'Bangladesh', 'ayesha.rahman@example.com'),
(3, 'John', 'Smith', 'London', 'UK', 'john.smith@example.com'),
(4, 'Sara', 'Khan', 'Karachi', 'Pakistan', 'sara.khan@example.com'),
(5, 'Samira', 'Akter', 'Sylhet', 'Bangladesh', 'samira.akter@example.com'),
(6, 'James', 'Brown', 'London', 'UK', 'james.brown@example.com'),
(7, 'Shahid', 'Hossain', 'Dhaka', 'Bangladesh', 'shahid.hossain@example.com'),
(8, 'Sophia', 'Begum', 'Chattogram', 'Bangladesh', 'sophia.begum@example.com'),
(9, 'Michael', 'Johnson', 'New York', 'USA', 'michael.johnson@example.com'),
(10, 'Sadia', 'Noor', 'Sylhet', 'Bangladesh', 'sadia.noor@example.com');

-- 3. Queries

-- Q1: Find customers whose first name starts with 'S'
SELECT *
FROM Customers
WHERE FirstName LIKE 'S%';

-- Q2: Find customers whose last name ends with 'n'
SELECT *
FROM Customers
WHERE LastName LIKE '%n';

-- Q3: Find customers whose email contains 'example'
SELECT *
FROM Customers
WHERE Email LIKE '%example%';

-- Q4: List all distinct cities
SELECT DISTINCT City
FROM Customers;

-- Q5: List all distinct countries in descending order
SELECT DISTINCT Country
FROM Customers
ORDER BY Country DESC;

-- Q6: Find customers from Bangladesh whose first name starts with 'S'
SELECT *
FROM Customers
WHERE Country = 'Bangladesh'
  AND FirstName LIKE 'S%';

-- Q7: Find customers whose city name contains 'a' (case-insensitive)
SELECT *
FROM Customers
WHERE City LIKE '%a%';

-- Q8: Show all customers sorted by LastName (A–Z)
SELECT *
FROM Customers
ORDER BY LastName ASC;

-- Q9: Show all customers sorted by Country (A–Z) then FirstName (Z–A)
SELECT *
FROM Customers
ORDER BY Country ASC, FirstName DESC;

-- Q10: Find distinct cities from Bangladesh only
SELECT DISTINCT City
FROM Customers
WHERE Country = 'Bangladesh';
