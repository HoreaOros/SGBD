CREATE PROCEDURE dbo.usp_INS_Department
@Name nvarchar(50),
@GroupName nvarchar(50)
AS
BEGIN TRY
	INSERT HumanResources.Department (Name, GroupName)
	VALUES (@Name, @GroupName)
END TRY
BEGIN CATCH
	BEGIN TRY
		PRINT 'The first department attempt failed.'
		
		INSERT HumanResources.Department (Name, GroupName)
		VALUES ('Misc', @GroupName)
	END TRY
	BEGIN CATCH
		PRINT 'A Misc department for that group already exists.'
	END CATCH
END CATCH
GO
