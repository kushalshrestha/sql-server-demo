-- ROWS VS RANGE
-- Here's the perfect example
-- If the case is 'Unbounded preceding and current row'
-- ROWS -> looks till current row
-- RANGE -> looks for current row + any ties with current row. In the below example there are ties 
-- IMP!!! RANGE is only supported with UNBOUNDED & CURRENT ROW
select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, sum(A.NumberAttendance) over(
                                partition by A.EmployeeNumber, year(A.AttendanceMonth) 
                                order by AttendanceMonth
                                rows between Unbounded preceding and current row -- only order would give running total for all rows within a single parition
                                )  as RowsTotal
, sum(A.NumberAttendance) over(
                                partition by A.EmployeeNumber, year(A.AttendanceMonth) 
                                order by AttendanceMonth
                                range between Unbounded preceding and current row -- only order would give running total for all rows within a single parition
                                )  as RangeTotal
from tblEmployee as E
join (select * from tblAttendance UNION ALL select * from tblAttendance) as A
on E.EmployeeNumber = A.EmployeeNumber
order by A.EmployeeNumber, A.AttendanceMonth;


-- THIS WILL GIVE ERROR: RANGE is only supported with UNBOUNDED and CURRENT ROW window frame delimiters.
select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, sum(A.NumberAttendance) over(
                                partition by A.EmployeeNumber, year(A.AttendanceMonth) 
                                order by AttendanceMonth
                                rows between Unbounded preceding and current row -- only order would give running total for all rows within a single parition
                                )  as RowsTotal
, sum(A.NumberAttendance) over(
                                partition by A.EmployeeNumber, year(A.AttendanceMonth) 
                                order by AttendanceMonth
                                range between 1 preceding and current row -- only order would give running total for all rows within a single parition
                                )  as RangeTotal
from tblEmployee as E
join (select * from tblAttendance UNION ALL select * from tblAttendance) as A
on E.EmployeeNumber = A.EmployeeNumber
order by A.EmployeeNumber, A.AttendanceMonth;