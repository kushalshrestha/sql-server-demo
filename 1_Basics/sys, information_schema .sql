select * from sys.objects where type='U';
/*
U -> User table
V -> View
P -> Stored Procedure
FN -> Scalar Function
IF -> Inline Table Valued Function
TF -> Table Valued Function
*/

select * from sys.tables;

select * from information_schema.tables; -- list tables
select * from INFORMATION_SCHEMA.views; -- lists views
select * from INFORMATION_SCHEMA.routines; -- lists procedures, functions

select * from sys.partitions where object_id='190623722';


SELECT 
name as [FileName],
physical_name as [FilePath]
FROM sys.database_files;

GO
