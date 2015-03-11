-- identificarea coloanelor din baza de date ce folosesc un anumit tip de date
-- definit de utilizator
SELECT OBJECT_NAME(c.object_id) Table_Name, c.name Column_Name
FROM sys.columns c
INNER JOIN sys.types t ON
c.user_type_id = t.user_type_id
WHERE t.name = 'AccountNBR'


-- identificarea parametrilor de proceduri sau functii ce folosesc un anumit tip
-- de date definit de utilizator
SELECT OBJECT_NAME(p.object_id) Module_Name, p.name Parameter_Name
FROM sys.parameters p
INNER JOIN sys.types t ON
p.user_type_id = t.user_type_id
WHERE t.name = 'AccountNBR'

select * from sys.columns
select * from sys.types
select * from sys.parameters