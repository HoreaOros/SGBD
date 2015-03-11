-- vizualizarea tuturor login-urilor si grupurilor Windows cu acces la MSSQL
SELECT *
FROM sys.server_principals
--WHERE type_desc IN ('WINDOWS_LOGIN', 'WINDOWS_GROUP')
ORDER BY type_desc