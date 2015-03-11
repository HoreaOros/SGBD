-- In acest exemplu, presupunem ca numarul de cont va fi folosit in mai
-- multe tabele si intotdeauna e format din 14 caractere si nu permite
-- valoarea NULL

CREATE TYPE dbo.AccountNBR
FROM char(14) NOT NULL
GO

-- Noul tip de date este folosit in doua tabele diferite
CREATE TABLE dbo.InventoryAccount
(
	InventoryAccountID int NOT NULL,
	InventoryID int NOT NULL,
	InventoryAccountNBR AccountNBR
)
GO

CREATE TABLE dbo.CustomerAccount
(
	CustomerAccountID int NOT NULL,
	CustomerID int NOT NULL,
	CustomerAccountNBR AccountNBR
)
GO

-- Tipul de date poate fi folosit si ca tip pentru parametrul unei
-- proceduri stocate
CREATE PROCEDURE dbo.usp_SEL_CustomerAccount
@CustomerAccountNBR AccountNBR
AS
SELECT CustomerAccountID, CustomerID, CustomerAccountNBR
FROM dbo.CustomerAccount
WHERE CustomerAccountNBR = @CustomerAccountNBR
GO

-- tipul de date poate fi folosit si pentru o variabila
DECLARE @CustomerAccountNBR AccountNBR
SET @CustomerAccountNBR = '1294839482'
EXEC dbo.usp_SEL_CustomerAccount @CustomerAccountNBR


-- pentru a vedea detalii despre tipul de date
EXEC sp_help 'dbo.AccountNBR'