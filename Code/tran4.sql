-- query 1
BEGIN TRAN
UPDATE Production.ProductInventory
SET Quantity = 400
WHERE ProductID = 1 AND
LocationID = 1

-- query 1 - intr-o alta sesiune
SET LOCK_TIMEOUT 1000

UPDATE Production.ProductInventory
SET Quantity = 406
WHERE ProductID = 1 AND
LocationID = 1


--Msg 1222, Level 16, State 51, Line 4
--Lock request time out period exceeded.
--The statement has been terminated.
