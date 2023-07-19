DECLARE @var1 AS int = 2
DECLARE @var2 AS varchar = '3'
DECLARE @var3 AS varchar = 'AB'


SELECT @var1 + @var2;
-- 5
SELECT @var1 + @var3;
-- Conversion failed when converting the varchar value 'A' to data type int.


-------------
    SELECT CONVERT(char(5), 'hi') as GREETING -- Column name are taken from first statement i.e GREETING
UNION
    SELECT CONVERT(char(11), 'hello there') as GREETING1
UNION
    SELECT CONVERT(char(15), 'bonjour')
GO
-- The order is not guaranteed
-- bonjour
-- hi
-- hello there


    SELECT CONVERT(char(5), 'hi')
UNION
    SELECT CONVERT(bigint, 456)
-- Error converting data type varchar to bigint.


select 'hi'
UNION
select 'hello there'
UNION 
select 'hi'
UNION ALL -- will consider even the duplicates
select 'hi'