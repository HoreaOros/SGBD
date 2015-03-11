-- SQL Developer
USE AdventureWorks
GO
-- Determine Conference Rooms Based on Department
SELECT DepartmentID,
Name,
GroupName,
CASE GroupName
WHEN 'Research and Development' THEN 'Room A'
WHEN 'Sales and Marketing' THEN 'Room B'
WHEN 'Manufacturing' THEN 'Room C'
ELSE 'Room D'
END ConferenceRoom
FROM HumanResources.Department