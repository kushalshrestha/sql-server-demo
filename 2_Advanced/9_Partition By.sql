select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, sum(A.NumberAttendance) over(partition by A.EmployeeNumber) as TotalAttendance
, convert(decimal(18,7),A.NumberAttendance)/sum(A.NumberAttendance) over(partition by A.EmployeeNumber) * 100.0 as PercentageAttendance
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
where A.AttendanceMonth < '20150101'

-- Now adding order after partition by-> gives running total
select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, sum(A.NumberAttendance) over(partition by A.EmployeeNumber order by AttendanceMonth DESC) as RunningTotal
-- , convert(decimal(18,7),A.NumberAttendance)/sum(A.NumberAttendance) over(partition by A.EmployeeNumber) * 100.0 as PercentageAttendance
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
where A.AttendanceMonth < '20150101'



select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, sum(A.NumberAttendance) over(partition by A.EmployeeNumber, year(A.AttendanceMonth) order by AttendanceMonth) as RunningTotal
-- , convert(decimal(18,7),A.NumberAttendance)/sum(A.NumberAttendance) over(partition by A.EmployeeNumber) * 100.0 as PercentageAttendance
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber