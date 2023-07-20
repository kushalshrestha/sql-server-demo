use AdventureWorks2012

select A.EmployeeNumber, year(A.AttendanceMonth) as AttendanceYear, sum(A.NumberAttendance) as TotalAttendance
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
group by A.EmployeeNumber, year(A.AttendanceMonth)
order by A.EmployeeNumber, year(AttendanceMonth)

-- OVER() -> Window function. If only over(), the window will be whole records
select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, sum(A.NumberAttendance) over() as TotalAttendance
, convert(decimal(18,7),A.NumberAttendance)/sum(A.NumberAttendance) over() * 100.0 as PercentageAttendance
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber