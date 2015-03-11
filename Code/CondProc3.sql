-- SQL Server Developer
USE AdventureWorks
GO
DECLARE @QuerySelector int
SET @QuerySelector = 3

IF @QuerySelector = 1
	BEGIN
		SELECT TOP 3 ProductID, Name, Color
		FROM Production.Product
		WHERE Color = 'Silver'
		ORDER BY Name
	END
ELSE
	BEGIN
		SELECT TOP 3 ProductID, Name, Color
		FROM Production.Product
		WHERE Color = 'Black'
		ORDER BY Name
	END