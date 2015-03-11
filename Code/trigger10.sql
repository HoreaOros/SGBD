-- modificam trigger-ul pentru logon creat anterior
-- permitem crearea de noi login-uri dar monitorizam operatia
USE master
GO
ALTER TRIGGER srv_trg_RestrictNewLogins
ON ALL SERVER
FOR CREATE_LOGIN
AS
	SET NOCOUNT ON
	PRINT 'Your login creation is being monitored.'
	INSERT AdventureWorks.dbo.ChangeAttempt
	(EventData, DBUser)
	VALUES (EVENTDATA(), USER)
GO