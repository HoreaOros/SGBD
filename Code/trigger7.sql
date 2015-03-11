USE master
GO
-- se interzice crearea de noi login-uri pe server
CREATE TRIGGER srv_trg_RestrictNewLogins
ON ALL SERVER
FOR CREATE_LOGIN
AS
	PRINT 'No login creations without DBA involvement.'
	ROLLBACK
GO

--incercam sa creãm un nou login
CREATE LOGIN JoeS WITH PASSWORD = 'A235921'
GO

-- cleanup
--DROP TRIGGER srv_trg_RestrictNewLogins
--ON ALL SERVER