CREATE FUNCTION dbo.udf_ProperCase(@UnCased varchar(max))
RETURNS varchar(max)
AS
BEGIN
	SET @UnCased = LOWER(@UnCased)
	DECLARE @C int
	SET @C = ASCII('a')
	WHILE @C <= ASCII('z')
	BEGIN
		SET @UnCased = REPLACE( @UnCased, ' ' + CHAR(@C), ' ' + CHAR(@C-32))
		SET @C = @C + 1
	END
	-- transform prima litera din primul cuvant al stringului in litera mare
	SET @UnCased = CHAR(ASCII(LEFT(@UnCased, 1))-32) + 
							  RIGHT(@UnCased,	LEN(@UnCased)-1)
RETURN @UnCased
END
GO


-- pentru testearea functiei
SELECT dbo.udf_ProperCase(DocumentSummary)
FROM Production.Document
WHERE FileName = 'Installing Replacement Pedals.doc'

print dbo.udf_ProperCase('horea oros')