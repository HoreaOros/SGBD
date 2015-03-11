-- inainte ca datele sa ajunga in table Department vrem ca ele sa fie
-- aprobate de un manager prin urmare avem nevoie de o tabela intermediara
USE AdventureWorks
GO
-- Create Department "Approval" table
CREATE TABLE HumanResources.DepartmentApproval
(
	Name nvarchar(50) NOT NULL UNIQUE,
	GroupName nvarchar(50) NOT NULL,
	ModifiedDate datetime NOT NULL DEFAULT GETDATE()
)
GO

-- Create view to see both approved and pending approval departments
-- fiind un view creat cu UNION el nu este updatabil
-- in cazul asta avem nevoie de un INSTEAD OF trigger pe view
CREATE VIEW HumanResources.vw_Department
AS
SELECT Name, GroupName, ModifiedDate, 'Approved' Status
FROM HumanResources.Department
UNION
SELECT Name, GroupName, ModifiedDate, 'Pending Approval' Status
FROM HumanResources.DepartmentApproval
GO

-- Create an INSTEAD OF trigger on the new view
CREATE TRIGGER HumanResources.trg_vw_Department
ON HumanResources.vw_Department
INSTEAD OF
INSERT
AS
SET NOCOUNT ON
INSERT HumanResources.DepartmentApproval
(Name, GroupName)
SELECT i.Name, i.GroupName
FROM inserted i
WHERE i.Name NOT IN (SELECT Name FROM HumanResources.DepartmentApproval)
GO

-- Insert into the new view, even though view is a UNION
-- of two different tables
INSERT HumanResources.vw_Department
(Name, GroupName)
VALUES ('Print Production', 'Manufacturing')

-- Check the view's contents
SELECT Status, Name
FROM HumanResources.vw_Department
WHERE GroupName = 'Manufacturing'

-- clean-up
DROP TRIGGER HumanResources.trg_vw_Department
DROP TABLE HumanResources.DepartmentApproval
DROP VIEW HumanResources.vw_Department
