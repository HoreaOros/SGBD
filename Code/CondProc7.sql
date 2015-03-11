use AdventureWorks
WHILE (1=1)
	BEGIN
		PRINT 'Endless While, because 1 always equals 1'
		IF 1=1
			BEGIN
				PRINT 'But we didn''t let the endless loop happen'
				BREAK
			END
		ELSE
			BEGIN
				CONTINUE
			END
	END