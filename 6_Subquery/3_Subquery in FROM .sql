select *
from tblTransaction as T
inner join tblEmployee as E
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeLastName like 'y%'
order by T.EmployeeNumber

-- NOW using SUBQUERY
select *
from tblTransaction as T
inner join (Select * 
            from tblEmployee
            where EmployeeLastName like 'y%'
            ) as E
on E.EmployeeNumber = T.EmployeeNumber
order by T.EmployeeNumber
