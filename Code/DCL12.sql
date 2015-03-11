SELECT dp.name OrphanUser, dp.sid OrphanSid
FROM sys.database_principals dp
LEFT OUTER JOIN sys.server_principals sp ON
dp.sid = sp.sid
WHERE sp.sid IS NULL AND
dp.type_desc = 'SQL_USER' AND
dp.principal_id > 4