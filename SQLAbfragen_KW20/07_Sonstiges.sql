--Sortieren der Ergebnisse mit ORDER BY

SELECT * FROM Orders
ORDER BY Freight 

--Standardm��ig immer aufsteigend (ASCENDING)
--Absteigend mit DESCENDING oder DESC

SELECT * FROM Orders
ORDER BY Freight DESC

--Sortieren nach mehreren Spalten falls identische Werte

SELECT * FROM Orders
ORDER BY CustomerID, Freight DESC

--Sortieren immer "nach Zahlen" oder alphabetisch




--DISTINCT filtern wir Duplikate im Ergebnis

SELECT DISTINCT CustomerID, OrderID FROM Orders



--Um mehrere SELECT Abfragen zusammenzuf�gen, k�nnen wir UNION nehmen

SELECT * FROM Customers
WHERE Country = 'Germany'
UNION
SELECT * FROM Customers
WHERE Country = 'France'
UNION 
SELECT * FROM Customers
WHERE Country = 'Spain'
Order BY CustomerID

--F�r Union selbe Spaltenanzahl der einzelnen Abfragen!
--Union macht automatisch ein DISTINCT, m�chte man das nicht UNION ALL
--Sortieren mit ORDER BY nur bei letzter Abfrage


SELECT CAST(12345 AS Varchar)
