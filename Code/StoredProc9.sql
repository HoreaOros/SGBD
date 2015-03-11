CREATE PROCEDURE dbo.usp_SEL_CountRowsFromAnyTable
@SchemaAndTable nvarchar(255)
AS
EXEC ('SELECT COUNT(*) FROM ' + @SchemaAndTable)
GO

-- daca avem dreptul sa executam procedura stocata si avem acces la tabela indicata
-- atunci procedura stocata va rula
EXEC dbo.usp_SEL_CountRowsFromAnyTable 'HumanResources.Department'

-- nu e suficient sa avem dreptul EXECUTE
-- trebuie sa avem si dreptul de SELECT pe tabela 
-- pentru ca in procedura stocata avem SQL dinamic
-- aceasta cerinta nu exista in cazul SQL static




USE master
GO
CREATE LOGIN SteveP WITH PASSWORD = '533B295A-D1F0'
USE AdventureWorks2012
GO
CREATE USER SteveP
GRANT SELECT ON OBJECT::HumanResources.Employee TO SteveP
GO

ALTER PROCEDURE dbo.usp_SEL_CountRowsFromAnyTable
@SchemaAndTable nvarchar(255)
WITH EXECUTE AS 'SteveP'
AS
-- Will work for any tables that SteveP can SELECT from
EXEC ('SELECT COUNT(*) FROM ' + @SchemaAndTable)
GO
--Daca procedura este executata de BrianG SQL Server nu 
-- va verifica permisiunile lui 
-- BrianG ci va folosi contextul de securitate al lui SteveP

--BrianG trebuie sa aiba dreptul EXEC pe PS.
GRANT EXEC ON dbo.usp_SEL_CountRowsFromAnyTable to BrianG

-- rulat de BrianG
EXEC dbo.usp_SEL_CountRowsFromAnyTable 'HumanResources.Employee'