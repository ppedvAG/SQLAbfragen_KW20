--Um nach "ungenauen" Werten zu filtern

--Mit LIKE Keyword


-- % steht für eine beliebige Anzahl and beliebigen Buchstaben/Zahlen

SELECT * FROM Customers
WHERE CompanyName LIKE 'a%'
--Kunden mit A am Anfang des Namens

SELECT * FROM Customers
WHERE CompanyName LIKE 'an%'

SELECT * FROM Customers
WHERE CompanyName LIKE 'a%e'


-- '_' steht für genau 1 beliebiges Symbol

SELECT * FROM Customers
WHERE CompanyName LIKE '_o%'

SELECT * FROM Customers
WHERE CompanyName LIKE '_____g%'

-- [a-z], [0-9] gibt eine "Range" an, mit der die Stelle besetzt werden darf

SELECT * FROM Customers
WHERE CompanyName LIKE '[a-f]%'

SELECT * FROM Customers
WHERE Postalcode LIKE '8%' AND Country = 'Germany'

-- [^a-z], [^0-9] gibt eine "Range" an, mit der die Stelle NICHT besetzt werden darf

SELECT * FROM Customers
WHERE CompanyName LIKE '[^a-f]%'

-- [agz] gibt eine Auswahl an, mit der die Stelle besetzt werden darf

SELECT * FROM Customers
WHERE CompanyName LIKE '[agz]%'

-- [^agz] gibt eine Auswahl an, mit der die Stelle NICHT besetzt werden darf



--Beispiel alle Meiers aus der Datenbank
WHERE Name LIKE 'M[aey][yi]r%'



--Wenn man nach % oder ' suchen wollen

SELECT * FROM Customers
WHERE CompanyName LIKE '%''%'

--Für ' schreiben wir zwei ''
--Bei % o.ä. in [%]


--Alle Kunden aus France, UK oder USA, oder City Berlin, Rome, 
--und companyname soll mit A beginnen

SELECT * FROM Customers
WHERE (Country IN ('France', 'UK', 'USA') OR City IN ('Berlin', 'Rome'))
AND companyname LIKE 'A%'

--AND ist "stärker bindent" (wie Punkt vor Strich), im Zweifel Klammern setzen







UPDATE Customers
SET CompanyName = 'Alfreds''Futterkiste'
WHERE CustomerID = 'ALFKI'