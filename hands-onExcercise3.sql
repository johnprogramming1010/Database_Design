-- Question 1.
CREATE DATABASE summary;
USE summary;

CREATE TABLE cars (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Make VARCHAR(15),
    Model VARCHAR(10),
    Type VARCHAR(20),
    Year INT UNSIGNED,
    Price DECIMAL(7,0)
);

-- Question 2.
INSERT INTO cars (Make, Model, Type, Year, Price) 
VALUES 
    ('Toyota', 'Camry', 'sedan', 2015, 9800),
    ('Ford', 'Escape', 'crossover', 2015, 15900),
    ('Honda', 'Civic', 'sedan', 2016, 10200),
    ('Volkswagen', 'Golf', 'compact', 2014, 8800),
    ('Toyota', 'RAV4', 'crossover', 2016, 12800),
    ('Toyota', '4Runner', 'suv', NULL, 16900),
    ('Honda', 'CR-V', 'crossover', 2016, 17900);
    
-- Question 3.
SELECT COUNT(*) 
FROM cars;

-- Question 4.
SELECT COUNT(Year) 
FROM cars;

-- Question 5.
SELECT MIN(Price) 
FROM cars;

-- Question 6.
SELECT MAX(Price) 
FROM cars;

-- Question 7.
SELECT SUM(Price) 
FROM cars;

-- Question 8.
SELECT AVG(Price) 
FROM cars;

-- Question 9.
SELECT COUNT(*) 
FROM cars 
WHERE Year = 2015;

-- Question 10.
SELECT SUM(Price) 
FROM cars 
WHERE Price < 10000;

-- Question 11.
SELECT Type, SUM(Price) AS TotalPrice 
FROM cars 
GROUP BY Type;

-- Question 12.
SELECT Type, Year, SUM(Price) AS TotalPrice 
FROM cars 
GROUP BY Type, Year;

-- Question 13.
SELECT Type, SUM(Price) AS TotalPrice 
FROM cars 
GROUP BY Type 
HAVING TotalPrice < 10000;

-- Question 14.
SELECT Type, Year, SUM(Price) AS TotalPrice 
FROM cars 
GROUP BY Type, Year 
HAVING TotalPrice < 10000 
ORDER BY Year ASC;