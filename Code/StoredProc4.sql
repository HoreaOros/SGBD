-- sunt intoarse doua result-set-uri
ALTER PROCEDURE dbo.usp_SEL_Department
@GroupName nvarchar(50)
AS
SELECT Name
FROM HumanResources.Department
WHERE GroupName = @GroupName
ORDER BY Name
SELECT @@ROWCOUNT DepartmentCount
GO


EXEC dbo.usp_SEL_Department 'Research and Development'

-- eliminarea unei proceduri stocate
-- informatiile de definitie sunt eliminate din tabele sistem
-- ale bazei de date. planurile de executie ale interogarilor din cache sunt
-- de asemenea eliminate
DROP PROCEDURE dbo.usp_SEL_Department