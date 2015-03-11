-- Show the DML triggers in the current database
SELECT OBJECT_NAME(parent_id) Table_or_ViewNM,
	name TriggerNM,
	is_instead_of_trigger,
	is_disabled
FROM sys.triggers
WHERE parent_class_desc = 'OBJECT_OR_COLUMN'
ORDER BY OBJECT_NAME(parent_id), name
GO

-- Displays the trigger SQL definition
--(if the trigger is not encrypted)
SELECT o.name, m.definition
FROM sys.sql_modules m
INNER JOIN sys.objects o ON
m.object_id = o.object_id
WHERE o.type = 'TR'
GO