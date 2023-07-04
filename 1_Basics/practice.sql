SELECT 1+1
;
SELECT 1+1 RESULT;
SELECT 1+1 AS RESULT;

INSERT INTO tblFirst
VALUES
    (234);

SELECT *
FROM tblFirst;


USE [AdventureWorks2012]
GO

CREATE TABLE tblEmployee
(
    EmployeeNumber int,
    EmployeeName int
);


DECLARE @myVar AS int = 2;
SELECT @myVar;
GO


DECLARE @myVar AS int = 2;
SET @myVar = @myVar + 1;
set @myVar = 3.5;
SELECT @myVar AS myVariable;
GO


 -- Creating temporary variables
-- Initialise a variable, give it a data type and an initial value
DECLARE @myvar as int = 2
-- Increase that value by 1
SET @myvar = @myvar + 1
-- Retrieve that value
SELECT @myvar AS myVariable
GO



--tinyint 0 to 255
DECLARE @myVar AS tinyint = 255;
SELECT @myVar;
GO
--but if you put negative or numbers above 255, you'll get "Arithmetic overflow error for data type tinyint"
DECLARE @myVar AS tinyint = -1;
SELECT @myVar;
go

/* DECIMAL AND NUMERIC*/
DECLARE @myvar as decimal(7,2) -- or decimal(7,2) - 5 bytes needed
SET @myvar = 123456.7
SELECT @myvar AS myVariable
GO
-- 12345.67 is valid for the above.
-- 12345.6 is valid, you'll get 12345.60
-- 12345.699 is valid, but you'll get 12345.70 (round off)
-- 123456.7 is not valid. "Arithmetic overflow error converting numeric to data type numeric"
----END

DECLARE @myvar as numeric(7,2) -- or decimal(7,2) - 5 bytes needed
SET @myvar = 12345.7
SELECT @myvar AS myVariable
GO
-- 12345.67 is valid for the above.
-- 12345.6 is valid, you'll get 12345.60
-- 12345.699 is valid, but you'll get 12345.70 (round off)
-- 123456.7 is not valid. "Arithmetic overflow error converting numeric to data type numeric"
---END

-- Q. What if you don't put scale? See below
DECLARE @myvar as numeric(7) 
SET @myvar = 123456.7
SELECT @myvar AS myVariable
GO
-- 12345.67 is valid for the above.
-- 12345.6 is valid, you'll get 12345.60
-- 12345.699 is valid, but you'll get 12345.70 (round off)
-- 123456.7 is not valid. "Arithmetic overflow error converting numeric to data type numeric"

-- Q. What will be the output for 7 precision and 0 scale?
-- first calculates the scale. Scale can have any number of digits
-- second, now calculates the precision. It's 7 so valid. 
-- third, arithmetic operation takes place i.e round offs
DECLARE @myvar as numeric(7,0) 
SET @myvar = 1234567.73293890432
SELECT @myvar AS myVariable
GO

/*** money and smallmoney ***/
declare @myvar as smallmoney = 123456.78917;
select @myvar as myVariable;
go
-- 123456.78917 will be 123456.7892 (round off) b/c range: -214,748.3648 to 214,748.3647 + only 4 decimals

/** float and real **/
-- Gives approximate numbers. Don't use it
declare @myvar as FLOAT(24) = 1234567890.7891
declare @myvar1 as real = 1234567890.7891

select @myvar, @myvar1; -- 1.234568E+09,	1.234568E+09
go
