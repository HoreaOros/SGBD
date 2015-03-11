-- aceeasi functionalitate ca si in error4.sql
BEGIN TRY
	BEGIN TRAN
	INSERT Production.Location
	(Name, CostRate, Availability)
	VALUES
	
	('Tool Verification', 0.00, 0.00)
	INSERT Production.Location
	(Name, CostRate, Availability)
	VALUES
	('Frame Forming', 0.00, 0.00)
	
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() ErrorNBR, ERROR_SEVERITY() Severity,
	ERROR_LINE () ErrorLine, ERROR_MESSAGE() Msg
	
	ROLLBACK TRANSACTION
END CATCH