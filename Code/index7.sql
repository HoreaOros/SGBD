-- adauagam o coloana ce nu poate fi cheie de indexare
ALTER TABLE HumanResources.TerminationReason
ADD LegalDescription varchar(max)

-- eliminam indexul
DROP INDEX
HumanResources.TerminationReason.NI_TerminationReason_TerminationReason_DepartmentID

-- creem indexul pnetru a include si noaua coloana
CREATE NONCLUSTERED INDEX NI_TerminationReason_TerminationReason_DepartmentID
ON HumanResources.TerminationReason (TerminationReason, DepartmentID)
INCLUDE (LegalDescription)