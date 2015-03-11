-- apelul unei proceduri stocate poate fi pus intr-un bloc try...catch
-- procedura va lansa a eroare 
CREATE PROCEDURE usp_SEL_DivideByZero
AS
	SELECT 1/0
GO

BEGIN TRY
	EXEC dbo.usp_SEL_DivideByZero
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() ErrorNBR, ERROR_SEVERITY() Severity,
	ERROR_LINE () ErrorLine, ERROR_MESSAGE() Msg
	
	PRINT 'This stored procedure did not execute properly.'
END CATCH