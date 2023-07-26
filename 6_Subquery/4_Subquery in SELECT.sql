select *
from tblEmployee as E
where E.EmployeeLastName like 'y%';

-- now what about adding extra column in the above query : adding no. of transactions
select E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, count(T.EmployeeNumber) as NumTransactions
from tblTransaction as T
inner join tblEmployee as E
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeLastName like 'y%'
group by E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
order by E.EmployeeNumber;
-- THE above is more complicated. So let's use sub query

select E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, count(T.EmployeeNumber) as NumTransactions
from tblTransaction as T
inner join tblEmployee as E
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeLastName like 'y%'
group by E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
order by E.EmployeeNumber;

--- 
-- USING Corelated Sub Query
select E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, (select count(T.EmployeeNumber) as NumTransactions 
            from tblTransaction as T 
            where E.EmployeeNumber = T.EmployeeNumber) as NumTransactions
from tblEmployee as E
where E.EmployeeLastName like 'y%'
order by E.EmployeeNumber;
------
-- USING Corelated Sub Query
select E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
            , (select count(T.EmployeeNumber) as NumTransactions 
            from tblTransaction as T 
            where E.EmployeeNumber = T.EmployeeNumber) as NumTransactions
            , (select sum(Amount) as NumTransactions 
            from tblTransaction as T 
            where E.EmployeeNumber = T.EmployeeNumber) as SumTransactions
from tblEmployee as E
where E.EmployeeLastName like 'y%'
order by E.EmployeeNumber;


