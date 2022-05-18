--Variablen definieren wir mit DECLARE

DECLARE @Var1 int = 1, @Var2 int, @Var3 datetime

SELECT @Var1

SET @Var1 = 2

SELECT @Var1

SET @Var1 = @Var1 + 1
SET @Var1 = @Var1 + 1
SET @Var1 = @Var1 + 1
SET @Var1 += 1 -- Das selbe wie SET @Var1 = @Var1 + 1
SELECT @Var1


DECLARE @Land varchar(20) = 'Germany'

SELECT * FROM Customers
WHERE Country = @Land


DECLARE @AVGFreight money
SET @AVGFreight = (SELECT AVG(Freight) FROM Orders)

SELECT * FROM Orders
WHERE Freight > @AVGFreight