select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, FIRST_VALUE(NumberAttendance) over (partition by E.EmployeeNumber order by A.AttendanceMonth) as First
, LAST_VALUE(NumberAttendance) over (partition by E.EmployeeNumber order by A.AttendanceMonth) as LatestSoFar
, LAST_VALUE(NumberAttendance) over (partition by E.EmployeeNumber order by A.AttendanceMonth 
            rows between unbounded preceding and unbounded following) as Last
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber