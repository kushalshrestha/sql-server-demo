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
select REPLACE(@text, 'l', '*')