--Funktionen erstellen

CREATE FUNCTION f_Rechner (@Var1 int, @Var2 int) returns int
AS
BEGIN
	return (SELECT @Var1 * @Var2)
END

SELECT dbo.f_rechner(5, 100)

--Funktionen dürfen nur einen einzigen Wert ausgeben!



