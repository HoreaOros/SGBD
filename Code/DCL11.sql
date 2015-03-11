IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'TestDB')
BEGIN
	CREATE DATABASE TestDB
END
GO
USE TestDB
GO
-- user-ul se va mapa pe un login cu acelasi nume
-- schema implicita va fi dbo
CREATE USER Veronica

exec sp_helpuser 'Veronica'
--
USE AdventureWorks
GO
CREATE USER Helen
FOR LOGIN [HOREA-TOSHIBA\Helen]
WITH DEFAULT_SCHEMA = HumanResources
--referintele la obiecte necalificate din interogarile facute de Helen
--vor fi cautate prima data in schema HumanResources

