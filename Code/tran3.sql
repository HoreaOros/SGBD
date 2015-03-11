SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO

-- query 1
BEGIN TRAN
UPDATE Production.ProductInventory
SET Quantity = 400
WHERE ProductID = 1 AND
LocationID = 1

-- query 2 - intr-o altã sesiune
BEGIN TRAN
UPDATE Production.ProductInventory
SET Quantity = 406
WHERE ProductID = 1 AND
LocationID = 1

-- query 3 - intr-o altã sesiune
SELECT blocking_session_id, wait_duration_ms, session_id
FROM sys.dm_os_waiting_tasks
WHERE blocking_session_id IS NOT NULL


-- query 4 - intr-o altã sesiune
SELECT t.text
FROM sys.dm_exec_connections c
CROSS APPLY sys.dm_exec_sql_text (c.most_recent_sql_handle) t
WHERE c.session_id = 52

-- query 5
KILL 52

rollback
