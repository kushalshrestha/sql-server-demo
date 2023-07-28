select *
from tblEmployee;

update tblEmployee
set EmployeeNumber = 123
where EmployeeNumber = 123;
-- this is implicit transaction. Database takes care of commit;