--Subqueries / Unterabfragen / nested Queries
--Können im SELECT/WHERE/FROM usw. auftauchen
--Müssen eigenständig ausführbar sein

SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)


--Grundsätzlich müssen Subqueries im SELECT und WHERE genau einen Wert ausgeben
--(Beispiel für Ausnahme: WHERE 'Spaltenname' NOT IN (SELECT Subquery....)) 
-- --> durch "IN" können mehrere Werte in den WHERE Filter übertragen werden (da mehrere OR Bedingungen)