--Datumsfunktionen

SELECT datediff(dd, '20220516', '20220524')
--gibt Differenz zwischen 2 Datum aus

SELECT getdate()
--Gibt aktuelle Systemzeit aus

SELECT datediff(yy, '19900101', getdate())

SELECT datename(weekday, getdate())

SELECT dateadd(dd, -10, getdate())



-- w3schools.com

-- Ausgabe: OrderID, Lieferverz�gerung aus Orders Tabelle
-- Lieferverz�gerung (RequiredDate & ShippedDate)

SELECT OrderID, datediff(dd, RequiredDate, ShippedDate) as Lieferverz�gerung
, RequiredDate, ShippedDate FROM Orders



--Stringfunktionen

SELECT * FROM employees

SELECT CONCAT(Firstname, ' ', LastName) as Ganzer_Name FROM Employees
SELECT Firstname + ' ' + LastName FROM employees
--F�hrt Strings zusammen in eine Spalte

ltrim rtrim

SELECT rtrim('Peter                 ')
SELECT 'Peter               '

SELECT ltrim(' Peter')
--ltrim rtrim l�scht Leerzeichen 

SELECT substring('00005478', 5, 4)
--Nimmt einen Teil des Strings bei Position x

SELECT stuff('abcdefg', 3, 3, '****')
--Ersetzt Teile eines Strings mit neuem String

SELECT CompanyName, LEN(CompanyName) FROM Customers
--LEN z�hlt wieviele Stellen ein String hat

SELECT STUFF(CompanyName, LEN(CompanyName) - 3, 4, '****') FROM Customers




