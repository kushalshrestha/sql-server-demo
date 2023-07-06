------CONVERTING DATES INTO STRING----------
-- doesn't work due to datetime higher in precedence & string won't be converted to datetime
-- either you need to cast or convert it to string
DECLARE @mydate AS datetime = '2015-06-25 01:02:03.456'
SELECT 'The date and time is: ' + @mydate
GO

-- converting datetime to string -> WORKS
DECLARE @mydate AS datetime = '2015-06-25 01:02:03.456'
SELECT 'The date and time is : ' + CONVERT(nvarchar(20), @mydate) AS MyConvertedDate
GO
DECLARE @mydate AS datetime = '2015-06-25 01:02:03.456'
SELECT 'The date and time is : '+cast(@mydate AS nvarchar(20)) AS MyCastDate
--------------------

SELECT CONVERT(date, 'Thursday, 25 June 2015') AS MyConvertedDate
-- Above fails: Conversion failed when converting date and/or time from character string.

-- This will work. But some version gives CLR (Common Language Runtime) is not enabled on this instance
SELECT parse('Thursday, 25 June 2015' AS date) AS MyParsedDate
SELECT parse('Jueves, 25 de junio de 2015' AS date USING 'es-ES') AS MySpanishParsedDate


--------------


-----CONVERTING STRING INTO DATES ---------
SELECT cast('2015-06-25 01:02:03.456' AS datetime);
SELECT format(cast('2015-06-25 01:02:03.456' AS datetime), 'D') AS MyFormattedLongDate;
-- Thursday, June 25, 2015

SELECT format(cast('2015-06-25 01:02:03.456' AS datetime), 'd') AS MyFormattedShortDate;
-- 6/25/2015

SELECT format(cast('2015-06-25 01:02:03.456' AS datetime), 'dd-MM-yyyy') AS MyFormattedBritishDate;
-- 25-06-2015, NOT mm -> minutes

SELECT format(cast('2015-06-25 01:02:03.456' AS datetime), 'D', 'es-ES') AS MyFormattedInternationalLongDateBasedOnCulture;  -- Jueves, 25 de junio de 2015
