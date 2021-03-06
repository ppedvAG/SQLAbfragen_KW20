SELECT s.CompanyName, year(OrderDate) as Geschäftsjahr,
SUM(Freight) as SumFreight, AVG(Freight) as AvgFreight,
COUNT(*) as AnzahlBestellungen FROM Orders o
JOIN Shippers s ON o.ShipVia = s.ShipperID
WHERE year(Orderdate) IN ('1996', '1997', '1998')
GROUP BY s.CompanyName, year(OrderDate)
ORDER BY Geschäftsjahr, AvgFreight DESC


--OVER/WINDOWED
--OVER ORDER BY

SELECT 
s.CompanyName, 
year(OrderDate) as Geschäftsjahr,

AVG(Freight) OVER(Partition by year(Orderdate), CompanyName),
AVG(Freight) OVER()
FROM Orders o
JOIN Shippers s ON o.ShipVia = s.ShipperID
WHERE year(Orderdate) IN ('1996', '1997', '1998')
GROUP BY s.CompanyName, year(OrderDate), o.freight
ORDER BY Geschäftsjahr, CompanyName DESC

SELECT AVG(FREIGHT) FROM Orders






SELECT p.ProductName,
year(Orderdate) as Geschäftsjahr,
SUM(od.Quantity*p.UnitPrice) OVER() as GesamtUmsatzAlleProdukte,
SUM(od.Quantity*p.UnitPrice) OVER(PARTITION BY ProductName) as UmsatzSummeProProdukt,
SUM(od.Quantity*p.UnitPrice) OVER(PARTITION BY ProductName, year(Orderdate)) as UmsatzSummeProProduktProJahr
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
JOIN Orders o ON o.OrderId = od.OrderID
GROUP BY ProductName, year(Orderdate), od.Quantity, p.UnitPrice
ORDER BY UmsatzSummeProProdukt DESC
