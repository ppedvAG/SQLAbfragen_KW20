--WHERE "Spaltenname" = "Wert"
SELECT * FROM Customers
WHERE Country = 'Germany'

SELECT * FROM Customers
WHERE Country = ' germany' --WHERE filtert nur nach dem EXAKTEN Wert

SELECT * FROM Orders
WHERE Freight >= 100 

--Funktioniert mit Vergleichsoperatoren >, >=, <, <=, !=

SELECT * FROM Customers
WHERE Country != 'Germany' -- != Ungleich

--Filtern nach "NULL"

SELECT * FROM Customers
WHERE Region IS NULL

SELECT * FROM Customers
WHERE Region IS NOT NULL

--NULL = Kein Wert eingetragen, nicht das selbe wie '' oder "Leerzeichen" oder '0'



--Nach mehreren Kriterien filtern:

SELECT * FROM Customers 
WHERE (Country = 'Germany' OR Country = 'France') OR City = 'Madrid'


--Zusatz zu Lieververzögerungen: Nur die OrderIDs mit Verzögerung anzeigen

SELECT OrderID, datediff(dd, RequiredDate, ShippedDate) as Lieferverzögerung
, RequiredDate, ShippedDate FROM Orders
WHERE datediff(dd, RequiredDate, ShippedDate) > 0 OR ShippedDate IS NULL

--Mit IN (Wert1, Wert2 usw.) mehrere ORs verknüpft
SELECT * FROM Products
WHERE ProductID IN (1, 10, 15, 47, 50, 77)



SELECT * FROM Orders
WHERE Freight >= 50 AND Freight <= 100

--Alternativ mit BETWEEN (Randwerte inbegriffen)
SELECT * FROM Orders
WHERE Freight BETWEEN 50 AND 100

--Funktioniert auch mit Datum etc.



