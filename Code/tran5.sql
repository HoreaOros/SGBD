-- SQL Server Developer
-- query 1
use AdventureWorks2008
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
WHILE 1=1
BEGIN
	BEGIN TRAN
		UPDATE Purchasing.Vendor
		SET CreditRating = 1
		WHERE BusinessEntityID = 1494
		
		UPDATE Purchasing.Vendor
		SET CreditRating = 2
		WHERE BusinessEntityID = 1492
	COMMIT TRAN
END

-- query 2 - intr-o altã sesiune
-- 
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
WHILE 1=1
BEGIN
	BEGIN TRAN
		UPDATE Purchasing.Vendor
		SET CreditRating = 2
		WHERE BusinessEntityID = 1492
		
		UPDATE Purchasing.Vendor
		SET CreditRating = 1
		WHERE BusinessEntityID = 1494
	COMMIT TRAN
END

--Msg 1205, Level 13, State 51, Line 9
--Transaction (Process ID 53) was deadlocked on lock resources
--with another process and has been chosen as the deadlock victim.
--Rerun the transaction.

-- query 3 - intr-o altã sesiune
DBCC TRACEON (1222, -1)
GO
DBCC TRACESTATUS

-- query 4 - intr-o altã sesiune
DBCC TRACEOFF (1222, -1)
GO
DBCC TRACESTATUS