begin transaction;

update tblEmployee
set EmployeeFirstName = 'Loan Taker : ' + EmployeeFirstName
output inserted.*, deleted.*  -- THIS LINE IS OPTIONAL, use only to view it. you can use just output inserted.* or output deleted.*
from tblEmployee
left join tblTransaction 
on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
where Amount < 0;

rollback transaction;
