select *
from tblEmployee
where EmployeeNumber = 129;
GO

declare @command as varchar(255);
set @command = 'select * from tblEmployee where EmployeeNumber = 129;'
execute (@command);
go


-- Here's an example of sql injection
declare @command as varchar(255);
declare @param as varchar(50);
set @command = 'select * from tblEmployee where EmployeeNumber = '
set @param = '129';
execute (@command + @param);  --sql injection. Avoid using string concatenation directly with user inputs in dynamic SQL.
go


/* USING DYNAMIC PARAMATERIZED QUERY */
-- instead you need to use for much safer execution : execute sys.sp_executesql .....
declare @command as nvarchar(255), @param as nvarchar(50);
set @command = N'select * from tblEmployee where EmployeeNumber = @ProductID'
set @param = N'129'
execute sys.sp_executesql @statement = @command, @params = N'@ProductID int', @ProductID = @param
-- @params is like input argument

