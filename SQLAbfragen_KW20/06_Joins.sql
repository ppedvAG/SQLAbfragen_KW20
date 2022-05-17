--Joins

SELECT * FROM o
SELECT * FROM [ORDER DETAILS]


--INNER JOIN
SELECT ord.OrderID, customers.CustomerID, CompanyName, Freight, City FROM orders ord
INNER JOIN Customers ON ord.customerID = customers.customerID
JOIN [Order Details] ON ord.OrderID = [Order Details].Orderid

SELECT EmployeeID, LastName, ReportsTo FROM Employees


SELECT ord.OrderID, ord.customerID, CompanyName, Freight, City, productID FROM o
INNER JOIN Customers ON ord.customerID = customers.customerID
INNER JOIN [Order Details] ON ord.OrderID = [Order Details].OrderID

--1. Alle Bestellungen mit dem zugehörigen Employee der sie bearbeitet hat (Lastname, FirstName)
SELECT FirstName + ' ' + LastName as Mitarbeiter, ord.* FROM o
JOIN Employees ON ord.EmployeeID = Employees.EmployeeID

--2. Alle Bestellungen mit zugehörigem Kundennamen, deren Freight größer 100 war
SELECT c.CustomerID, c.CompanyName, ord.* FROM Customers c
JOIN o o ON c.CustomerID = ord.CustomerID
WHERE ord.freight > 100
--3. Alle Kunden, die bereits einmal "Chai" gekauft haben (ProductID = 1)
SELECT c.CompanyName, ord.OrderID, p.ProductID, p.ProductName FROM Customers c
JOIN o o ON c.CustomerID = ord.CustomerID
JOIN [Order Details] od ON ord.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductID = 1


--4.Bonus: "Stellvertreter" Liste erstellen. Zu jedem Employee die zugehörigen Kollegen, 
-- die ihn vertreten können (Wohnhaft in der selben Stadt). 
--(Ausgabe: Employee Name, Wohnort, Stellvertreter Name, Wohnort)
SELECT e.LastName, e.FirstName, e.City, e1.Lastname, e1.Firstname, e1.City FROM Employees e
JOIN Employees e1 ON e.City = e1.City
WHERE e.Lastname != e1.Lastname


--OUTER JOIN
--LEFT & RIGHT JOIN, Zeigen Schnittmenge + jeweilige gesamte Tabelle

SELECT * FROM 
o o RIGHT JOIN Customers c ON c.CustomerID = ord.CustomerID
WHERE OrderID IS NULL

--FULL OUTER JOIN, Zeigt komplett alles


--CROSS JOIN
SELECT * FROM Customers
CROSS JOIN o

--SELF JOIN
SELECT e.LastName, e.FirstName, e.City, e1.Lastname, e1.Firstname, e1.City FROM Employees e
JOIN Employees e1 ON e.City = e1.City
WHERE e.Lastname != e1.Lastname