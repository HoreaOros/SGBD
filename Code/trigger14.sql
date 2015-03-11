-- ordinea de rulare a triggerelor
use tempdb
CREATE TABLE dbo.TestTriggerOrder
(
	TestID int NOT NULL
)
GO

CREATE TRIGGER dbo.trg_i_TestTriggerOrder
ON dbo.TestTriggerOrder
AFTER INSERT
AS
PRINT 'I will be fired first.'
GO

CREATE TRIGGER dbo.trg_i_TestTriggerOrder2
ON dbo.TestTriggerOrder
AFTER INSERT
AS
PRINT 'I will be fired last.'
GO


CREATE TRIGGER dbo.trg_i_TestTriggerOrder3
ON dbo.TestTriggerOrder
AFTER INSERT
AS
PRINT 'I won''t be first or last.'
GO


EXEC sp_settriggerorder 'trg_i_TestTriggerOrder', 'First', 'INSERT'
EXEC sp_settriggerorder 'trg_i_TestTriggerOrder2', 'Last', 'INSERT'

INSERT dbo.TestTriggerOrder
(TestID)
VALUES (1)


-- Drop a DML trigger
DROP TRIGGER dbo.trg_i_TestTriggerOrder
-- Drop multiple DML triggers
DROP TRIGGER dbo.trg_i_TestTriggerOrder2, dbo.trg_i_TestTriggerOrder3
-- Drop a DDL trigger
DROP TRIGGER db_trg_RestrictINDEXChanges
ON DATABASE