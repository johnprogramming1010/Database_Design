CREATE DATABASE UNIVERSITY;
USE UNIVERSITY;

CREATE TABLE person (
	person_id SMALLINT UNSIGNED,
    full_name VARCHAR(20) NOT NULL,
    social_security_number INT UNSIGNED NOT NULL,
    email_address VARCHAR(20) NOT NULL,
    salary_amount DECIMAL(5,2) NOT NULL,
    PRIMARY KEY(person_id),
    FOREIGN KEY (salary_amount) REFERENCES salary(salary_amount)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
);

CREATE TABLE student (
	person_id SMALLINT UNSIGNED,
    picture BLOB NOT NULL,
    major_name VARCHAR(20) NOT NULL,
    PRIMARY KEY(person_id), 
    FOREIGN KEY(person_id) REFERENCES person(person_id)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE faculty (
    person_id SMALLINT UNSIGNED,
    dept_code VARCHAR(20) NOT NULL,
    dept_name VARCHAR(20) NOT NULL,
	PRIMARY KEY(person_id),
    FOREIGN KEY(person_id) REFERENCES person(person_id)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY(dept_name) REFERENCES department(dept_name)
		ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

