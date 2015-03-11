-- codul pentru crearea procedurii stocate trebuie salvat pentru ca nu 
-- se poate recupera intr-un mod simplu

CREATE PROCEDURE dbo.usp_SEL_EmployeePayHistory
WITH ENCRYPTION
AS
SELECT [BusinessEntityID], RateChangeDate, Rate, PayFrequency, ModifiedDate
FROM HumanResources.EmployeePayHistory
GO

-- View the procedure's text
EXEC sp_helptext usp_SEL_EmployeePayHistory

