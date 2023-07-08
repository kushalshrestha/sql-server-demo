------------ DEFAULT CONSTRAINT ----------
Alter table tblTransaction
add DateOfEntry datetime

Alter table tblTransaction
Add constraint defDateOfEntry DEFAULT GETDATE() for DateOfEntry;

insert into tblTransaction (Amount, DateOfTransaction, EmployeeNumber)
values (100, GETDATE(), 131);

select * from tblTransaction where EmployeeNumber=131;