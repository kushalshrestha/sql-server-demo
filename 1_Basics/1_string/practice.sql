-- USING CHAR(n). The storage size is the size defined, here n bytes
declare @myChar as char(10)
set @myChar = 'hello'
select @myChar as myString, 
    len(@myChar) as myLength,  -- gives length of the value
    DATALENGTH(@myChar) as myDataLength --gives the data length defined 
-- OUTPUT hello 5 10
go

-- USING VARCHAR. The storage size is the actual length of data entered + 2 bytes
declare @myVarChar as varchar(10)
set @myVarChar = 'hello'
select @myVarChar as myString, 
    len(@myVarChar) as myLength,  -- gives length of the value
    DATALENGTH(@myVarChar) as myDataLength -- gives the data length defined
-- OUTPUT : hello 5 5
go


-- USING NCHAR
declare @myChar as nchar(10)
set @myChar = 'helload'
select @myChar as myString, 
    len(@myChar) as myLength,  -- gives length of the value
    DATALENGTH(@myChar) as myDataLength --gives the data length defined 
-- OUTPUT hello 7 20  -- 7 length &  10*2bytest = 20 bytes
go

-- USING NVARCHAR. The storage size is the actual length of data entered + 2 bytes
declare @myVarChar as nvarchar(100)
set @myVarChar = 'helload'
select @myVarChar as myString, 
    len(@myVarChar) as myLength,  -- gives length of the value
    DATALENGTH(@myVarChar) as myDataLength -- gives the data length defined
-- OUTPUT : hello 7 14 --7 length & 7*2bytes = 14 bytes
go
 

------ WHY USE N'<STRING>' for UNICODES? -----
declare @testChar as varchar(10);
set @testChar = N'helloȺ😉'
select @testChar, LEN(@testChar), DATALENGTH(@testChar);
GO

-- to support UNICODES, you need to add 'N' before the string
-- without adding N -> you'll get ??
declare @testChar as nvarchar(10);
set @testChar = 'helloȺ😉'
select @testChar, LEN(@testChar), DATALENGTH(@testChar);
GO
-- with adding N -> you'll get unicodes reflected properly
declare @testChar as nvarchar(10);
set @testChar = N'helloȺ😉'
select @testChar, LEN(@testChar), DATALENGTH(@testChar);
GO