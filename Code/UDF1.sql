-- Create a function to check for any suspicious behaviors
-- from the application
CREATE FUNCTION dbo.udf_CheckForSQLInjection
(@TSQLString varchar(max))
RETURNS BIT
AS
BEGIN
DECLARE @IsSuspect bit
-- UDF assumes string will be left padded with a single space
SET @TSQLString = ' ' + @TSQLString
IF (PATINDEX('% xp_%' , @TSQLString ) <> 0 OR
	PATINDEX('% sp_%' , @TSQLString ) <> 0 OR
	PATINDEX('% DROP %' , @TSQLString ) <> 0 OR
	PATINDEX('% GO %' , @TSQLString ) <> 0 OR
	PATINDEX('% INSERT %' , @TSQLString ) <> 0 OR
	PATINDEX('% UPDATE %' , @TSQLString ) <> 0 OR
	PATINDEX('% DBCC %' , @TSQLString ) <> 0 OR
	PATINDEX('% SHUTDOWN %' , @TSQLString )<> 0 OR
	PATINDEX('% ALTER %' , @TSQLString )<> 0 OR
	PATINDEX('% CREATE %' , @TSQLString ) <> 0OR
	PATINDEX('%;%' , @TSQLString )<> 0 OR
	PATINDEX('% EXECUTE %' , @TSQLString )<> 0 OR
	PATINDEX('% BREAK %' , @TSQLString )<> 0 OR
	PATINDEX('% BEGIN %' , @TSQLString )<> 0 OR
	PATINDEX('% CHECKPOINT %' , @TSQLString )<> 0 OR
	PATINDEX('% BREAK %' , @TSQLString )<> 0 OR
	PATINDEX('% COMMIT %' , @TSQLString )<> 0 OR
	PATINDEX('% TRANSACTION %' , @TSQLString )<> 0 OR
	PATINDEX('% CURSOR %' , @TSQLString )<> 0 OR
	PATINDEX('% GRANT %' , @TSQLString )<> 0 OR
	PATINDEX('% DENY %' , @TSQLString )<> 0 OR
	PATINDEX('% ESCAPE %' , @TSQLString )<> 0 OR
	PATINDEX('% WHILE %' , @TSQLString )<> 0 OR
	PATINDEX('% OPENDATASOURCE %' , @TSQLString )<> 0 OR
	PATINDEX('% OPENQUERY %' , @TSQLString )<> 0 OR
	PATINDEX('% OPENROWSET %' , @TSQLString )<> 0 OR
	PATINDEX('% EXEC %' , @TSQLString )<> 0)
	BEGIN
		SELECT @IsSuspect = 1
	END
ELSE
	BEGIN
		SELECT @IsSuspect = 0
	END
RETURN (@IsSuspect)
END
GO

-- pentru testarea functiei mai jos sunt trei comenzi

SELECT dbo.udf_CheckForSQLInjection
('SELECT * FROM HumanResources.Department')


SELECT dbo.udf_CheckForSQLInjection
(';SHUTDOWN')


SELECT dbo.udf_CheckForSQLInjection
('DROP HumanResources.Department')