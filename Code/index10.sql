use AdventureWorks

-- EXMEPLU 1
-- interogare pe o tabela mare
SELECT SalesOrderID
FROM Sales.SalesOrderDetail
WHERE UnitPrice BETWEEN 150.00 AND 175.00

-- crearea unui index filtrat 
-- atunci cand se seleteaza doar valorile din interval
CREATE NONCLUSTERED INDEX NCI_UnitPrice_SalesOrderDetail
ON Sales.SalesOrderDetail(UnitPrice)
WHERE UnitPrice >= 150.00 AND UnitPrice <= 175.00




-- EXMEPLU 2
-- clustered index scan
SELECT SalesOrderDetailID
FROM Sales.SalesOrderDetail
WHERE ProductID IN (776, 777) AND
OrderQty > 10


-- se poate imbunatati performanta prin nonclustered index seek pe urmatorul index
CREATE NONCLUSTERED INDEX NCI_ProductID_SalesOrderDetail
ON Sales.SalesOrderDetail(ProductID,OrderQty)
WHERE ProductID IN (776, 777)

-- atunci cand stim ce date vor fi interogate putem creste performanta I/O la 
-- utilizarea indexului si spatiul ocupat pe disc

