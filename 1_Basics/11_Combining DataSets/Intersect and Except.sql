select *, ROW_NUMBER() over (order by (select null))%3 as ShouldIDelete
into tblTransactionNew
from tblTransaction

select * from tblTransactionNew

delete from tblTransactionNew where ShouldIDelete=1; -- 838 rows affected i.e 1675 rows are remaining out of 2513

---- EXCEPT Example
select Amount, DateOfTransaction, EmployeeNumber, DateOfEntry  from tblTransaction
except
select Amount, DateOfTransaction, EmployeeNumber, DateOfEntry from tblTransactionNew
-- only 838 rows

select count(*) from tblTransaction; -- 2513
select count(*) from tblTransactionNew; -- 1675

-- INTERSECT
select Amount, DateOfTransaction, EmployeeNumber, DateOfEntry  from tblTransaction
intersect
select Amount, DateOfTransaction, EmployeeNumber, DateOfEntry from tblTransactionNew
-- 1675 rows i.e 1675 rows are common

-- Will the order by Work? -> No. Incorrect syntax near keyword 'intersect'
select Amount, DateOfTransaction, EmployeeNumber, DateOfEntry  from tblTransaction
order by EmployeeNumber
intersect
select Amount, DateOfTransaction, EmployeeNumber, DateOfEntry from tblTransactionNew

-- This will order the whole output.
select Amount, DateOfTransaction, EmployeeNumber, DateOfEntry  from tblTransaction
intersect
select Amount, DateOfTransaction, EmployeeNumber, DateOfEntry from tblTransactionNew
order by EmployeeNumber

