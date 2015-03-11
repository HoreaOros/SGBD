EXEC sp_helpindex 'HumanResources.Employee'

-- putem vedea optiuni ale indecșilor
SELECT SUBSTRING(name, 1,30) index_name,
allow_row_locks,
allow_page_locks,
is_disabled,
fill_factor,
has_filter
FROM sys.indexes
WHERE object_id = OBJECT_ID('HumanResources.Employee')