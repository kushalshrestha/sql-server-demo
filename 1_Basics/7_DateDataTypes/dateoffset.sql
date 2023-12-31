DECLARE @myDateOffset AS datetimeoffset = '2015-06-26 01:02:03.456 +05:30'
DECLARE @myDateOffset2 AS datetimeoffset(2) = '2015-06-26 01:02:03.456 +05:30'

-- datetimeoffset is related to datetime2
SELECT @myDateOffset AS MyDateOffset, @myDateOffset2
GO

-- TODATETIMEOFFSET JUST ADDS OFFSET, so don't use to convert, it only adds the offset
DECLARE @mydate AS datetime2 = '2015-06-26 01:02:03.456'
SELECT TODATETIMEOFFSET(@mydate, '+05:30') AS MyDateOffset

SELECT DATETIMEOFFSETFROMPARTS(2015, 06, 25, 1, 2,3,456,5,30,3) AS MyDateOffset
SELECT DATETIME2FROMPARTS(2015,06,25,1,2,3,456,3) as DATETIME2WITHOUTOFFSET;


SELECT sysdatetimeoffset() AS TimeNowWithOffset;

-- SYSUTCDATETIME() to get UTC TIME
SELECT SYSUTCDATETIME() AS TimeNowUTC, CURRENT_TIMESTAMP, GETDATE(), SYSDATETIME();


-- !!!IMPORTANT THIS IS THE BEST WAY TO CHANGE THE TIMEZONE
DECLARE @myDateOffset AS datetimeoffset = '2015-06-25 10:41:03.456 +05:45' -- KATHMANDU TIME
-- KATHMANDU TIME NOW CHANGED TO TEXAS TIME
SELECT SWITCHOFFSET(@myDateOffset, '-05:00') AS MyDateOffsetTexas