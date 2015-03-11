-- se vor jurnaliza toate operatiile de inserare, stergere
USE AdventureWorks
GO

CREATE TABLE Production.ProductInventoryAudit
(
	ProductID int NOT NULL ,
	LocationID smallint NOT NULL ,
	Shelf nvarchar(10) NOT NULL ,
	Bin tinyint NOT NULL ,
	Quantity smallint NOT NULL ,
	rowguid uniqueidentifier NOT NULL ,
	ModifiedDate datetime NOT NULL ,
	InsOrUPD char(1) NOT NULL 
)
GO

-- cream trigger care va popula tabela de audit 
-- Production.ProductInventoryAudit 
CREATE TRIGGER Production.trg_uid_ProductInventoryAudit
ON Production.ProductInventory
AFTER INSERT, DELETE
AS
SET NOCOUNT ON -- nu va mai apare mesajul 'Rows affected...'

-- linii inserate
INSERT Production.ProductInventoryAudit
(
	ProductID, LocationID, Shelf, 
	Bin, Quantity, rowguid, 
	ModifiedDate, InsOrUPD
)
SELECT DISTINCT 
i.ProductID, i.LocationID, i.Shelf, i.Bin, 
i.Quantity, i.rowguid, GETDATE(), 'I'
FROM inserted i

-- linii sterse
INSERT Production.ProductInventoryAudit
(
	ProductID, LocationID, Shelf, Bin, Quantity,
	rowguid, ModifiedDate, InsOrUPD
)
SELECT d.ProductID, d.LocationID, d.Shelf, d.Bin, 
d.Quantity, d.rowguid, GETDATE(), 'D'
FROM deleted d
GO


-- inseram o linie 
INSERT Production.ProductInventory
(ProductID, LocationID, Shelf, Bin, Quantity)
VALUES (316, 6, 'A', 4, 22)


-- stergem o linie
DELETE Production.ProductInventory
WHERE ProductID = 316 AND
LocationID = 6

-- verificam tabela de audit
SELECT ProductID, LocationID, InsOrUpd
FROM Production.ProductInventoryAudit

-- clean up
-- drop table Production.ProductInventoryAudit