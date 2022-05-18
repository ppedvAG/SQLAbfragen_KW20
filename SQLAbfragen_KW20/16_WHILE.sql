--WHILE = Wiederholt Anweisung solange bis angegebene Bedingung nicht mehr WAHR ist

DECLARE @Zähler int = 1

WHILE @Zähler < 5
	BEGIN
		SELECT 'Hallo!'
		SET @Zähler +=1
	END

SELECT 'Habe fertig gezählt'

--Die Freight bei allen Orders um 10% erhöhen
--Grenzwerte: 1. Höchster Freight Wert nicht über 1500 2. Durchschnittlichen Freight nicht über 100
--UPDATE 

WHILE (SELECT AVG(Freight)FROM Orders) < 100 AND  (SELECT MAX(Freight) FROM Orders) < 1500
BEGIN
	UPDATE Orders
	SET Freight = Freight*1.1
END
UPDATE Orders
SET Freight = Freight/1.1


--DECLARE @Var1 money = 1.1

WHILE (SELECT AVG(Freight)*1.1 FROM Orders) < 100 AND  (SELECT MAX(Freight)*1.1 FROM Orders) < 1500
BEGIN
	UPDATE Orders
	SET Freight = Freight*1.1
END

SELECT AVG(Freight), MAX(Freight) FROM Orders

