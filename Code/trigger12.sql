USE master
GO
-- Disable nesting
EXEC sp_configure 'nested triggers', 0
RECONFIGURE WITH OVERRIDE
GO
-- Enable nesting
EXEC sp_configure 'nested triggers', 1
RECONFIGURE WITH OVERRIDE
GO
