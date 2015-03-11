USE AdventureWorks
GO
-- nu avem PK - initial tabela este un heap
CREATE TABLE HumanResources.TerminationReason(
TerminationReasonID smallint IDENTITY(1,1) NOT NULL,
TerminationReason varchar(50) NOT NULL,
DepartmentID smallint NOT NULL,
CONSTRAINT FK_TerminationReason_DepartmentID
FOREIGN KEY (DepartmentID) REFERENCES
HumanResources.Department(DepartmentID)
)
GO

-- cheia primara adaugata ulterior
ALTER TABLE HumanResources.TerminationReason
ADD CONSTRAINT PK_TerminationReason PRIMARY KEY CLUSTERED (TerminationReasonID)

-- chiar daca nu cream cheia primara se poate adauga un index pe coloana TerminationReasonID
-- CREATE CLUSTERED INDEX CI_TerminationReason_TerminationReasonID ON
-- HumanResources.TerminationReason (TerminationReasonID)

-- index nonclustered 
CREATE NONCLUSTERED INDEX NCI_TerminationReason_DepartmentID ON
HumanResources.TerminationReason (DepartmentID)