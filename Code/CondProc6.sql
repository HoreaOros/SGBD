use AdventureWorks
GO
-- Declare variables
DECLARE @AWTables TABLE (SchemaTable varchar(100))
DECLARE @TableName varchar(100)

-- Insert table names into the table variable
INSERT @AWTables
(SchemaTable)
SELECT TABLE_SCHEMA + '.' + TABLE_NAME
FROM INFORMATION_SCHEMA.tables
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_SCHEMA + '.' + TABLE_NAME

-- Report on each table using sp_spaceused
WHILE (SELECT COUNT(*) FROM @AWTables)>0
BEGIN
	SELECT TOP 1 @TableName = SchemaTable
	FROM @AWTables
	ORDER BY SchemaTable
	EXEC sp_spaceused @TableName
	DELETE @AWTables
	WHERE SchemaTable = @TableName
END