
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


-- USING Corelated Sub Query in WHERE


select T.EmployeeNumber, count(Amount)
from tblTransaction as T
where exists (select EmployeeNumber from tblEmployee as E where E.EmployeeLastName like 'y%' and T.EmployeeNumber = E.EmployeeNumber)
group by T.EmployeeNumber
order by EmployeeNumber;


select E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, count(T.EmployeeNumber) as NumTransactions
from tblTransaction as T
inner join tblEmployee as E
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeLastName like 'y%'
group by E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
order by E.EmployeeNumber;