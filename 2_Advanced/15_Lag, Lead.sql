select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, LAG(NumberAttendance) over (partition by E.EmployeeNumber order by A.AttendanceMonth) as MyLag
, LEAD(NumberAttendance) over (partition by E.EmployeeNumber order by A.AttendanceMonth) as MyLead
, LAG(NumberAttendance, 3) over (partition by E.EmployeeNumber order by A.AttendanceMonth) as LagBy3
, LEAD(NumberAttendance, 3) over (partition by E.EmployeeNumber order by A.AttendanceMonth) as LeadBy3
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber