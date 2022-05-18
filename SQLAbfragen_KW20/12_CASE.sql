--CASE k�nnen wir F�lle/Bedingungen unterscheiden

SELECT 
ProductName,
CASE
	WHEN UnitsInStock > 0 THEN 'Passt'
	WHEN UnitsInStock = 0 THEN 'Vorsicht!'
	ELSE 'Fehler'
END as Warnung
FROM Products

--Case pr�ft eine WHEN Bedingung nach der anderen, bis eine "wahr/true" ist


--Aufgabe: Produkte in Kategorien A/B/C aufteilen nach Gesamtumsatz.
--A = �ber 50.000; B = 10.000 - 49.999; C = unter 10.000


SELECT p.ProductName,
SUM(od.Quantity * p.UnitPrice) AS Umsatz,
CASE
WHEN SUM(od.Quantity * p.UnitPrice) > 50000 THEN 'A' 
WHEN SUM(od.Quantity * p.UnitPrice) BETWEEN 10000 AND 49999 THEN 'B' 
WHEN SUM(od.Quantity * p.UnitPrice) < 10000 THEN 'C' 
END AS Category 
FROM Northwind.dbo.[Order Details] AS od 
INNER JOIN Northwind.dbo.Products p ON od.ProductID = p.ProductID 
GROUP BY p.ProductName 
ORDER BY Category, Umsatz DESC;


--Aufteilung unserer Employees in Altersgruppen; (Birthdate/Orderdate)
--Welche Gruppe hat wieviel Umsatz mit dem Verkauf von Alkoholika gemacht?
--Alkoholika = Category 1 ohne ProductID (1, 24, 43)
--�60, 51-60, 41-50, 30-40, U30

select
Sum(Quantity* od.UnitPrice) as Umsatz,
case
when datediff(YY,BirthDate,orderdate) >60 then '�60'
when datediff(YY,BirthDate,orderdate) between 51 and 60 then '51-60'
when datediff(YY,BirthDate,orderdate) between 41 and 50 then '41-50'
when datediff(YY,BirthDate,orderdate) between 30 and 40 then '31-40'
else 'unter30'
end as Altersgruppe
from Employees e
join Orders o on e.EmployeeID = o.EmployeeID
join [Order Details] od on od.OrderID = o.OrderID
join Products p on p.ProductID = od.ProductID
where CategoryID=1 and p.ProductID not in (1,24,43)
group by case
when datediff(YY,BirthDate,orderdate) >60 then '�60'
when datediff(YY,BirthDate,orderdate) between 51 and 60 then '51-60'
when datediff(YY,BirthDate,orderdate) between 41 and 50 then '41-50'
when datediff(YY,BirthDate,orderdate) between 30 and 40 then '31-40'
else 'unter30'
end 
order by Umsatz DESC


--Customers Tabelle ContactName �ndern, bei allen aus DE = Hans-Peter M�ller, 
--bei allen aus FR = Jaque Gusto
--bei allen SP = Jesus Garcias
BEGIN TRAN
UPDATE BackupCustomers
SET ContactName = CASE
	WHEN Country = 'Germany' THEN 'Hans-Peter M�ller'
	WHEN Country = 'France' THEN 'Jaque Gusto'
	WHEN Country = 'Spain' THEN 'Jesus Garcias'
	ELSE ContactName
END

ROLLBACK

SELECT * FROM BackupCustomers









SELECT ProductName, SUM(od.Quantity*od.UnitPrice) AS Summe 
FROM Northwind.dbo.Orders o 
INNER JOIN Northwind.dbo.[Order Details] od ON o.OrderID = od.OrderID 
INNER JOIN Northwind.dbo.Products p ON od.ProductID = p.ProductID 
GROUP BY ProductName
ORDER by Summe DESC