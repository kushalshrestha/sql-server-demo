-- NON CLUSTERED INDEX
CREATE NONCLUSTERED INDEX [IX_Person_LastName_FirstName_MiddleName_Duplicate2] ON [Person].[Person]
(
	[LastName] ASC,
	[FirstName] ASC,
	[MiddleName] ASC
);


-- Must specify the table name and index name for the DROP INDEX statement.
DROP INDEX [Person].[Person].[IX_Person_LastName_FirstName_MiddleName_Duplicate2]