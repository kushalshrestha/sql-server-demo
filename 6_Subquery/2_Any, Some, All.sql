select *
from tblTransaction as T
where EmployeeNumber in (select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber

-- USING ANY -> replace in with ->  '= any'
select *
from tblTransaction as T
where EmployeeNumber = any (select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber

-- USING SOME -> replace in with ->  '= some'
select *
from tblTransaction as T
where EmployeeNumber = some (select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber


-- EmployeeNumber not equal to any one of the (employeenumber from subquery)
-- 126 <> (126, 127, 128, 129) i.e 126 not equal to any one of the items i.e 126 <> 127 -> so will be included, 126 <> 128
-- So the result won't be proper
select *
from tblTransaction as T
where EmployeeNumber <> any (select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber
-- We need to use 'all'
-- 126 <> all (126, 127, 128, 129) i.e not equal to all of 126-129. So won't be included
-- 126<>126 and 126<> 127 and 126 <> 128 ...
-- ALL -> uses AND condition
-- THIS IS CORRECT
select *
from tblTransaction as T
where EmployeeNumber <> all (select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
and EmployeeNumber between 120 and 131
order by EmployeeNumber


----- EXTRA
--1. <= any
-- any up to 126 OR any up to 127 OR ... up to 129
select *
from tblTransaction as T
where EmployeeNumber <= any (select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
and EmployeeNumber between 120 and 200
order by EmployeeNumber;

--1. <= all
-- replace with AND
-- any up to 126 AND any up to 127 AND ... up to 129 i.e only up to 126 will be displayed
select *
from tblTransaction as T
where EmployeeNumber <= all (select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
and EmployeeNumber between 120 and 200
order by EmployeeNumber;