-- triggerul tipareste un mesaj pe conexiune dupa un insert
USE AdventureWorks
GO
CREATE TRIGGER HumanResources.trg_Department
ON HumanResources.Department
AFTER INSERT
AS
PRINT 'The trg_Department trigger was fired'
GO

-- dezactivam triggerul
DISABLE TRIGGER HumanResources.trg_Department
ON HumanResources.Department

-- datorita faptului ca triggerul este dezactivat nu se va printa mesajul
INSERT HumanResources.Department
(Name, GroupName)
VALUES ('Construction', 'Building Services')

-- activam triggerul
ENABLE TRIGGER HumanResources.trg_Department
ON HumanResources.Department

-- de data aceasta mesajul se va printa
INSERT HumanResources.Department
(Name, GroupName)
VALUES ('Cleaning', 'Building Services')