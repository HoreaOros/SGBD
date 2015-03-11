ALTER TABLE HumanResources.TerminationReason
ADD ViolationSeverityLevel smallint
GO

CREATE NONCLUSTERED INDEX 
NI_TerminationReason_ViolationSeverityLevel
ON 
HumanResources.TerminationReason 
(ViolationSeverityLevel DESC)

EXEC sp_helpindex '[HumanResources].[TerminationReason]'