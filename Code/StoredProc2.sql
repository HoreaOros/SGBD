CREATE PROCEDURE dbo.usp_UPD_ShoppingCartItem
	(
		@ShoppingCartID nvarchar(50),
		@Quantity int = 1, -- defaulted to quantity of 1
		@ProductID int
	)
AS
SET NOCOUNT ON
-- If the same ShoppingCartID and ProductID is sent
-- in the parameters, update the new quantity
IF EXISTS(SELECT * FROM Sales.ShoppingCartItem
WHERE ShoppingCartID = @ShoppingCartID AND ProductID = @ProductID )
	BEGIN
		UPDATE Sales.ShoppingCartItem
		SET Quantity = @Quantity
		WHERE ShoppingCartID = @ShoppingCartID AND
		ProductID = @ProductID
		PRINT 'UPDATE performed. '
	END
ELSE
	BEGIN
		-- Otherwise insert a new row
		INSERT Sales.ShoppingCartItem
		(ShoppingCartID, ProductID, Quantity)
		VALUES (@ShoppingCartID, @ProductID, @Quantity)
		PRINT 'INSERT performed. '
	END
GO


EXEC usp_UPD_ShoppingCartItem '1255', 2, 316 

--pentru a sterge linia inserata
--delete Sales.ShoppingCartItem
--where ShoppingCartID = '1255' and ProductID = 316
