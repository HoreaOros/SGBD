USE AdventureWorks
GO
CREATE PROCEDURE dbo.usp_SEL_ShoppingCartDisplay
AS
SET NOCOUNT ON
SELECT sc.ShoppingCartID,
sc.ShoppingCartItemID,
sc.Quantity,
sc.ProductID,
p.Name ProductName,
p.ListPrice
FROM Sales.ShoppingCartItem sc
INNER JOIN Production.Product p ON
sc.ProductID = p.ProductID
GO -- marchează sfârșitul procedurii stocate

EXEC dbo.usp_SEL_ShoppingCartDisplay