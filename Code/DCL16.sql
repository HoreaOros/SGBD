USE AdventureWorks
GO
CREATE APPLICATION ROLE DataWareHouseApp
WITH PASSWORD = 'mywarehouse123!',
DEFAULT_SCHEMA = dbo


-- Rolul de aplicatie e inutil daca nu are drepturi
GRANT SELECT ON Sales.vSalesPersonSalesByFiscalYears
TO DataWareHouseApp


EXEC sp_setapprole 'DataWareHouseApp', -- App role name
'mywarehouse123!' -- Password
-- Works
SELECT COUNT(*)
FROM Sales.vSalesPersonSalesByFiscalYears
-- Doesn't work
SELECT COUNT(*)
FROM HumanResources.vJobCandidate



ALTER APPLICATION ROLE DataWareHouseApp
WITH NAME = DW_App, PASSWORD = 'newsecret!123'


DROP APPLICATION ROLE DW_App