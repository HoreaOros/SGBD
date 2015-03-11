-- cream un nou mesaj de eroare
USE master
GO
EXEC sp_addmessage
	100001,
	14,
	N'The current table %s is not updateable by your group!'
GO

-- folosim noul mesaj de eroare (RAISERROR)
RAISERROR (100001, 14, 1, N'HumanResources.Employee')