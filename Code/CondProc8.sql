use AdventureWorks
go

DECLARE @Name nvarchar(50) = 'Engineering'
DECLARE @GroupName nvarchar(50) = 'Research and Development'
DECLARE @Exists bit = 0

IF EXISTS (SELECT Name
	FROM HumanResources.Department
	WHERE Name = @Name)
BEGIN
	SET @Exists = 1
	GOTO SkipInsert
END
INSERT HumanResources.Department
(Name, GroupName)
VALUES(@Name , @GroupName)
SkipInsert:
IF @Exists = 1
BEGIN
	PRINT @Name + ' already exists in HumanResources.Department'
END
ELSE
BEGIN
	PRINT 'Row added'
END