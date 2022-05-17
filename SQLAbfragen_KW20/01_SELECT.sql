USE Northwind -- USE Datenbankname gibt an, in welcher DAtenbank wir arbeiten


SELECT * FROM Customers -- * bedeutet alle vorhandenen Spalten

select * frOm cUstOmErs

	SeLeCt
*
			FrOM Customers -- Zeileneinzug, Gro�-/Kleinschreibung etc. ist nicht relevant

--Dies ist ein Kommentar, Kommentare werden nicht ausgef�hrt im Skript
SELECT
/* er�ffnet Kommentar
�ber mehrere Zeilen
*/ schlie�t den Kommentar


-- SELECT * FROM Customers


SELECT CompanyName, Country FROM Customers


SELECT Country, CompanyName, City, Phone FROM Customers -- Reihenfolge beliebig ver�nderbar


SELECT CustomerID, Country, ContactName FROM Customers --Sobald "FROM" definiert ist, erkennt die Textvervollst�ndigung die Spalten



SELECT 'Hello World', 100, 5 + 10, 50/10, 7*8 -- Wir k�nnen mathematische Operationen, Strings etc. ausgeben lassen

--Spaltennamen k�nnen mit "Alias" umbenannt/benannt werden, kurz "as"

SELECT 10*5 as Mathe
SELECT CompanyName as Kunde, Country as Land FROM Customers



-- Tabelle Orders, Spalte "Freight".
-- Ausgabe: Freight (Brutto) + Netto + MwSt.

SELECT * FROM Orders

SELECT Freight as FrachtBrutto, Freight/1.19 as FrachtNetto, 
Freight - (Freight/1.19) as MwSt_Anteil FROM Orders

SELECT * FROM [Order Details] -- Eckige Klammern l�sen hinterlegte SQL Keywords
-- NIEMALS Tabellen & Spalten mit Leerzeichen erstellen!


