-- o solutie neeleganta de a insera mai multe linii intr-o tabela
-- are o serie de limitari:
--     5 parametri
--     daca vrem sa inseram 10 linii trebuie apelata procedura de doua ori
--     daca vrem sa inseram 3 linii trebuie modificata procedura pentru a 
--     testa existenta valorilor NULL
CREATE PROCEDURE dbo.usp_INS_Department_Oldstyle
	@Name_1 nvarchar(50),
	@GroupName_1 nvarchar(50),
	@Name_2 nvarchar(50),
	@GroupName_2 nvarchar(50),
	@Name_3 nvarchar(50),
	@GroupName_3 nvarchar(50),
	@Name_4 nvarchar(50),
	@GroupName_4 nvarchar(50),
	@Name_5 nvarchar(50),
	@GroupName_5 nvarchar(50)
AS
INSERT HumanResources.Department
(Name, GroupName)
VALUES (@Name_1, @GroupName_1)

INSERT HumanResources.Department
(Name, GroupName)
VALUES (@Name_2, @GroupName_2)

INSERT HumanResources.Department
(Name, GroupName)
VALUES (@Name_3, @GroupName_3)

INSERT HumanResources.Department
(Name, GroupName)
VALUES (@Name_4, @GroupName_4)

INSERT HumanResources.Department
(Name, GroupName)
VALUES (@Name_5, @GroupName_5)
GO


-- alternativa - de asemenea invechita
CREATE PROCEDURE dbo.usp_INS_Department_Oldstyle_V2
@Name nvarchar(50),
@GroupName nvarchar(50)
AS
INSERT HumanResources.Department
(Name, GroupName)
VALUES (@Name, @GroupName)
GO


-- varianta recomandata 
CREATE TYPE Department_TT AS TABLE
(
	Name nvarchar(50),
	GroupName nvarchar(50)
)
GO

-- cream o procedura stocata care foloseste tipul de date creata mai sus
CREATE PROCEDURE dbo.usp_INS_Department_NewStyle
@DepartmentTable as Department_TT READONLY
AS
INSERT HumanResources.Department
(Name, GroupName)
SELECT Name, GroupName
FROM @DepartmentTable
GO


-- tipul de date il putem folosi pentru o variabila
DECLARE @StagingDepartmentTable as Department_TT

-- inseram mai multe linii in variabila de tip tabel
INSERT @StagingDepartmentTable
(Name, GroupName)
VALUES ('Archivists', 'Accounting')

INSERT @StagingDepartmentTable
(Name, GroupName)
VALUES ('Public Media', 'Legal')

INSERT @StagingDepartmentTable
(Name, GroupName)
VALUES ('Internal Admin', 'Office Administration')

-- transmitem variabile de tip tabel ca parametru la procedura cu un singur apel
EXEC dbo.usp_INS_Department_NewStyle @StagingDepartmentTable
