--WHILE = Wiederholt Anweisung solange bis angegebene Bedingung nicht mehr WAHR ist

DECLARE @Z�hler int = 1

WHILE @Z�hler < 5
	BEGIN
		SELECT 'Hallo!'
		SET @Z�hler +=1
	END

SELECT 'Habe fertig gez�hlt'

--Die Freight bei allen Orders um 10% erh�hen
--Grenzwerte: 1. H�chster Freight Wert nicht �ber 1500 2. Durchschnittlichen Freight nicht �ber 100
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

