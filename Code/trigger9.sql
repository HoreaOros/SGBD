-- metadate despre triggere
USE AdventureWorks
GO
-- triggere DDL din baza de date curenta
SELECT name TriggerNM, is_disabled
FROM sys.triggers
WHERE parent_class_desc = 'DATABASE'
ORDER BY OBJECT_NAME(parent_id), name


-- triggere DDL la nivel de server
SELECT name, s.type_desc SQL_or_CLR,
is_disabled, e.type_desc FiringEvents
FROM sys.server_triggers s
INNER JOIN sys.server_trigger_events e ON
s.object_id = e.object_id


-- triggere DDL la nivel baza de date - cu definitie
SELECT t.name, m.Definition
FROM sys.triggers AS t
INNER JOIN sys.sql_modules m ON
t.object_id = m.object_id
WHERE t.parent_class_desc = 'DATABASE'

--trigere DDL la nivel de server - cu definitie
SELECT t.name, m.definition
FROM sys.server_sql_modules m
INNER JOIN sys.server_triggers t ON
m.object_id = t.object_id