
select ModifiedDate
    , CURRENT_TIMESTAMP as currentTimestamp-- get current datetime
    , GETDATE() as currentDateTime--  get datetime
    , CAST(GETDATE() AS DATE)  as date-- get only date
from Person.Address