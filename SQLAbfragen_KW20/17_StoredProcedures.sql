--Stored Procedure / gespeicherte Prozeduren
--SP werden auf dem Server gespeichert, sind für alle Nutzer verfügbar

CREATE PROCEDURE --CREATE PROC
spRechnungen @OrderID int
AS
SELECT o.OrderID, c.CustomerID, c.CompanyName, SUM(od.Quantity*od.UnitPrice) as RechnungsSumme
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
JOIN Employees e ON e.EmployeeID = o.EmployeeID
WHERE o.OrderID = @OrderID
GROUp BY o.OrderID, c.CustomerID, c.CompanyName

--Prozedur aufrufen

EXEC spRechnungen 10355


--Wir können auch mehrere Variablen anlegen

CREATE PROC spTest @Land varchar(20), @Stadt varchar(20)
AS
SELECT * FROM Customers
WHERE COuntry = @Land AND City = @Stadt

EXEC spTest France, Marseille


--Bestehende Procedures ändern mit ALTER

ALTER PROC spRechnungen @OrderID int, @OrderID2 int = 00000
AS
SELECT o.OrderID, c.CustomerID, c.CompanyName, SUM(od.Quantity*od.UnitPrice) as RechnungsSumme
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
JOIN Employees e ON e.EmployeeID = o.EmployeeID
WHERE o.OrderID = 10257
GROUp BY o.OrderID, c.CustomerID, c.CompanyName

EXEC spRechnungen 10257, 10259

--Variablen in Prozeduren können mit "Default-Wert" versehen werden. Dieser wird genommen wenn die
--Variable keinen Wert zugewiesen bekommt beim aufrufen



DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

--Aufgabe: Procedure erstellen, die mir direkt einen Kunden löscht.
--ORDER DETAILS --> ORDERS --> CUSTOMERS
GO
CREATE PROC KundenLöschen @CustomerID nchar(5)
AS
DELETE FROM [Order Details] 
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID)
DELETE FROM Orders WHERE CustomerID = @CustomerID
DELETE FROM Customers WHERE CustomerID = @CustomerID
GO

EXEC KundenLöschen PARIS

