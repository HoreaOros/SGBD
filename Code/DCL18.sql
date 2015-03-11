-- Veronica primeste dreptul de a folosi SQL Profiler
-- pentru a monitoriza activatatea SQL Server
-- Veronica poate da acest drept si altor principali
-- permisiunile la nivel de server pot fi date doar daca
-- baza de date curenta este master
USE master
GO
-- cream login-ul daca nu exista
IF NOT EXISTS
(SELECT name
FROM sys.server_principals
WHERE name = 'Veronica')
BEGIN
	CREATE LOGIN [Veronica] 
	WITH PASSWORD=N'test!#1',
	DEFAULT_DATABASE=[master],
	CHECK_EXPIRATION=OFF,
	CHECK_POLICY=OFF
END

GRANT ALTER TRACE TO Veronica
WITH GRANT OPTION