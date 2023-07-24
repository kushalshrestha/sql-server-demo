select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, CUME_DIST() over (partition by E.EmployeeNumber 
                    order by A.AttendanceMonth
                    ) as CumulativeDistribution
, cast(ROW_NUMBER() over (partition by E.EmployeeNumber 
                        order by A.AttendanceMonth) as decimal(9,5)) / count(*) over (partition by E.EmployeeNumber
                        ) as SelfCalculatedCumulativeDistribution


, PERCENT_RANK() over (partition by E.EmployeeNumber 
                        order by A.AttendanceMonth) as PERCENT_RANK
, cast(ROW_NUMBER() over (partition by E.EmployeeNumber 
                            order by A.AttendanceMonth) - 1 as decimal(9,5)) / count(*) over (partition by E.EmployeeNumber
                        ) as SelfCalculatedCumulativeDistribution

from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber;


-------
select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
, CUME_DIST() over (partition by E.EmployeeNumber 
                    order by A.NumberAttendance
                    ) as CumulativeDistribution
, PERCENT_RANK() over (partition by E.EmployeeNumber 
                        order by A.NumberAttendance) as PERCENT_RANK

from tblEmployee as E
join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber