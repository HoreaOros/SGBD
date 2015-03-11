CREATE PROCEDURE dbo.usp_SEL_Department
	@GroupName nvarchar(50),
	@DeptCount int OUTPUT
AS
SET NOCOUNT ON
SELECT Name
FROM HumanResources.Department
WHERE GroupName = @GroupName
ORDER BY Name

SELECT @DeptCount = @@ROWCOUNT
GO

DECLARE @DeptCount int

EXEC dbo.usp_SEL_Department 'Executive General and Administration',
@DeptCount OUTPUT

PRINT @DeptCount