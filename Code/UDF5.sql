
-- continuare la UDF4.sql
USE tempdb
GO

ALTER FUNCTION dbo.udf_ParseArray
( 
	@StringArray varchar(max),
	@Delimiter char(1),
	@MinRowSelect int,
	@MaxRowSelect int
)
RETURNS @StringArrayTable  TABLE 
				(
					RowNum int IDENTITY(1,1), 
					Val varchar(50)
				)
AS
BEGIN
	DECLARE @Delimiter_position int
	
	IF RIGHT(@StringArray,1) != @Delimiter
		SET @StringArray = @StringArray + @Delimiter
	
	WHILE CHARINDEX(@Delimiter, @StringArray) <> 0
	BEGIN
		SELECT @Delimiter_position =
		CHARINDEX(@Delimiter, @StringArray)
		
		INSERT @StringArrayTable
		VALUES (left(@StringArray, @Delimiter_position - 1))
		
		SELECT @StringArray = stuff(@StringArray, 1,
		@Delimiter_position, '')
	END
	
	DELETE @StringArrayTable 
	WHERE RowNum < @MinRowSelect OR	RowNum > @MaxRowSelect

RETURN
END
GO


-- testarea functiei
SELECT RowNum, Val
FROM dbo.udf_ParseArray('A,B,C,D,E,F,G', ',', 3, 5)


-- elimin functia creata
drop function udf_ParseArray