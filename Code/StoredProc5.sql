-- procedurile stocate ce ruleazã automat trebuie plasate in master
USE master
GO

-- se creeaza o tabela
CREATE TABLE dbo.SQLStartupLog
(
	SQLStartupLogID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	StartupDateTime datetime NOT NULL
)
GO


-- procedura stocata ce va fi rulata automat la pornirea SQL Server
CREATE PROCEDURE dbo.usp_INS_TrackSQLStartups
AS
	INSERT dbo.SQLStartupLog
	(StartupDateTime)
	VALUES (GETDATE())
GO


-- se ruleaza sp_procoption pentru a stabili procedura stocata ce va
-- va rula automat la pornirea SQL Server
EXEC sp_procoption @ProcName = 'usp_INS_TrackSQLStartups',
@OptionName = 'startup',
@OptionValue = 'true'

-- pentru a deazactiva rularea automata a procedurii stocate
EXEC sp_procoption @ProcName = 'usp_INS_TrackSQLStartups',
@OptionName = 'startup',
@OptionValue = 'false'
