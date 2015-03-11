USE AdventureWorks
GO

-- cream o tabela
CREATE TABLE dbo.EmployeeSalary
(EmployeeID int NOT NULL PRIMARY KEY CLUSTERED,
SalaryAMT money NOT NULL)
GO

-- o populam cu trei inregistrari
INSERT dbo.EmployeeSalary (EmployeeID, SalaryAMT)
VALUES (1,45000.00), (343, 100000.00),(93, 3234993.00)
GO

-- se creeaza procedura stocata care sterge toate inregistrarile din tabela
CREATE PROCEDURE dbo.usp_DEL_ALLEmployeeSalary
AS
-- Deletes all rows prior to the data feed
DELETE dbo.EmployeeSalary
GO



-- cream un login
USE master
GO
CREATE LOGIN BrianG WITH PASSWORD = '1301C636F9D'


-- cream un user in AW caruia ii dam drept de executie pe procedura
USE AdventureWorks2012
GO
CREATE USER BrianG
GO
GRANT EXEC ON usp_DEL_ALLEmployeeSalary to BrianG

-- asta va functiona pentru ca in PS se foloseste comanda DELETE
-- trebuie rulat de login-ul BrianG pe o alta conexiune
EXECUTE dbo.usp_DEL_ALLEmployeeSalary



-- daca PS foloseste comanda truncate PS nu vom mai putea rulata de BrianG
-- pentru ca nu are dreptul sa foloseasca comanda TRUNCATE pe tabela
ALTER PROCEDURE dbo.usp_DEL_ALLEmployeeSalary
AS
-- Deletes all rows prior to the data feed
TRUNCATE TABLE dbo.EmployeeSalary
GO

-- trebuie rulat de login-ul BrianG pe o alta conexiune
EXECUTE dbo.usp_DEL_ALLEmployeeSalary

-- orice apelant al PS va folosi contextul de securitate al proprietarului PS
ALTER PROCEDURE dbo.usp_DEL_ALLEmployeeSalary
WITH EXECUTE AS OWNER
AS
-- Deletes all rows prior to the data feed
TRUNCATE TABLE dbo.EmployeeSalary
GO


-- trebuie rulat de login-ul BrianG pe o alta conexiune
-- de data aceasta PS poate fi rulata de BrianG
-- BrianG are nevoie doar de dreptul de executare al PS  (pe care il are deja)
EXECUTE dbo.usp_DEL_ALLEmployeeSalary