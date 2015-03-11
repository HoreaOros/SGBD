-- login SQL
CREATE LOGIN Veronica
WITH PASSWORD = 'InfernoII',
DEFAULT_DATABASE = AdventureWorks


-- login SQL
-- necesita >= Windows 2003 Server sau mai bun
CREATE LOGIN Trishelle
WITH PASSWORD = 'ChangeMe' MUST_CHANGE ,
CHECK_EXPIRATION = ON,
CHECK_POLICY = ON