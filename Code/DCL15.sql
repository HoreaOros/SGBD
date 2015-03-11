USE AdventureWorks
GO
-- creez rolul
CREATE ROLE HR_ReportSpecialist AUTHORIZATION db_owner

-- dau drepturi rolului
GRANT SELECT ON HumanResources.Employee TO HR_ReportSpecialist

-- adaug un user la rol
EXEC sp_addrolemember 'HR_ReportSpecialist',
'Veronica'
GO

-- ulterior se poate schimba numele rolului
ALTER ROLE HR_ReportSpecialist WITH NAME = HumanResources_RS

-- rolul se poate elimina doar dupa ce am eliminat userii din rol
--DROP ROLE HumanResources_RS


EXEC sp_droprolemember 'HumanResources_RS',
'Veronica'
GO
DROP ROLE HumanResources_RS