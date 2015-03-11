use tempdb
GO
CREATE PROCEDURE #usp_TempProc AS
SELECT 1/0
RETURN @@ERROR
GO
DECLARE @ErrorCode int
EXEC @ErrorCode = #usp_TempProc
PRINT @ErrorCode


select * from sys.messages where message_id = 8134