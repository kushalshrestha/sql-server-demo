/* Explicit transaction: gives more control, can add error handling*/
begin transaction

select *
from dbo.tblEmployee

update dbo.tblEmployee
set EmployeeNumber = 122
where EmployeeNumber = 123;

update dbo.tblEmployee
set EmployeeNumber = 123
where EmployeeNumber = 122;

commit transaction
-----
begin transaction

select *
from dbo.tblEmployee

update dbo.tblEmployee
set EmployeeNumber = 122
where EmployeeNumber = 123;

rollback transaction