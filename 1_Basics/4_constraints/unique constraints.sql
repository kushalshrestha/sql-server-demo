-- Unique Constraint and Unique Index cannot be created on an existing table if it contains duplicate values
/*
alter table <tableName>
add constraint <constraintName> UNIQUE(<columnName>)
*/
alter table [Person].Person
add CONSTRAINT uc_Person_rowguid UNIQUE(rowguid)