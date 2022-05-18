--Subqueries / Unterabfragen / nested Queries
--K�nnen im SELECT/WHERE/FROM usw. auftauchen
--M�ssen eigenst�ndig ausf�hrbar sein

SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)


--Grunds�tzlich m�ssen Subqueries im SELECT und WHERE genau einen Wert ausgeben
--(Beispiel f�r Ausnahme: WHERE 'Spaltenname' NOT IN (SELECT Subquery....)) 
-- --> durch "IN" k�nnen mehrere Werte in den WHERE Filter �bertragen werden (da mehrere OR Bedingungen)