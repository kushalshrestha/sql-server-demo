-- If you have partition only -> would give aggregation for complete records in single partition
-- If you have partition + order -> would give 'running total' for all rows within a single parition
-- If you have partition + order + rows between x preceding and y following -> would give 'running total' but considers x preceding & y following row from current row

select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, sum(A.NumberAttendance) over(
                                partition by A.EmployeeNumber, year(A.AttendanceMonth) 
                                order by AttendanceMonth
                                rows between 1 preceding and 1 following -- only order would give running total for all rows within a single parition
                                ) as RunningTotal
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber