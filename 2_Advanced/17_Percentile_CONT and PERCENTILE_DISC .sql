/*
MEAN
MODE - highest repeating number
MEDIAN - Percentile 50% - 
*/

select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, CUME_DIST() over (partition by E.EmployeeNumber
                    order by A.NumberAttendance) as MyCume_Dist
, PERCENT_RANK() over (PARTITION by E.EmployeeNumber
                    order by A.NumberAttendance) * 100 as MyPercent_Rank -- you'll see 50% percentile near '2015-02-01' i.e 52.38
from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
where A.EmployeeNumber = 123;


------- Let's see what's the median number of attendance for each employee number i.e 50% percentile i.e Average
select distinct EmployeeNumber,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY NumberAttendance) over (partition by EmployeeNumber) as AverageOfContinuous,
PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY NumberAttendance) over (partition by EmployeeNumber) as AverageOfDiscrete
from tblAttendance