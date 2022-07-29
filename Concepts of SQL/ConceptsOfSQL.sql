--CREATE DATABASE Statement
CREATE DATABASE testDB;

--DROP DATABASE Statement
DROP DATABASE testDB;

--BACKUP DATABASE
BACKUP DATABASE testDB TO DISK = 'C:\backups\testDB.bak';
BACKUP DATABASE testDB TO DISK = 'C:\backups\testDB.bak' WITH DIFFERENTIAL;

--CREATE TABLE Statement
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

--DROP TABLE
DROP TABLE Persons;
TRUNCATE TABLE Persons;

--ALTER TABLE
ALTER TABLE Persons ADD Email varchar(255);
ALTER TABLE Persons DROP COLUMN Email;
ALTER TABLE Persons ADD DateOfBirth date;
ALTER TABLE Persons ALTER COLUMN DateOfBirth varchar(20);
ALTER TABLE Persons DROP COLUMN DateOfBirth;

--Constraints
--NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK, DEFAULT, AUTO INCREMENT <= field
CREATE TABLE Persons (
    PersonID int not null primary key IDENTITY(1,1),
    LastName varchar(255),
    FirstName varchar(255),
	age int CHECK (Age>=18),
    Address varchar(255),
    City varchar(255)
);
ALTER TABLE Persons ADD CONSTRAINT df_City DEFAULT 'Sandnes' FOR City;

--CREATE INDEX
CREATE UNIQUE INDEX idx_pname ON Persons (LastName, FirstName);
DROP INDEX Persons.idx_pname;

--Date Data Types
SELECT * FROM Orders WHERE OrderDate='1996-11-11'

--Views
CREATE OR REPLACE VIEW [Products Above Average Price] AS SELECT ProductName, Price FROM Products WHERE Price > (SELECT AVG(Price) FROM Products);
SELECT * FROM [Products Above Average Price];

ALTER VIEW [Products Above Average Price] as SELECT ProductID, ProductName, Price  FROM Products;
SELECT * FROM [Products Above Average Price];
DROP VIEW [Products Above Average Price];