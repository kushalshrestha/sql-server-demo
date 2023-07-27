/* Using Recursive CTE find the boss level (hierarchy level) */
begin transaction
alter table tblEmployee
add managerId int
go

update tblEmployee
set managerId = ((EmployeeNumber - 123)/10) + 123
where EmployeeNumber > 123

update tblEmployee
set managerId = 1
where EmployeeNumber = 123;

with myTable as (
-- select e.EmployeeNumber, e.EmployeeFirstName, e.employeeLastName, e.managerId, e1.EmployeeFirstName as ManagerFirstName
-- from tblEmployee e
-- left join tblEmployee e1 on e.managerId = e1.EmployeeNumber
select EmployeeNumber, EmployeeFirstName, EmployeeLastName, 0 as BossLevel
from tblEmployee
where managerId is null
UNION ALL
select e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, m.BossLevel + 1 as BossLevel
from tblEmployee e
join myTable m on e.managerId = m.EmployeeNumber
)

select * from myTable;

rollback transaction
