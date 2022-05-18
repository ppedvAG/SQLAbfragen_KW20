--Vorbereitung: Backups/Kopien von vorhandenen Tables erstellen

SELECT * INTO BackupCustomers
FROM Customers

SELECT * FROM BackupCustomers

SELECT * INTO BackupOrders
FROM Orders

SELECT * INTO BackupOrderDetails
FROM [Order Details]


--BEGIN TRAN versetzt uns in eine Art "Schwebezustand"; alles was wir zusammen mit begin tran ausf�hren
--wird erst endg�ltig in die Datenbank geschrieben wenn wir es mit COMMIT best�tigen (oder mit ROLLBACK r�ckg�ngig machen)
BEGIN TRANSACTION 
BEGIN TRAN

DROP TABLE BackupCustomers

SELECT * FROM BackupCustomers

ROLLBACK --Macht Transaction r�ckg�ngig
COMMIT --Best�tigt Transaction

SELECT @@Trancount --Zeigt uns aktuellen Transaction state an (1 = wir sind in Transaction; 0 = nicht)



--DROP TABLE = L�schen von vorhandenen Tabellen

DROP TABLE Customers


--UPDATE = Vorhandene Werte (=Zellen) in Tabelle �ndern

UPDATE BackupCustomers
SET City = 'M�nchen'
WHERE CustomerID = 'ALFKI'

--AUFPASSEN! Where Filter nicht vergessen, sonst wird ganze Tabelle ge�ndert!
--SELECT * FROM 
UPDATE BackupCustomers
SET = 
WHERE CustomerID = 'ALFKI'

--Tipp: Erst als normales SELECT Statement schreiben, dann in Update umwandeln


--Mit Update SET = NULL k�nnen wir Zellenwerte l�schen
UPDATE BackupCustomers
SET Phone = NULL
WHERE CustomerID = 'ALFKI'


--DELETE l�scht kompletten Datensatz aus Tabelle

DELETE FROM BackupCustomers
WHERE CustomerID = 'PARIS'

SELECT * FROM BackupCustomers
WHERE CustomerID = 'EDEKA'


--INSERT f�gt neuen Datensatz zu Tabelle hinzu
INSERT INTO BackupCustomers (CustomerID, CompanyName)
VALUES ('EDEKA', 'Edeka Markt')

--2 M�glichkeiten: Entweder JEDE Spalte bef�llen; Oder Spaltennamen direkt angeben, die bef�llt werden sollen



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

--�ndern von vorhandenen Tabellen

ALTER TABLE Fuhrpark
ALTER COLUMN Modell varchar(30) NULL
--�ndert vorhandene Spalte (Datentyp etc.)

ALTER TABLE Fuhrpark
DROP COLUMN Anschaffungsdatum
--L�scht vorhandene Spalte

ALTER TABLE Fuhrpark
ADD PRIMARY KEY (AutoID)
--F�gt (nachtr�glich) Prim�rschl�ssel hinzu


GO

CREATE TABLE Test1
(
Test int
)


GO

