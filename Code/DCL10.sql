SELECT *
FROM sys.server_principals
WHERE type_desc = 'SERVER_ROLE'

--sau 
EXEC sp_helpsrvrole

-- pentru a vedea membri un rol fixat de server
EXEC sp_helpsrvrolemember 'sysadmin'