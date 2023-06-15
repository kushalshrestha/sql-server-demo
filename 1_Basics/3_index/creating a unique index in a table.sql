--It is possible to have a clustered index and a unique index in the same table in Microsoft SQL Server. 
-- The clustered index determines the physical order of the data in the table, while a unique index 
-- enforces uniqueness on one or more columns.
CREATE UNIQUE INDEX [IX_Person_LastName_FirstName_MiddleName3] ON [Person].Person
(
    LastName ASC,
    FirstName DESC,
    MiddleName ASC,
    BusinessEntityID
);
