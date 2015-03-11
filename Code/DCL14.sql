USE TestDB
GO
EXEC sp_addrolemember 'db_datawriter', 'Veronica'
EXEC sp_addrolemember 'db_datareader', 'Veronica'



USE TestDB
GO
EXEC sp_droprolemember 'db_datawriter', 'Veronica'