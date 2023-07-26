select *
from tblTransaction as T
inner join tblEmployee as E
on E.EmployeeNumber = T.EmployeeNumber
where EmployeeLastName like 'y%'
order by T.EmployeeNumber;

-- ALTERNATE WAY: Using Subquery
select *
from tblTransaction as T
where EmployeeNumber in (select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber

-- NOT LIKE -> is like tblTransaction INNER JOIN tblEmployee + not 126-129
select *
from tblTransaction as T
where EmployeeNumber in (select EmployeeNumber from tblEmployee where EmployeeLastName not like 'y%')
order by EmployeeNumber;

-- NOT IN -> is like tblTransaction LEFT JOIN tblEmployee + not 126-129
select distinct EmployeeNumber
from tblTransaction as T
where EmployeeNumber not in (select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber;

