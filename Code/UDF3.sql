-- SQL Server Developer
USE AdventureWorks2012
Go
CREATE FUNCTION dbo.udf_ReturnAddress
( @BusinessEntityID int)
RETURNS TABLE
AS
RETURN (
	SELECT t.Name AddressTypeNM,
		a.AddressLine1,
		a.City,
		a.StateProvinceID,
		a.PostalCode
	FROM Person.Address a
		INNER JOIN Person.BusinessEntityAddress e 
		ON a.AddressID = e.AddressID
		INNER JOIN Person.AddressType t 
		ON e.AddressTypeID = t.AddressTypeID
	WHERE e.BusinessEntityID = @BusinessEntityID 
)
GO

-- testarea functiei
SELECT AddressTypeNM, AddressLine1, City, PostalCode
FROM dbo.udf_ReturnAddress(332)