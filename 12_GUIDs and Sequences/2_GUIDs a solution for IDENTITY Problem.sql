/* GUIDs - Globally Unique Identifier */
-- GUID -> 128 bit identifier

-- GUID example
declare @newvalue as UNIQUEIDENTIFIER -- UNIQUEIDENTIFIER -> unique in all devices
set @newvalue = NEWID()
select @newvalue as TheNewID
Go

begin transaction
create table tblEmployee4
(
    UniqueID UNIQUEIDENTIFIER CONSTRAINT df_tblEmployee4_UniqueID DEFAULT NEWID(),
    EmployeeNumber int CONSTRAINT uq_tblEmployee4_EmployeeNumber UNIQUE
)

insert into tblEmployee4(EmployeeNumber)
values(1),(2), (3)

select * from tblEmployee4;

rollback transaction

-- But again GUID has a problem. They shouldn't be used as index. 
-- Because everytime during insertion, it has to be sorted i.e rows has to be shuffled
-- So lead to performance issues.
-- Hence Microsoft came up with NEWSEQUENTIALID()

declare @newvalue as UNIQUEIDENTIFIER -- UNIQUEIDENTIFIER -> unique in all devices
set @newvalue = NEWSEQUENTIALID() -- NEWSEQUENTIALID() can only be used in a DEFAULT expression for a column of type 'uniqueidentifier'
select @newvalue as TheNewID
Go
-- ERROR:
-- The newsequentialid() built-in function can only be used in a DEFAULT expression for a column of type 'uniqueidentifier' in a 
-- CREATE TABLE or ALTER TABLE statement. It cannot be combined with other operators to form a complex scalar expression.
-- Like:
begin transaction
create table tblEmployee4
(
    UniqueID UNIQUEIDENTIFIER CONSTRAINT df_tblEmployee4_UniqueID DEFAULT NEWSEQUENTIALID(),
    EmployeeNumber int CONSTRAINT uq_tblEmployee4_EmployeeNumber UNIQUE
)

insert into tblEmployee4(EmployeeNumber)
values(1),(2), (3)

select * from tblEmployee4;

rollback transaction
-- You'll see the UniqueSequentialID() produces ID's in order. i.e lesser the problem than NEWID()
-- But again the problem is on size, it comes with a price. It takes 128bit i.e 128/8 = 16 bytes. But int takes only 4 bytes.
-- So, a performance issue arises
-- So, the solution is SEQUENCES