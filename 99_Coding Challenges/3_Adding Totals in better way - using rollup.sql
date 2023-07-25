-- 2. Using ROLLUP (BEST WAY)
select E.Department, E.EmployeeNumber, A.AttendanceMonth, sum(A.NumberAttendance) as NumberAttendance
from tblEmployee E
join tblAttendance A
on E.EmployeeNumber = A.EmployeeNumber
group by rollup(E.Department, E.EmployeeNumber, A.AttendanceMonth) -- every selected column must be there
order by Department, EmployeeNumber, AttendanceMonth;