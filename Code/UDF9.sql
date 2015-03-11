-- o functie poate fi folosita in locul unui view cu o flexibilitate
-- mai mare datorita parametrilor
-- in plus in functie se pot introduce secvente de cod ce 
-- nu se pot folosi intr-un view
use AdventureWorks2012
GO
CREATE FUNCTION dbo.udf_SEL_SalesQuota
( 
	@BusinessEntityID int,
	@ShowHistory bit 
)
RETURNS @SalesQuota TABLE
			(BusinessEntityID int,
			QuotaDate datetime,
			SalesQuota money)
AS
BEGIN
	INSERT @SalesQuota
	(BusinessEntityID, QuotaDate, SalesQuota)
	SELECT BusinessEntityID, ModifiedDate, SalesQuota
	FROM Sales.SalesPerson
	WHERE BusinessEntityID = @BusinessEntityID

IF @ShowHistory = 1
BEGIN
	INSERT @SalesQuota
	(BusinessEntityID, QuotaDate, SalesQuota)
	SELECT BusinessEntityID, QuotaDate, SalesQuota
	FROM Sales.SalesPersonQuotaHistory
	WHERE BusinessEntityID = @BusinessEntityID
END
RETURN
END
GO
-- testarea functiei
SELECT BusinessEntityID, QuotaDate, SalesQuota
FROM dbo.udf_SEL_SalesQuota (275,0)
GO

SELECT BusinessEntityID, QuotaDate, SalesQuota
FROM dbo.udf_SEL_SalesQuota (275,1)
GO