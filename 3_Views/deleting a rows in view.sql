select * from ViewByDepartment;

-- View or function 'ViewByDepartment' is not updatable because the modification affects multiple base tables.
begin transaction
delete from ViewByDepartment
where totalAmount=981.18 and EmployeeNumber = 131;
rollback transaction

-- If you have single base table involved in a view
Create view ViewSimple
as
select * from tblTransaction
go

begin transaction
select count(*) from tblTransaction;
select count(*) from ViewSimple;

delete from ViewSimple
where EmployeeNumber=132

select count(*) from tblTransaction;
select count(*) from ViewSimple;
rollback transaction