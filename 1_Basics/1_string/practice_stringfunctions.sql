declare @charASCII as varchar(10) = 'hello😃'
declare @charUnicode as nvarchar(10) = N'Hello😀🥲'

-- LEFT(), RIGHT()
select @charASCII, @charUnicode, left(@charASCII,2), LEFT(@charUnicode,2), RIGHT(@charASCII,2), RIGHT(@charUnicode, 2);

-- SUBSTRING(variable, starting_point, length)
select SUBSTRING(@charUnicode,3,2) as middleletters
-- OUTPUT: ll
GO

---------- TRIM, LTRIM, RTRIM ---------------
declare @charUnicode as nvarchar(10) = N'   Hello     '
select TRIM(@charUnicode), LTRIM(@charUnicode), RTRIM(@charUnicode);
-- OUTPUT: 'Hello', 'Hello  ', '   Hello'
-- older version that 2017: TRIM() was not recognized. So you had to use: LTRIM(RTRIM(@charUnicode))
GO
---------- REPLACE ---------
declare @text as nvarchar(10) = 'Hello'
select REPLACE(@text, 'l', '*');

------ UPPER(), LOWER() ------------
select upper('Kushal') as myUpper, lower('Kushal') as mylower;


------- HANDLING NULLs -------
declare @variable as int = 10000;
select convert(decimal(5,2), @variable)
select cast(@variable as decimal(5,2))
select TRY_CONVERT(decimal(5,2), @variable)
select TRY_CAST(@variable as decimal(5,2))
go

--------- Joining two strings together -------
-- Concatenation but one of the variable value is NULL.
DECLARE @firstname as NVARCHAR(20)
DECLARE @middlename as NVARCHAR(20)
DECLARE @lastname as NVARCHAR(20)
SET @firstname = 'Kushal'
SET @lastname = 'Shrestha'
SELECT CONCAT(@firstname, ' ', @lastname) as name
    , @firstname + ' ' + @lastname as name
    
    , @firstname + ' ' + @middlename + ' ' + @lastname as nameWithMiddleName --- Will give null. b/c NULL + (anything) results to NULL
    -- 1st way using IIF()
    , @firstname + ' ' + IIF(@middlename is null, '', ' '+@middleName) + ' ' + @lastname as nameWithMiddleNameUsingIIF
    -- 2nd Way using Case
    , @firstname + CASE 
        WHEN @middlename is NULL THEN ''
        ELSE ' ' + @middlename
    END + ' ' + @lastName as nameWithMiddleNameUsingCase
    -- 3rd way using coalesce()
    , @firstname + ' ' + coalesce(@middlename, '') + @lastname as nameWithMiddleNameUsingCoalesce
    -- 4th way using CONCAT()
    , CONCAT(@firstname, ' ', @middlename, ' ', @lastname) as nameWithMiddleNameUsingConcat


GO


------- DATA TYPE CONVERSION --------
Select 'My number is : ' + 10; -- gives error : Conversion failed when converting the varchar value 'My number is : ' to data type int.
-- varchar is trying to convert to int. Here int has higher precedence than varchar but implicit conversion fails

-- Correct way: 
Select 'My number is: ' + convert(varchar(20), 4567);
Select 'My Number is: ' + cast(4567 as varchar(20));
Select 'My salary is: '+ format(2345.6, 'C'); -- $2,345.6
Select 'My salary is: '+ format(2345.6, 'C', 'en-US'); -- $2,345.6
