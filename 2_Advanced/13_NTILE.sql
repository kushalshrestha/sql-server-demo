select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, NTILE(10) OVER(Partition by E.EmployeeNumber order by A.AttendanceMonth) as BucketNumber
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
where A.AttendanceMonth < '20150101'