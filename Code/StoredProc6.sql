SELECT definition,
execute_as_principal_id,
is_recompiled,
uses_ansi_nulls,
uses_quoted_identifier
FROM sys.sql_modules m
INNER JOIN sys.objects o ON
m.object_id = o.object_id
WHERE o.type = 'P' 