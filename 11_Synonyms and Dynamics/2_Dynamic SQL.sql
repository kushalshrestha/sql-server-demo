select *
from tblEmployee
where EmployeeNumber = 129;
GO

declare @command as varchar(255);
set @command = 'select * from tblEmployee where EmployeeNumber = 129;'
execute (@command);
go

declare @command as varchar(255);
declare @param as varchar(50);
set @command = 'select * from tblEmployee where EmployeeNumber = '
set @param = '129';
execute (@command + @param);  --sql injection
go

