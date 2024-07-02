-- Question 1.
SHOW DATABASES;

-- Question 2.
USE world;

-- Question 3.
SHOW tables;

-- Question 4.
SHOW COLUMNS FROM city;

-- Question 5.
SHOW CREATE TABLE city;

-- Question 6.
CREATE DATABASE bank;
USE bank;

-- Question 7.
CREATE TABLE deposit(
	AccNum INT,
    Name VARCHAR(30),
    BranchName VARCHAR(5),
    Balance DECIMAL(8, 2)
);

INSERT INTO deposit VALUES
	(100, "Tom", "B1", 80000.50),
	(101, "Rose", "B1", 55006.12),
	(102, "Zac", "B2", 60052.89),
	(103, "Jose", "B3", 75008.72),
	(104, "Tim", "B2", 48526.32),
	(105, "Mary", "B1", 15689.90);
    
-- Question 8.
CREATE TABLE loan(
	LoanNum INT,
	Name VARCHAR(30),
	BranchName VARCHAR(5),
	Amount DECIMAL(6, 2)
);

INSERT INTO loan VALUES
	(200, "Tom", "B1", 500.00),
	(201, "Rose", "B1", 700.00),
	(202, "Zac", "B2", 900.00),
	(203, "Jose", "B3", 300.00),
	(204, "Tim", "B2", 800.00),
	(205, "Mary", "B1", 450.00);

-- Question 9.
SELECT * FROM deposit;

-- Question 10.
SELECT * FROM loan;
