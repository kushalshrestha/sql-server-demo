begin transaction
select 'BEFORE : '  + cast(count(*) as varchar(20)) from tblTransaction;

-- delete using subquery
delete tblTransaction
where amount in (select amount
                from tblEmployee te
                inner join tblTransaction tt
                on te.EmployeeNumber = tt.EmployeeNumber
                where tt.amount < 0)

select 'AFTER DELETE : ' + cast(count(*) as varchar(20))from tblTransaction;
rollback transaction
select 'AFTER ROLLBACK : ' + cast(count(*) as varchar(20))from tblTransaction;

-----------------------------------

begin transaction

select 'BEFORE : '  + cast(count(*) as varchar(20)) from tblEmployee;

delete tblEmployee
from tblEmployee
left join tblTransaction 
on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
where tblTransaction.Amount < 0;

select 'AFTER DELETE : ' + cast(count(*) as varchar(20))from tblEmployee;
ROLLBACK TRANSACTION
select 'AFTER ROLLBACK : ' + cast(count(*) as varchar(20))from tblEmployee;

