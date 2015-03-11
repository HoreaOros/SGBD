-- nu se permite introducerea unui nou departament ce nu se afla in grupul
-- 'Research and Development'
USE AdventureWorks
GO
CREATE PROCEDURE dbo.usp_INS_Department
@DepartmentName nvarchar(50),
@GroupName nvarchar(50)
AS
IF @GroupName = 'Research and Development'
	BEGIN
		INSERT HumanResources.Department
		(Name, GroupName)
		VALUES (@DepartmentName, @GroupName)
	END
ELSE
BEGIN
RAISERROR('%s group is being audited
for the next %i days.
No new departments for this group can be added
during this time.', 16, 1, @GroupName, 23)
END
GO


EXEC dbo.usp_INS_Department 'Mainframe Accountant', 'Accounting'


-- ca alternativa putem adauga un mesaj un nou mesaj
EXEC sp_addmessage
	100002,
	14,
	N'%s group is being audited for the next %i
days. No new departments for this group can be added
during this time.'
GO

-- pe care il vom invoca in procedura stocata astfel:
RAISERROR(100002, 16, 1, @GroupName, 23)
