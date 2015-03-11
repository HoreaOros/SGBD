-- LOGON trigger
-- se va restrictiona accesul la server pentru un login 
-- in anumite perioade de timp

-- loginul pentru care se va restrictiona accesul
CREATE LOGIN nightworker WITH PASSWORD = 'E74A53C6'
GO

-- se vor audita incercarile de login
CREATE DATABASE ExampleAuditDB
GO
USE ExampleAuditDB
GO
CREATE TABLE dbo.RestrictedLogonAttempt
(
	LoginNM sysname NOT NULL,
	AttemptDT datetime NOT NULL
)
GO

--crearea triggerului 
USE master
GO
CREATE TRIGGER trg_logon_attempt
ON ALL SERVER
WITH EXECUTE AS 'sa'
FOR LOGON
AS
BEGIN
IF ORIGINAL_LOGIN()='nightworker' AND
	DATEPART(hh,GETDATE()) BETWEEN 7 AND 17
	BEGIN
		ROLLBACK
		INSERT ExampleAuditDB.dbo.RestrictedLogonAttempt
		(LoginNM, AttemptDT)
		VALUES (ORIGINAL_LOGIN(), GETDATE())
	END
END
GO

use ExampleAuditDB
select * from RestrictedLogonAttempt


--cleanup
--use master
--DROP TRIGGER trg_logon_attempt ON ALL SERVER
--drop database ExampleAuditDB