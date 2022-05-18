--Views / Sichten

SELECT * FROM Invoices

SELECT ShipName FROM Invoices

--In Views sind KEINE Stammdaten
--Views sind gespeicherte Abfragen; wenn ich eine View aufrufe/referiere, wird JEDES MAL die gesamte Abfrage ausgeführt!


SELECT * FROM Invoices

SELECT DISTINCT ShipName FROM Invoices



--Views eignen sich sehr gut um Leserechte zu differenzieren

SELECT FirstName + ' ' + Lastname, EmployeeID FROM Employees

--View erstellen:

GO

CREATE VIEW TestView
AS
SELECT FirstName + ' ' + Lastname as [Name], EmployeeID FROM Employees


SELECT * FROM TestView

--Löschen/verändern

DROP VIEW TestView

ALTER VIEW TestView
as
SELECT FirstName + ' ' + Lastname as Ganzer_Name, EmployeeID FROM Employees


SELECT Freight FROM Orders