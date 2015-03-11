USE AdventureWorks2012
GO

SELECT o.name, o.type_desc, s.definition
FROM sys.sql_modules s
INNER JOIN sys.objects o
ON s.object_id = o.object_id
WHERE o.TYPE IN ('IF', -- Inline Table UDF
			   'TF', -- Multistatement Table UDF
			   'FN') -- Scalar UDF
			   
			   
--select * from sys.sql_modules
--select * from sys.objects


--DROP FUNCTION dbo.udf_ParseArray, dbo.udf_ReturnEmployeeAddress,
--dbo.udf_CheckForSQLInjection