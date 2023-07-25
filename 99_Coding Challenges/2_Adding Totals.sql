--- WAYS OF FINDING THE TOTAL
--1. using partition by
select E.Department, E.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, sum(A.NumberAttendance) over (partition by E.EmployeeNumber order by AttendanceMonth) as cumulativeAttendanceForEmployeeNumber
, sum(A.NumberAttendance) over (partition by E.EmployeeNumber 
                                order by AttendanceMonth 
                                range between Unbounded preceding and unbounded following) as toatlAttendanceByEmployeeNumber
from tblEmployee E
join tblAttendance A
on E.EmployeeNumber = A.EmployeeNumber
order by Department, EmployeeNumber, AttendanceMonth;

--2.  using grouping
select E.Department, E.EmployeeNumber 
, sum(A.NumberAttendance) as TotalAttendance
from tblEmployee E
join tblAttendance A
on E.EmployeeNumber = A.EmployeeNumber
group by E.Department, E.EmployeeNumber
order by Department, EmployeeNumber;


select sum(NumberAttendance) as GrandTotal
from tblAttendance -- 35409


----------
-- Q. How would you do the reconciliation and show the following all at once : 
-- 1. TOTAL for each employeeNumber 
-- 2. Total for each employeenumber & total for each department
-- 3. Grand Total


--- 1st Method: Not a good approach
select E.Department, E.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
from tblEmployee E
join tblAttendance A
on E.EmployeeNumber = A.EmployeeNumber
UNION -- for totalAttendance by EmployeeNumber
select E.Department, E.EmployeeNumber, null, sum(A.NumberAttendance) as TotalAttendance
from tblEmployee E
join tblAttendance A
on E.EmployeeNumber = A.EmployeeNumber
group by E.Department, E.EmployeeNumber
UNION -- for totalAttendance by Department
select E.Department, null, null, sum(A.NumberAttendance) as TotalAttendance
from tblEmployee E
join tblAttendance A
on E.EmployeeNumber = A.EmployeeNumber
group by E.Department
UNION
select null, null, null, sum(A.NumberAttendance) as TotalAttendance
from tblEmployee E
join tblAttendance A
on E.EmployeeNumber = A.EmployeeNumber
order by Department, EmployeeNumber;


-- 2. Using ROLLUP (BEST WAY)
select E.Department, E.EmployeeNumber, A.AttendanceMonth, sum(A.NumberAttendance) as NumberAttendance
from tblEmployee E
join tblAttendance A
on E.EmployeeNumber = A.EmployeeNumber
group by rollup(E.Department, E.EmployeeNumber, A.AttendanceMonth) -- every selected column must be there
order by Department, EmployeeNumber, AttendanceMonth;


