-- SQL Server Express
USE AdventureWorks
GO
-- Before count
SELECT COUNT(*) BeforeCount FROM HumanResources.Department
-- Variable to hold the latest error integer value
DECLARE @Error int
BEGIN TRANSACTION
INSERT HumanResources.Department
(Name, GroupName)
VALUES ('Accounts Payable', 'Accounting')
SET @Error = @@ERROR
IF (@Error<> 0) GOTO Error_Handler
INSERT HumanResources.Department
(Name, GroupName)
VALUES ('Engineering', 'Research and Development')
SET @Error = @@ERROR
IF (@Error <> 0) GOTO Error_Handler
COMMIT TRAN
Error_Handler:
IF @Error <> 0
BEGIN
ROLLBACK TRANSACTION
END
-- After count
SELECT COUNT(*) AfterCount FROM HumanResources.Department

SELECT *  FROM HumanResources.Department