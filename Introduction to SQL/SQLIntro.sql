--SELECT Statement
SELECT CustomerName, City FROM Customers;
SELECT * FROM Customers;

--SELECT DISTINCT Statement
SELECT COUNT(DISTINCT Country) FROM Customers;

--WHERE Clause
SELECT * FROM Customers WHERE Country='Mexico';
SELECT * FROM Customers WHERE CustomerID=1;

--AND, OR and NOT Operators
SELECT * FROM Customers WHERE Country='Germany' AND City='Berlin';
SELECT * FROM Customers WHERE City='Berlin' OR City='München';
SELECT * FROM Customers WHERE NOT Country='Germany';

--ORDER BY Keyword
SELECT * FROM Customers ORDER BY Country;
SELECT * FROM Customers ORDER BY Country DESC;
SELECT * FROM Customers ORDER BY Country, CustomerName;
SELECT * FROM Customers ORDER BY Country ASC, CustomerName DESC;

--INSERT INTO Statement
INSERT INTO Customers (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country) VALUES (92, 'Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

--NULL Value?
SELECT CustomerName, ContactName, Address FROM Customers WHERE Address IS NULL;
SELECT CustomerName, ContactName, Address FROM Customers WHERE Address IS NOT NULL;

--UPDATE Statement
UPDATE Customers SET ContactName = 'Alfred Schmidt', City= 'Frankfurt' WHERE CustomerID = 1;

--DELETE Statement
DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';

--SELECT TOP Clause
SELECT TOP 3 * FROM Customers;
SELECT TOP 50 PERCENT * FROM Customers;
SELECT TOP 3 * FROM Customers WHERE Country='Germany';

--MIN() and MAX() Functions
SELECT MIN(Price) AS SmallestPrice FROM Products;
SELECT MAX(Price) AS LargestPrice FROM Products;

--COUNT(), AVG() and SUM() Functions
SELECT COUNT(ProductID) FROM Products;
SELECT AVG(Price) FROM Products;
SELECT SUM(Quantity) FROM order_details;

--LIKE Operator
SELECT * FROM Customers WHERE CustomerName LIKE 'a%';
SELECT * FROM Customers WHERE CustomerName NOT LIKE 'a%';
SELECT * FROM Customers WHERE CustomerName LIKE '%a';
SELECT * FROM Customers WHERE CustomerName LIKE '%or%';
SELECT * FROM Customers WHERE CustomerName LIKE '_r%';
SELECT * FROM Customers WHERE CustomerName LIKE 'a__%';

--Wildcards
SELECT * FROM Customers WHERE City LIKE '[bsp]%';
SELECT * FROM Customers WHERE City LIKE '[a-c]%';
SELECT * FROM Customers WHERE City LIKE '[^bsp]%';

--IN Operator
SELECT * FROM Customers WHERE Country IN ('Germany', 'France', 'UK');
SELECT * FROM Customers WHERE Country NOT IN ('Germany', 'France', 'UK');
SELECT * FROM Customers WHERE Country IN (SELECT Country FROM Suppliers);

--BETWEEN Operator
SELECT * FROM Products WHERE Price BETWEEN 10 AND 20;
SELECT * FROM Products WHERE Price NOT BETWEEN 10 AND 20;

--Aliases
SELECT CustomerID AS ID, CustomerName AS Customer FROM Customers;
SELECT o.OrderID, o.OrderDate, c.CustomerName FROM Customers AS c, Orders AS o WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;

--INNER JOIN Keyword
SELECT Orders.OrderID, Customers.CustomerName FROM Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName FROM ((Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID) INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);

--LEFT JOIN Keyword
SELECT Customers.CustomerName, Orders.OrderID FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID ORDER BY Customers.CustomerName;

--RIGHT JOIN Keyword
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName FROM Orders RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID ORDER BY Orders.OrderID;

--FULL OUTER JOIN Keyword
SELECT Customers.CustomerName, Orders.OrderID FROM Customers FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID ORDER BY Customers.CustomerName;

--Self Join
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City FROM Customers A, Customers B WHERE A.CustomerID <> B.CustomerID AND A.City = B.City ORDER BY A.City;

--UNION Operator
SELECT City FROM Customers UNION SELECT City FROM Suppliers ORDER BY City;
SELECT City FROM Customers UNION ALL SELECT City FROM Suppliers ORDER BY City;

--GROUP BY Statement
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country ORDER BY COUNT(CustomerID) DESC;

--HAVING Clause
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country HAVING COUNT(CustomerID) > 5;

--EXISTS Operator
SELECT SupplierName FROM Suppliers WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);

--ANY and ALL Operators
SELECT ProductName FROM Products WHERE ProductID = ANY (SELECT ProductID FROM order_details WHERE Quantity = 10);
SELECT ProductName FROM Products WHERE ProductID = ANY (SELECT ProductID FROM order_details WHERE Quantity > 1000);

--SELECT INTO Statement
SELECT * INTO CustomersBackup2017 FROM Customers;
SELECT CustomerName, ContactName INTO CustomersBackup2018 FROM Customers;
SELECT * INTO CustomersGermany FROM Customers WHERE Country = 'Germany';

--INSERT INTO SELECT Statement
INSERT INTO Customers (CustomerName, City, Country) SELECT SupplierName, City, Country FROM Suppliers;
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country) SELECT SupplierName, ContactName, Address, City, PostalCode, Country FROM Suppliers;

--CASE Statement
SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM order_details;

--NULL Functions
SELECT ISNULL(NULL, 500);

--Stored Procedures for SQL Server
CREATE PROCEDURE Xyz
	@City nvarchar(30), 
	@PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
--Copy this procedure Code in new Query