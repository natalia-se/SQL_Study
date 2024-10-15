-- create
CREATE TABLE COUNTRIES (
  country_id INT NOT NULL PRIMARY KEY,
  country_name varchar(70),
  region_id int NOT NULL UNIQUE
);

-- MySQL
-- CREATE TABLE DUP_COUNTRIES LIKE COUNTRIES;
-- SQL Server
SELECT *
INTO DUP_COUNTRIES
FROM COUNTRIES
WHERE 1 = 0;

-- insert
INSERT INTO COUNTRIES(country_id,country_name,region_id) VALUES (1, 'Sweden', 1);

INSERT INTO DUP_COUNTRIES(country_id,country_name,region_id) VALUES (1, 'Ukraine', 1);

INSERT INTO COUNTRIES(country_id,country_name,region_id) 
VALUES 
(2, 'England', 2),
(3, 'Norway', 3),
(4, 'Portugal', 4);

INSERT INTO COUNTRIES(country_id,country_name,region_id) VALUES (5, 'Poland', 1);

-- fetch 
SELECT * FROM COUNTRIES;
SELECT * FROM DUP_COUNTRIES;
GO


-- Elevator service
-- In this exercises you need to look at the following table and recreate this with SQL code.
-- You can choose how you want to do it with whatever tool you would like. E.g MySQL
-- workbench, Python connector or SQLite etc… its up to you.
-- I would suggest that you work with one class member as well.. Have a discussion and make a
-- plan on how to tackle the problem.

DROP DATABASE IF EXISTS `ElevatorService`;
CREATE DATABASE `ElevatorService`;
USE `ElevatorService`;

CREATE TABLE ElevatorModel(
ElevatorModelId INT PRIMARY KEY,
ModelName INT,
Speed INT,
MaxWeight INT,
PeopleLimit INT,
ElevatorTypeId INT,
CONSTRAINT fk_ElevatorType FOREIGN KEY (ElevatorTypeId) REFERENCES ElevatorType(ElevatorTypeId)
);

CREATE TABLE ElevatorType(
ElevatorTypeId INT PRIMARY KEY,
TypeName VARCHAR(50)
);

CREATE TABLE Elevator(
ElevatorId INT PRIMARY KEY,
ElevatorModelId INT,
BuildningId INT,
InstallationDate DATE,
CONSTRAINT fk_ElevatorModel FOREIGN KEY (ElevatorModelId) REFERENCES ElevatorModel(ElevatorModelId),
CONSTRAINT fk_Building FOREIGN KEY (BuildningId) REFERENCES Buildning(BuildningId)
);

CREATE TABLE Buildning(
BuildningId INT PRIMARY KEY,
CityId int,
Floors int,
CONSTRAINT fk_City FOREIGN KEY (CityId) REFERENCES City(CityId)
);

CREATE TABLE City(
CityId INT PRIMARY KEY,
CityName VARCHAR(150)
);

CREATE TABLE City(
CityId INT PRIMARY KEY,
CityName VARCHAR(150)
);

CREATE TABLE ServiceActivity(
ServiceActivityId INT PRIMARY KEY,
EployeeId INT,
ElevatorId INT,
ServiceDateTime DATE,
ServiceDescription VARCHAR(250),
ServiceStatusId int,
CONSTRAINT fk_Elevator FOREIGN KEY (ElevatorId) REFERENCES Elevator(ElevatorId),
CONSTRAINT fk_Employee FOREIGN KEY (EployeeId) REFERENCES Technican(EployeeId),
CONSTRAINT fk_ServiceStatus FOREIGN KEY (ServiceStatusId) REFERENCES ServiceStatus(ServiceStatusId)
);

CREATE TABLE ServiceStatus(
ServiceStatusId INT PRIMARY KEY,
StatusDescription VARCHAR(250)
);

CREATE TABLE Technican(
EployeeId INT PRIMARY KEY,
FirstName VARCHAR(150),
LastName VARCHAR(150),
EmailAddress VARCHAR(50),
AnnualSalary INT,
SpesialSkill VARCHAR(200),
EmployeeStatusId int,
CONSTRAINT fk_EmployeeStatus FOREIGN KEY (EmployeeStatusId) REFERENCES EmployeeStatus(EmployeeStatusId)
);

CREATE TABLE EmployeeStatus(
EmployeeStatusId INT PRIMARY KEY,
StatusDescription VARCHAR(250)
);