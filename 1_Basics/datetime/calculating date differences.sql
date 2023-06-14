select ModifiedDate
    , DATEDIFF(DAY,  ModifiedDate, GETDATE()) as dateDifferenceByDay
    , DATEDIFF(YEAR,  ModifiedDate, GETDATE()) as YearDifference
    , DATEDIFF(MONTH,  ModifiedDate, GETDATE()) as MonthDifference
    , DATEDIFF(HOUR, ModifiedDate, GETDATE()) as HourDifference
    , DATEDIFF(MINUTE,  ModifiedDate, GETDATE()) as MinuteDifference
from Person.Address;
