
declare @mydate as datetime = '2015-06-24 12:34:56.124'
select @mydate;
go

-- If above doesn't work on your version
declare @mydate as datetime = '20150624 12:34:56.124'
select @mydate;
declare @mydate1 as datetime = '2015-06-24T12:34:56.124' -- add T on the space between date and time
select @mydate1
go

-- Setting Dates and Date Extraction
declare @mydate as datetime = '2015-06-24 12:34:56.124'
select @mydate; -- you're output is 2015-06-24 12:34:56.123 instead of 2015-06-24 12:34:56.124
-- b/c datetime has an accuracy of 0.00333 second 
-- so your output will be 3, 7 or 0 due to round off in 3rd decimal place i.e 123 or 127 or 130
-- Hence, use datetime2

-- HERE's the correct datetime2 format to use
declare @mydate1 as datetime2 = '2015-06-24 12:34:56.129'
declare @mydate2 as datetime2(3) = '2015-06-24 12:34:56.129'
declare @mydate3 as datetime2(5) = '2015-06-24 12:34:56.129'

select @mydate1, @mydate2, @mydate3; -- 2015-06-24 12:34:56.1290000	| 2015-06-24 12:34:56.129 |	2015-06-24 12:34:56.12900


select datefromparts(2015,06,24) as thisDate; -- 2015-06-24
select datetime2fromparts(2015,06,24,12,34,56,124,3) as thatDate; -- 2015-06-24 12:34:56.124 --last arg '3' is the decimal place

--Extracting year, month, day from date
declare @mydate4 as datetime2 = '2015-06-24 12:34:56.129'
select year(@mydate4), MONTH(@mydate4), DAY(@mydate4);

----- GETTING TODAY'S DATE-----
select CURRENT_TIMESTAMP as currentDateTime; -- 2023-07-06 03:47:56.050
select GETDATE() as currentDateTime; -- 2023-07-06 03:47:56.050
select SYSDATETIME() as currentDateTime; -- 2023-07-06 03:47:56.0566666
-- CURRENT_TIMESTAMP : standard function for sql
-- GETDATE() : MS SQL Version
-- SYSDATETIME() : more accurate b/c includes 7 decimal. So if you want more precise, use this

--------- ADDING A DATE --------
select dateadd(YEAR, 1, GETDATE());
select dateadd(MONTH, 1, GETDATE());

---- GETTING A PART FROM DATE -----
select datepart(hour, '2023-07-06 03:47:56.050'); -- 3
select datepart(hour, GETDATE()); -- 3
select datepart(MONTH, GETDATE()); -- 3
select datename(WEEK, GETDATE()); -- get week of a year
select datename(weekday, GETDATE()); -- Thursday

-- GET DATE DIFF ---
select datediff(SECOND, '2023-07-05', GETDATE()); -- 100907 difference in second from 00:00:00
select datediff(HOUR, '2023-07-05', GETDATE()); -- gives hour difference