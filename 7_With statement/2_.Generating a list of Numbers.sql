select * from tblTransaction;
-- what EmployeeNumber does not exist in tblTransaction?

select E.EmployeeNumber 
from tblEmployee as E
left join tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber is NULL
order by E.EmployeeNumber;



select *
from tblTransaction
order by EmployeeNumber asc;

select ROW_NUMBER() over (order by (select null)) as RowNumber
from tblTransaction ;


------------- IMPORTANT: 
with Numbers as (
select ROW_NUMBER() over (order by (select null)) as RowNumber
from tblTransaction as U)

select U.RowNumber from Numbers as U
left join tblTransaction as T
on U.RowNumber = T.EmployeeNumber 
where T.EmployeeNumber is null;

-----------


select row_number() over (order by (select null)) 
from sys.objects O cross join sys.objects P;