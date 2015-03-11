-- trebuie sa schimbam tipul de date pentru 
-- campurile care au tipul de date ce vrem sa-l eliminam 
ALTER TABLE dbo.InventoryAccount
ALTER COLUMN InventoryAccountNBR char(14)
GO

ALTER TABLE dbo.CustomerAccount
ALTER COLUMN CustomerAccountNBR char(14)
GO


-- de asemenea pentru parametrul procedurii stocate
ALTER PROCEDURE dbo.usp_SEL_CustomerAccount
@CustomerAccountNBR char(14)
AS
SELECT CustomerAccountID, CustomerID, CustomerAccountNBR
FROM dbo.CustomerAccount
WHERE CustomerAccountNBR = @CustomerAccountNBR
GO

-- acum putem elimina tipul de date pentru ca nu mai avem
-- nici un obiect in baza de date care il refera
DROP TYPE dbo.AccountNBR