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
