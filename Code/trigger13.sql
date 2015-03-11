-- Permitem trigger recursiv
ALTER DATABASE AdventureWorks
SET RECURSIVE_TRIGGERS ON

-- inspectam optiunea in baza de date
SELECT is_recursive_triggers_on
FROM sys.databases
WHERE name = 'AdventureWorks'

-- interzicem trigger recursiv
ALTER DATABASE AdventureWorks
SET RECURSIVE_TRIGGERS OFF

-- inspectam optiunea in baza de date
SELECT is_recursive_triggers_on
FROM sys.databases
WHERE name = 'AdventureWorks'