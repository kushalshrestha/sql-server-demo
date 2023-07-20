
select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, sum(A.NumberAttendance) over(
                                partition by A.EmployeeNumber, year(A.AttendanceMonth) 
                                order by AttendanceMonth
                                rows between 1 preceding and 0 following -- only order would give running total for all rows within a single parition
                                ) as RunningTotal
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber

-- rows between X(HUGE NUMBER) preceding -> gives running total. But the better approach is using 'UNBOUNDED'
select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, sum(A.NumberAttendance) over(
                                partition by A.EmployeeNumber, year(A.AttendanceMonth) 
                                order by AttendanceMonth
                                rows between 99999 preceding and 0 following -- only order would give running total for all rows within a single parition
                                ) as RunningTotal
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber

--- USING UNBOUNDED -> you could you UNBOUNDED preceding and 0 following | OR | 0 preceding and UNBOUNDED following
select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, sum(A.NumberAttendance) over(
                                partition by A.EmployeeNumber, year(A.AttendanceMonth) 
                                order by AttendanceMonth
                                rows between UNBOUNDED preceding and 0 following -- only order would give running total for all rows within a single parition
                                ) as RunningTotal
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber


--- ANOTHER EXAMPLE
select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, sum(A.NumberAttendance) over(
                                partition by A.EmployeeNumber, year(A.AttendanceMonth) 
                                order by AttendanceMonth
                                rows between 0 preceding and 1 following -- only order would give running total for all rows within a single parition
                                ) as RunningTotal
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber

-- 0 preceding -> 0 can be replaced by current row
select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, sum(A.NumberAttendance) over(
                                partition by A.EmployeeNumber, year(A.AttendanceMonth) 
                                order by AttendanceMonth
                                rows between current row and UNBOUNDED following -- only order would give running total for all rows within a single parition
                                ) - A.NumberAttendance as RunningTotal
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber

-- we can discard current row in this way too i.e after over(....) - A.columnOfCurrentRow . see below
select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, sum(A.NumberAttendance) over(
                                partition by A.EmployeeNumber, year(A.AttendanceMonth) 
                                order by AttendanceMonth
                                rows between current row and UNBOUNDED following -- only order would give running total for all rows within a single parition
                                ) - A.NumberAttendance as RunningTotal
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber