--Vorbereitung: Backups/Kopien von vorhandenen Tables erstellen

SELECT * INTO BackupCustomers
FROM Customers

SELECT * FROM BackupCustomers

SELECT * INTO BackupOrders
FROM Orders

SELECT * INTO BackupOrderDetails
FROM [Order Details]


--BEGIN TRAN versetzt uns in eine Art "Schwebezustand"; alles was wir zusammen mit begin tran ausführen
--wird erst endgültig in die Datenbank geschrieben wenn wir es mit COMMIT bestätigen (oder mit ROLLBACK rückgängig machen)
BEGIN TRANSACTION 
BEGIN TRAN

DROP TABLE BackupCustomers

SELECT * FROM BackupCustomers

ROLLBACK --Macht Transaction rückgängig
COMMIT --Bestätigt Transaction

SELECT @@Trancount --Zeigt uns aktuellen Transaction state an (1 = wir sind in Transaction; 0 = nicht)



--DROP TABLE = Löschen von vorhandenen Tabellen

DROP TABLE Customers


--UPDATE = Vorhandene Werte (=Zellen) in Tabelle ändern

UPDATE BackupCustomers
SET City = 'München'
WHERE CustomerID = 'ALFKI'

--AUFPASSEN! Where Filter nicht vergessen, sonst wird ganze Tabelle geändert!
--SELECT * FROM 
UPDATE BackupCustomers
SET = 
WHERE CustomerID = 'ALFKI'

--Tipp: Erst als normales SELECT Statement schreiben, dann in Update umwandeln


--Mit Update SET = NULL können wir Zellenwerte löschen
UPDATE BackupCustomers
SET Phone = NULL
WHERE CustomerID = 'ALFKI'


--DELETE löscht kompletten Datensatz aus Tabelle

DELETE FROM BackupCustomers
WHERE CustomerID = 'PARIS'

SELECT * FROM BackupCustomers
WHERE CustomerID = 'EDEKA'


--INSERT fügt neuen Datensatz zu Tabelle hinzu
INSERT INTO BackupCustomers (CustomerID, CompanyName)
VALUES ('EDEKA', 'Edeka Markt')

--2 Möglichkeiten: Entweder JEDE Spalte befüllen; Oder Spaltennamen direkt angeben, die befüllt werden sollen



--CREATE TABLE erstellt neue Tabelle

CREATE TABLE Fuhrpark
(
AutoID int NOT NULL,
Kennzeichen varchar(9) NOT NULL,
Modell varchar(20) NULL,
Anschaffungsdatum date NOT NULL
PRIMARY KEY (AutoID)
)

SELECT * FROM Fuhrpark

--Ändern von vorhandenen Tabellen

ALTER TABLE Fuhrpark
ALTER COLUMN Modell varchar(30) NULL
--Ändert vorhandene Spalte (Datentyp etc.)

ALTER TABLE Fuhrpark
DROP COLUMN Anschaffungsdatum
--Löscht vorhandene Spalte

ALTER TABLE Fuhrpark
ADD PRIMARY KEY (AutoID)
--Fügt (nachträglich) Primärschlüssel hinzu


GO

CREATE TABLE Test1
(
Test int
)


GO

