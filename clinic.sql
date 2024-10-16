CREATE DATABASE IF NOT EXISTS `clinic`;
USE `clinic`;

CREATE TABLE departments(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50)
);

INSERT INTO departments(name) VALUES('Therapy'), ('Support'), ('Managment'), ('Other');

CREATE TABLE employees(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
job_title VARCHAR(50) NOT NULL,
department_id INT NOT NULL,
salary DOUBLE NOT NULL,
CONSTRAINT fk_department_id FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO employees(first_name, last_name, job_title, department_id, salary)
VALUES 
('Maria', 'Anderson', 'Therapist', 1, 400.00),
('Anna', 'Johansson', 'Acupuncturist', 1, 830.00),
('Ingrid', 'Petterson', 'Technician', 2, 1140.00),
('Lena', 'Magnusson', 'Supervisor', 3, 1200.00),
('Sandy', 'Petterson', 'Dentist', 4, 1400.23),
('Max', 'Rersson', 'Therapist', 1, 992.00),
('Anders', 'Tegnell', 'Epidemiologist', 4, 1340.00),
('Margareta', 'Olsson', 'Medical director', 3, 2500.00),
('Daniel', 'Nilsson', 'Nutrition Technician', 4, 2600.00);

CREATE TABLE rooms(
id INT PRIMARY KEY AUTO_INCREMENT,
occupation VARCHAR(30)
);

INSERT INTO rooms(occupation) VALUES('free'), ('occupied'), ('free'), ('free'), ('occupied');

CREATE TABLE patients(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
room_id INT NOT NULL
);

INSERT INTO patients(first_name, last_name, room_id)
VALUES 
('Birgitta', 'Larsson', 1),
('Marianne', 'Lindeberg', 3),
('Bertil', 'Daglberg', 2),
('Filip', 'Willhelm',  3),
('Nikolay', 'Nikolaev', 4);
-- ('Max', 'Rersson', 'Therapist', 1, 992.00),
-- ('Anders', 'Tegnell', 'Epidemiologist', 4, 1340.00),
-- ('Margareta', 'Olsson', 'Medical director', 3, 2500.00),
-- ('Daniel', 'Nilsson', 'Nutrition Technician', 4, 2600.00);


USE `clinic`;

SELECT CONCAT(first_name, ' ', last_name) as full_name,  job_title, salary
FROM employees
WHERE salary > 1000 
order by id;

SET SQL_SAFE_UPDATES = 0;
UPDATE employees
SET salary = round(1.1 * salary, 2)
WHERE job_title = "Dentist";

SET SQL_SAFE_UPDATES = 1;

SELECT CONCAT(first_name, ' ', last_name) as full_name,  job_title, salary
FROM employees
WHERE salary > 1000 
order by salary;

DELETE FROM employees
WHERE department_id in (3,4);

SELECT *
FROM employees
WHERE department_id in (3,4)
order by id;
