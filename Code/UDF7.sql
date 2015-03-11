-- functie scalara ce determina tipul de echipament pe care il 
-- primeste un angajat pe baza unor parametri de intrare
use AdventureWorks2012
go
CREATE FUNCTION dbo.udf_GET_AssignedEquipment
(
	@Title nvarchar(50), 
	@HireDate datetime, 
	@SalariedFlag bit
)
RETURNS nvarchar(50)
AS
BEGIN
DECLARE @EquipmentType nvarchar(50)

	IF @Title LIKE 'Chief%' OR
		@Title LIKE 'Vice%' OR
		@Title = 'Database Administrator'
	BEGIN
		SET @EquipmentType = 'PC Build A'
	END

	IF @EquipmentType IS NULL AND @SalariedFlag = 1
	BEGIN
		SET @EquipmentType = 'PC Build B'
	END

	IF @EquipmentType IS NULL AND @HireDate < '1/1/2002'
	BEGIN
		SET @EquipmentType = 'PC Build C'
	END
	
	IF @EquipmentType IS NULL
	BEGIN
		SET @EquipmentType = 'PC Build D'
	END
	
RETURN @EquipmentType
END
GO


-- o data creata aceasta functie ea poate fi folosita in multe locuri
-- fara a mai fi nevoie de a rescrie logica
SELECT dbo.udf_GET_AssignedEquipment(JobTitle, HireDate, SalariedFlag) PC_Build
,COUNT(*) Employee_Count
FROM HumanResources.Employee
GROUP BY dbo.udf_GET_AssignedEquipment(JobTitle, HireDate, SalariedFlag)
ORDER BY dbo.udf_GET_AssignedEquipment(JobTitle, HireDate, SalariedFlag)

select * from HumanResources.Employee

-- apelul de functie poate apare si in clauza WHERE
SELECT JobTitle,
BusinessEntityID,
dbo.udf_GET_AssignedEquipment(JobTitle, HireDate, SalariedFlag) PC_Build
FROM HumanResources.Employee
WHERE dbo.udf_GET_AssignedEquipment(JobTitle, HireDate, SalariedFlag) IN
('PC Build A', 'PC Build B')


