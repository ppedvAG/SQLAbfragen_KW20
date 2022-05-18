--Aggregatfunktionen

--SUM() -- Summe

SELECT SUM(Freight) FROM Orders

--AVG() -- Average (Druchschnitt)

SELECT AVG(Freight) FROM Orders

--COUNT() -- Zählt Ergebniszeilen

SELECT COUNT(*) FROM Orders

--MIN()/MAX() -- Kleinster/Größter Wert

SELECT MAX(Freight) FROM Orders
SELECT MIN(Freight) FROM Orders


SELECT SUM(Freight), * FROM Orders


--GROUP BY -- Gruppiert Ergebnisse "zusammen"

SELECT *  FROM Orders
ORDER BY CustomerID

SELECT CustomerID, SUM(Freight) as SummeFreight FROM Orders
GROUP BY CustomerID
ORDER BY SummeFreight DESC

--Trick: Alle Spalten aus dem SELECT die kein Aggregat sind, in GROUP BY kopieren

SELECT CustomerID, Quantity, SUM(Freight) as SummeFreight FROM Orders
JOIN [Order Details] od ON od.OrderID = orders.OrderID
GROUP BY CustomerID, Quantity
ORDER BY CustomerID 


SELECT CustomerID, Quantity, Freight FROM Orders
JOIN [Order Details] od ON od.OrderID = orders.OrderID
ORDER BY CustomerID


--Ausgabe: Wieviele Bestellungen (COUNT) hat jeder unserer Employees bearbeitet

SELECT EmployeeID, COUNT(*) as AnzahlBest FROM Orders
GROUP BY EmployeeID



SELECT o.OrderID, c.CompanyName, c.CustomerID, c.City, c.Country, e.LastName, SUM(Quantity*od.UnitPrice + Freight) as PositionsSumme
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
JOIN Employees e ON e.EmployeeID = o.EmployeeID
GROUP BY o.OrderID, c.CompanyName, c.CustomerID, c.City, c.Country, e.LastName


/*
SELECT o.OrderID, c.CustomerID, c.CompanyName,
c.City, c.Country, e.LastName, p.ProductName, o.freight, od.Quantity, od.UnitPrice,
Quantity*od.UnitPrice as PositionsSumme
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
JOIN Employees e ON e.EmployeeID = o.EmployeeID
*/


--1. Wieviele Kunden pro Land in unserer Datenbank
SELECT Country, COUNT(*) FROM Customers
GROUP BY Country

--2. Gesamtumsatz aller Kunden aus USA
select country,
Sum(Quantity* [Order Details].UnitPrice)as summe
from Orders
join Customers on orders.CustomerID = customers.CustomerID
join [Order Details] on orders.OrderID = [Order Details].orderid
where country = 'USA'
group by Country
--3. Durchschnittliche Produktpreis pro Anbieter (Supplier/Suppliers Table)
SELECT * FROM Suppliers
SELECT * FROM Products
SELECT CompanyName, AVG(UnitPrice) FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
GROUP BY CompanyName
--4. Wieviel Umsatz wurde mit Produkten der Kategorie 1 gemacht (CategoryID = 1)
SELECT CategoryID, SUM(Quantity*od.Unitprice) as Summe FROM [Order Details] od
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.CategoryID = 1
GROUP BY p.CategoryID

--(5. Bonus: Alle Bestellungen ausgeben, deren Frachtkosten größer als der Durchschnitt
--			aller Frachtkosten ist)

SELECT OrderId FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)

SELECT OrderId FROM Orders
WHERE Freight > AVG(Freight)



--6. Umsatz pro Kunde in Quartal 2 des Jahres 1997
SELECT CompanyName, SUM(Quantity*unitprice) as Summe FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Customers c ON c.CustomerID = o.CustomerID
WHERE Month(OrderDate) IN (4,5,6) AND Year(OrderDate) = '1997'
GROUP BY c.CompanyName
ORDER BY Summe DESC

--7. Gesamte Frachtkosten + Durchschnittliche Frachtkosten unserer Spediteure (Shippers)
--	 pro Jahr (1996/97/98); Tipp year(Spaltenname) = Zieht aus einem Datum nur das Jahr
year(OrderDate)
month(OrderDate)
day(OrderDate)

SELECT s.CompanyName, year(OrderDate) as Geschäftsjahr,
SUM(Freight) as SumFreight, AVG(Freight) as AvgFreight,
COUNT(*) as AnzahlBestellungen FROM Orders o
JOIN Shippers s ON o.ShipVia = s.ShipperID
WHERE year(Orderdate) IN ('1996', '1997', '1998')
GROUP BY s.CompanyName, year(OrderDate)
ORDER BY Geschäftsjahr, AvgFreight DESC



--HAVING, "das selbe" wie WHERE, allerdings auf die Gruppierungen des GROUP BY bezogen

select CompanyName,
Sum(Quantity* [Order Details].UnitPrice)as summe
from Orders
join Customers on orders.CustomerID = customers.CustomerID
join [Order Details] on orders.OrderID = [Order Details].orderid
WHERE Country = 'USA'
GROUP BY CompanyName, Country
HAVING Sum(Quantity* [Order Details].UnitPrice) > 10000 

--Wenn möglich, IMMER im WHERE und nicht im HAVING Filtern


SELECT CompanyName as Kunde, COuntry as Land FROM Customers
WHERE Country = 'Germany'
Order by Kunde




--Produkt "Chai" Gesamtverkaufszahlen nach Monaten im Jahr 1997

SELECT month(o.OrderDate) AS Monat, SUM(od.Quantity) AS ANZAHL 
FROM Northwind.dbo.Orders o 
INNER JOIN Northwind.dbo.[Order Details] od ON o.OrderID = od.OrderID 
INNER JOIN Northwind.dbo.Products p ON od.ProductID = p.ProductID 
WHERE p.ProductName = 'Chai' AND year(o.OrderDate) = '1997' 
GROUP BY month(o.OrderDate);