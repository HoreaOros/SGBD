-- cream o tabela in care se vor importa date dintr-un alt sistem
CREATE TABLE dbo.DimProductSalesperson
(
	DimProductSalespersonID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ProductCD char(10) NOT NULL,
	CompanyNBR int NOT NULL,
	SalespersonNBR int NOT NULL
)
GO

select * from dbo.DimProductSalesperson
-- tabela care contine datele ce vor fi importate
CREATE TABLE dbo.Staging_PRODSLSP
( 
	ProductCD char(10) NOT NULL,
	CompanyNBR int NOT NULL,
	SalespersonNBR int NOT NULL
)
GO
select * from dbo.Staging_PRODSLSP
-- inseram doua inregistrari in tabela pentru a avea cu ce sa lucram
INSERT dbo.Staging_PRODSLSP
(ProductCD, CompanyNBR, SalespersonNBR)
VALUES ('2391A23904', 1, 24)

INSERT dbo.Staging_PRODSLSP
(ProductCD, CompanyNBR, SalespersonNBR)
VALUES ('X129483203', 1, 34)


-- cu un query destul de sofisticat se pot insera datele in tabela
-- !!! trebuie inserate doar datele care inca nu au fost inserate
-- !!! cele care au fost inserate raman inserate o singura data
-- !!! cele trei campuri formeaza cheia naturala in tabela originala
INSERT dbo.DimProductSalesperson
(ProductCD, CompanyNBR, SalespersonNBR)
SELECT s.ProductCD, s.CompanyNBR, s.SalespersonNBR
FROM dbo.Staging_PRODSLSP s
LEFT OUTER JOIN dbo.DimProductSalesperson d ON
s.ProductCD = d.ProductCD AND
s.CompanyNBR = d.CompanyNBR AND
s.SalespersonNBR = d.SalespersonNBR
WHERE d.DimProductSalespersonID IS NULL

GO
-- alternativa este sa cream o functie care verifica daca datele au fost
-- deja inserate
CREATE FUNCTION dbo.udf_GET_Check_NK_DimProductSalesperson
(
	@ProductCD char(10), 
	@CompanyNBR int, 
	@SalespersonNBR int )
RETURNS bit
AS
BEGIN
	DECLARE @Exists bit

	IF EXISTS (SELECT DimProductSalespersonID
		FROM dbo.DimProductSalesperson
		WHERE @ProductCD = @ProductCD AND
		@CompanyNBR = @CompanyNBR AND
		@SalespersonNBR = @SalespersonNBR)
	BEGIN
		SET @Exists = 1
	END
	ELSE
	BEGIN
		SET @Exists = 0
	END
RETURN @Exists
END

GO
-- functia poate fi folosita in comanda INSERT ceea ce simplifica codul
INSERT dbo.DimProductSalesperson
(ProductCD, CompanyNBR, SalespersonNBR)
SELECT ProductCD, CompanyNBR, SalespersonNBR
FROM dbo.Staging_PRODSLSP
WHERE dbo.udf_GET_Check_NK_DimProductSalesperson
(ProductCD, CompanyNBR, SalespersonNBR) = 0

GO

