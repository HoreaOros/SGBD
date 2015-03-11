CREATE LOGIN Veronica
WITH PASSWORD = 'PalmTree1'
GO


EXEC master..sp_addsrvrolemember
'Veronica',
'sysadmin'
GO

-- eliminarea unui login din rolul de server
EXEC master..sp_dropsrvrolemember
'Veronica',
'sysadmin'
GO