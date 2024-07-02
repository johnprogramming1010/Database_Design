-- Question 1.
CREATE DATABASE insurance;
USE insurance;

-- Question 2.
CREATE TABLE employee (
	ID INT UNSIGNED AUTO_INCREMENT,
	Name VARCHAR(30) NOT NULL,
    Salary DECIMAL(9,2) NOT NULL CHECK (Salary >= 10000.00 AND Salary <= 90000.00),
    State CHAR(2) NOT NULL,
    PRIMARY KEY(ID)
);

-- Question 3.
INSERT INTO employee (ID, Name, Salary, State) VALUES
	(1, 'Lisa Ellison', 60000.57, 'GA'),
    (2, 'Sam Snead', 55856.75, 'FL'),
	(3, 'Maria Rodriguez', 45200.12, 'CA'),
	(4, 'Edward John', 35000.74, 'NY'),
	(5, 'Mary Collins', 75900.36, 'TX'),
	(6, 'Jose David', 18500.95, 'GA');

-- Question 4.
CREATE TABLE family (
	FamilyID INT UNSIGNED,
    Relationship VARCHAR(20) NOT NULL,
    BirthDate DATE NOT NULL CHECK (BirthDate >= '1991-01-02'),
    EmployeeID INT UNSIGNED NOT NULL,
    primary key(FamilyID, Relationship),
    CHECK (Relationship IN ('Spouse', 'Son', 'Daughter')),
    CHECK (BirthDate >= '1991-01-02'),
    FOREIGN KEY (EmployeeID) REFERENCES employee (ID)
);

-- Question 5.
INSERT INTO family (FamilyID, Relationship, BirthDate, EmployeeID) VALUES 
	(100, 'Spouse', '1992-12-24', 5),
    (101, 'Daughter', '2000-01-06', 3),
	(102, 'Son', '2002-05-09', 4),
	(103, 'Son', '2001-11-28', 2),
	(104, 'Daughter', '2004-08-19', 6),
	(105, 'Spouse', '1991-06-21', 1);

-- Question 6.
SELECT Name, State FROM employee
WHERE (Salary BETWEEN 50000.00 AND 70000.00) OR (State = 'GA');

-- Question 7.
UPDATE employee SET Name = 'Sara Thomson', Salary = 80000.54 WHERE ID = 5;

-- Question 8.
DELETE FROM family WHERE FamilyID = 103;

-- Question 9.
DELETE FROM family WHERE Relationship IN ('Spouse', 'Son');

-- Question 10.
DROP TABLE family;

CREATE TABLE family (
	FamilyID INT(8) UNSIGNED NOT NULL,
	Relationship VARCHAR(20) NOT NULL,
	BirthDate DATE NOT NULL,
	EmployeeID INT(8) UNSIGNED NOT NULL,
	PRIMARY KEY (FamilyID, Relationship),
	FOREIGN KEY (EmployeeID) REFERENCES employee(ID) ON DELETE CASCADE
);
