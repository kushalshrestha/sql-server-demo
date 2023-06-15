-- NOTE!! The clustered index is already created in AdventureWorks. This is just a syntax to view
-- While Execution we get error : 
--"Cannot create more than one clustered index on table.... Drop existing clustered index 'PK_...' before creating another"
CREATE CLUSTERED INDEX [IX_Person_LastName_FirstName_MiddleName2] ON [Person].Person
(
    LastName ASC,
    FirstName DESC,
    MiddleName ASC
);
