CREATE DATABASE complexqueries;
USE complexqueries;

CREATE TABLE Country (
	Code CHAR(3),
    Name VARCHAR(15),
    Continent VARCHAR(15),
    Independence DATE,
    PRIMARY KEY (Code)
);

CREATE TABLE CountryLanguage (
	ID SMALLINT UNSIGNED AUTO_INCREMENT,
	CountryCode CHAR(3),
    Language VARCHAR(15),
    IsOfficial CHAR(1),
    Percentage DECIMAL(3,1),
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryCode) REFERENCES Country (Code)
);

INSERT INTO Country VALUES
	('ABW', 'Aruba', 'North America', '1986-01-01'),
    ('AFG', 'Afghanistan', 'Asia', '1919-08-08'),
    ('AGO', 'Angola', 'Africa', '1975-11-11'),
    ('ALB', 'Albania', 'Europe', '1912-11-28'),
    ('AND', 'Andorra', 'Europe', '1994-03-14'),
    ('COK', 'Cook Islands', 'Oceania', '1965-08-04'),
    ('COL', 'Colombia', 'South America', '1810-07-20'),
    ('ARG', 'Argentina', 'South America', '1816-07-09'),
    ('BLZ', 'Belize', 'North America', '1981-09-21'),
    ('BRA', 'Brazil', 'South America', '1822-09-07'),
    ('ARW', 'Guyana', 'South America', '1966-05-26');

INSERT INTO CountryLanguage (CountryCode, Language, IsOfficial, Percentage) VALUES
	('ABW', 'Dutch', 'T', 5.3),
    ('AFG', 'Balochi', 'F', 0.9),
    ('AGO', 'Kongo', 'F', 13.2),
    ('ALB', 'Albanian', 'T', 97.9),
    ('AND', 'Catalan', 'T', 32.3),
    ('COK', 'Maori', 'T', 0.4),
    ('COK', 'English', 'F', 23.6),
    ('COL', 'Caribbean', 'F', 15.8),
    ('COL', 'Chibcha', 'F', 0.3),
    ('ARG', 'Spanish', 'T', 96.8),
    ('BLZ', 'Spanish', 'F', 31.6),
    ('BRA', 'Portuguese', 'T', 97.5),
    ('ARW', 'Arawak', 'F', 4.9);
    
-- Question 1 --
SELECT CountryCode 
FROM CountryLanguage
WHERE Language IN ('Spanish', 'Arawak', 'Albanian')
ORDER BY CountryCode DESC;

-- Question 2 --
SELECT DISTINCT Language 
FROM CountryLanguage
WHERE Percentage BETWEEN 30 AND 100;

-- Question 3 --
SELECT * 
FROM CountryLanguage
WHERE Language LIKE '%an%';

-- Question 4 --
SELECT Name 
FROM Country
WHERE Independence > '1984-01-01' OR MONTH(Independence) = 11;

-- Question 5 --
SELECT CountryCode, Language, AVG(Percentage) AS avg_percentage
FROM CountryLanguage
GROUP BY CountryCode, Language
HAVING avg_percentage < 40.5
ORDER BY Language ASC;

-- Question 6 --
SELECT CountryLanguage.*
FROM CountryLanguage
INNER JOIN Country ON CountryLanguage.CountryCode = Country.Code;

-- Question 7 --
SELECT CountryLanguage.*
FROM CountryLanguage
RIGHT JOIN Country ON CountryLanguage.CountryCode = Country.Code;

-- Question 8 --
SELECT CountryLanguage.CountryCode, CountryLanguage.Language, Country.Name, Country.Continent
FROM CountryLanguage
CROSS JOIN Country;

-- Question 9 --
SELECT CountryCode, Language, Percentage 
FROM CountryLanguage
WHERE Percentage <= (SELECT Percentage 
					FROM CountryLanguage
					WHERE CountryCode = 'AND' AND IsOfficial = 'T');

-- Question 10 --
SELECT cl.CountryCode, cl.Language, cl.Percentage
FROM CountryLanguage AS CL
INNER JOIN CountryLanguage AS CL2 ON CL.CountryCode=CL2.CountryCode
INNER JOIN CountryLanguage AS CL3 ON CL.Language=CL3.Language
INNER JOIN CountryLanguage AS CL4 ON CL.Percentage=CL4.Percentage
WHERE CL.CountryCode = 'AND' AND CL.IsOfficial = 'T';