DROP INDEX
HumanResources.TerminationReason.NI_TerminationReason_TerminationReason_DepartmentID

--procentul de umplere a paginilor de index este configurat la 50% lansand 
-- jumatate din spatiu disponibil pentru inregistrari noi
-- PAD_INDEX este ON - paginile intermediare ale indexului vor fi de asemenea 
-- lasate pe jumatate necompletate
CREATE NONCLUSTERED INDEX NI_TerminationReason_TerminationReason_DepartmentID
ON HumanResources.TerminationReason
(TerminationReason ASC, DepartmentID ASC)
WITH (PAD_INDEX=ON, FILLFACTOR=50)