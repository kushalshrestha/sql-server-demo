select * from dbo.TransactionList(123)
GO


-- UDFs can be used in SELECT, FROM, WHERE
select *, (select count(*) from dbo.TransactionList(E.EmployeeNumber)) as NumTransactions
from tblEmployee as E;

select *
from dbo.TransactionList(123);

select *
from tblEmployee as E
where (select count(*) from dbo.TransList(E.EmployeeNumber) > 3


-- Now what if you use the function for a join? -> You can't join a table + result from a function
select *
from tblEmployee as E
left join dbo.TransactionList(E.EmployeeNumber) as T
on E.EmployeeNumber = T.EmployeeNumber
-- You'll get error: The multi-part identifier "E.EmployeeNumber" could not be bound.
-- REASON
-- 123 left join TransactionList(123)
-- 124 left join TransactionList(124)
-- join doesn't work on these situation. 
-- SO the solution is: Instead you need to use apply
-- 1. Outer Apply(like left join)    2. Cross Apply (like inner join)

select *
from tblEmployee as E
outer apply dbo.TransactionList(E.EmployeeNumber) as T -- 2359 rows

select *
from tblEmployee as E
cross apply dbo.TransactionList(E.EmployeeNumber) as T -- 2253 rows


