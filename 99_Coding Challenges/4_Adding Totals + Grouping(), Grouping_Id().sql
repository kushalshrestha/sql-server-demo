-- What if column has NULL -> we get confused whether its a NULL value while grouping or not right? 
-- So, in order to detect, we use GROUPING() method OR GroupingID()
-- GROUPING_ID rule:
-- If grouping on only 1 column -> 1
-- If grouping on 2 column -> 1+2=3
-- If grouping on 3 column -> 1+2+4=7


select E.Department, E.EmployeeNumber, A.AttendanceMonth, sum(A.NumberAttendance) as NumberAttendance, 
GROUPING(A.AttendanceMonth) as EmpNumGroupedBy -- where grouping is done there will be 1, else 0
, GROUPING(E.EmployeeNumber) as EmpNumGroupedBy -- where grouping is done there will be 1, else 0
, GROUPING(E.Department) as EmpNumGroupedBy -- where grouping is done there will be 1, else 0
, GROUPING_ID(E.EmployeeNumber) as EmpNumberGroupID -- where grouping is done there will be 1. The only diff between grouping and grouping_id is: grouping_id can have multiple columns
, GROUPING_ID(E.Department, E.EmployeeNumber, A.AttendanceMonth) as EmpNumberGroupID 
from tblEmployee E
join tblAttendance A
on E.EmployeeNumber = A.EmployeeNumber
group by rollup(E.Department, E.EmployeeNumber, A.AttendanceMonth) -- every selected column must be there
order by Department, EmployeeNumber, AttendanceMonth

/* NOW, ROLLUP-> gives shorthand for defining multiple grouping sets. Eg: 
Eg: ROLLUP(c1, c2, c3) gives:
(c1, c2, c3), (c1, c2), (c1), ()
But CUBE() gives all possible grouping sets
(c1, c2, c3), (c1, c2), (c1, c3), (c2, c3), (c1), (c2), (c3)
Eg: in above case it's difficult to get sum by EmployeeNumber only. So we need to use CUBE()
*/

select E.Department, E.EmployeeNumber, A.AttendanceMonth, sum(A.NumberAttendance) as NumberAttendance
, GROUPING(E.EmployeeNumber) as EmpNumGroupedBy -- where grouping is done there will be 1, else 0
, GROUPING_ID(E.Department, E.EmployeeNumber, A.AttendanceMonth) as EmpNumberGroupID 
from tblEmployee E
join tblAttendance A
on E.EmployeeNumber = A.EmployeeNumber
group by CUBE(E.Department, E.EmployeeNumber, A.AttendanceMonth) -- every selected column must be there
order by Department, EmployeeNumber, AttendanceMonth;
-- 3996 records
-- BUT THIS gives all permutation. What if we need only by E.Department?
-- using GROUPING SETS Here's the answer and gives much more refined control.
select E.Department, E.EmployeeNumber, A.AttendanceMonth, sum(A.NumberAttendance) as NumberAttendance
, GROUPING(E.EmployeeNumber) as EmpNumGroupedBy -- where grouping is done there will be 1, else 0
, GROUPING_ID(E.Department, E.EmployeeNumber, A.AttendanceMonth) as EmpNumberGroupID 
from tblEmployee E
join tblAttendance A
on E.EmployeeNumber = A.EmployeeNumber
group by GROUPING SETS (( E.Department, E.EmployeeNumber, A.AttendanceMonth), E.Department)
order by Department, EmployeeNumber, AttendanceMonth

-- !!! GROUPING SETS () can be used to replicate CUBE() & to replicate ROLLUP(). i.e GROUPING SETS is Versatile

-- Grand Total using Grouping SETS -> Add () in Grouping sets
select E.Department, E.EmployeeNumber, A.AttendanceMonth, sum(A.NumberAttendance) as NumberAttendance
, GROUPING(E.EmployeeNumber) as EmpNumGroupedBy -- where grouping is done there will be 1, else 0
, GROUPING_ID(E.Department, E.EmployeeNumber, A.AttendanceMonth) as EmpNumberGroupID 
from tblEmployee E
join tblAttendance A
on E.EmployeeNumber = A.EmployeeNumber
group by GROUPING SETS (( E.Department, E.EmployeeNumber, A.AttendanceMonth), (E.Department), ())
order by Department, EmployeeNumber, AttendanceMonth
-- BUt the ordering is improper. Summary should be at the bottom


select E.Department, E.EmployeeNumber, A.AttendanceMonth, sum(A.NumberAttendance) as NumberAttendance
, GROUPING(E.EmployeeNumber) as EmpNumGroupedBy -- where grouping is done there will be 1, else 0
, GROUPING_ID(E.Department, E.EmployeeNumber, A.AttendanceMonth) as EmpNumberGroupID 
from tblEmployee E
join tblAttendance A
on E.EmployeeNumber = A.EmployeeNumber
group by GROUPING SETS (( E.Department, E.EmployeeNumber, A.AttendanceMonth), (E.Department), ())
order by CASE WHEN Department IS NULL THEN 1 ELSE 0 END, Department, 
        CASE WHEN E.EmployeeNumber IS NULL THEN 1 ELSE 0 END, EmployeeNumber,
        CASE WHEN AttendanceMonth IS NULL THEN 1 ELSE 0 END, AttendanceMonth