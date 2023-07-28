
select ROW_NUMBER() over (order by (select null))
from tblTransaction; -- 1 to X (last number) will be pop up


select top 10 ROW_NUMBER() over (order by (select null))
from tblTransaction; -- 1 to 10 will be pop up

------------------------------------------------------------------------------------------------
/*
Q. Find the list of all employees who doesn't have their EmployeeNumber in the tblTransaction
*/
with Numbers as (
    select top(
            select max(EmployeeNumber)
            from tblTransaction
            )
            ROW_NUMBER() over (order by (select null)) as RowNumber
    from tblTransaction as U
)

select U.RowNumber 
from Numbers as U
left join tblTransaction as T
on U.RowNumber = T.EmployeeNumber
where T.EmployeeNumber is null
order by U.RowNumber;


/*
Q. IN 2014 only -> Find the list of all employees who doesn't have their EmployeeNumber in the tblTransaction
*/

with Numbers as (
    select top(
            select max(EmployeeNumber)
            from tblTransaction
            )
            ROW_NUMBER() over (order by (select null)) as RowNumber
    from tblTransaction as U
),
Transaction2014 as (select * from tblTransaction where DateOfTransaction >= '2014-01-01' and DateOfTransaction < '2015-01-01')

select U.RowNumber 
from Numbers as U
left join Transaction2014 as T
on U.RowNumber = T.EmployeeNumber
where T.EmployeeNumber is null
order by U.RowNumber;

-- This is perfect but gives a lot of rows. I need to have grouped from 172 - 177. how will you do?
