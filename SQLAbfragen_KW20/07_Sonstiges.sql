--Sortieren der Ergebnisse mit ORDER BY

SELECT * FROM Orders
ORDER BY Freight 

--Standardmäßig immer aufsteigend (ASCENDING)
--Absteigend mit DESCENDING oder DESC

SELECT * FROM Orders
ORDER BY Freight DESC

--Sortieren nach mehreren Spalten falls identische Werte

SELECT * FROM Orders
ORDER BY CustomerID, Freight DESC

--Sortieren immer "nach Zahlen" oder alphabetisch




--DISTINCT filtern wir Duplikate im Ergebnis

SELECT DISTINCT CustomerID, OrderID FROM Orders



--Um mehrere SELECT Abfragen zusammenzufügen, können wir UNION nehmen

SELECT * FROM Customers
WHERE Country = 'Germany'
UNION
SELECT * FROM Customers
WHERE Country = 'France'
UNION 
SELECT * FROM Customers
WHERE Country = 'Spain'
Order BY CustomerID

--Für Union selbe Spaltenanzahl der einzelnen Abfragen!
--Union macht automatisch ein DISTINCT, möchte man das nicht UNION ALL
--Sortieren mit ORDER BY nur bei letzter Abfrage


SELECT CAST(12345 AS Varchar)



--TOP = Gibt oberste x Zeilen aus
SELECT TOP 1 * FROM Customers

--Unterste X Zeilen können auch mit TOP genommen werden, wenn wir die Sortierung umdrehen
SELECT TOP 1 * FROM Customers
ORDER BY CustomerID DESC

--Gibt oberste x % der Zeilen aus
SELECT TOP 10 Percent * FROM Customers


--A = 10%, B = 20%, C = 70%

--A:
SELECT TOP 10 PERCENT Freight FROM Orders
ORDER BY Freight DESC

--C:
SELECT TOP 70 PERCENT Freight FROM Orders
ORDER BY Freight 

--B:
SELECT Freight FROM Orders
WHERE Freight NOT IN 
(SELECT TOP 10 PERCENT Freight FROM Orders
ORDER BY Freight DESC)
AND
Freight NOT IN
(SELECT TOP 70 PERCENT Freight FROM Orders
ORDER BY Freight)



--SELECT TOP 1 * FROM 