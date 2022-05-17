SELECT * FROM Orders

--Ausgabe: Zu jeder Bestellposition (Order Details), 
--CompanyName, LastName Mitarbeiter, Welches Produkt, Freight, Quantity, UnitPrice

SELECT o.OrderID, c.CustomerID, c.CompanyName,
c.City, c.Country, e.LastName, p.ProductName, o.freight, od.Quantity, od.UnitPrice,
Quantity*od.UnitPrice as PositionsSumme
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
JOIN Employees e ON e.EmployeeID = o.EmployeeID