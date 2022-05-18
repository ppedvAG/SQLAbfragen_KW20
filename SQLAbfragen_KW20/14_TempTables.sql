--Temporäre Tabellen: Existieren nur lokal für den Nutzer, innerhalb der Session

SELECT * FROM Customers
WHERE Country = 'Germany'


SELECT * INTO #TestTemp
FROM Customers
WHERE Country = 'Germany'

SELECT * FROM #TestTemp
SELECT CustomerID FROM #TestTemp

--"Globale" Temp Tables: ##
SELECT * INTO ##TestTempGlobal
FROM Customers
WHERE Country = 'Germany'

DROP TABLE #TestTemp

IF OBJECT_ID(N'#TestTemp') IS NOT NULL
DROP TABLE #TestTemp;

