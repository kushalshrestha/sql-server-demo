-- Now, using multistatement table function
if OBJECT_ID('TransactionList', 'IF') is not null
    drop function [dbo].[TransactionList]
go

CREATE FUNCTION [dbo].[TransactionList] (@EmployeeNumber int)
RETURNS @TransList TABLE
(
    Amount smallmoney,
    DateOfTransaction smalldatetime,
    EmployeeNumber int
) 
AS
BEGIN
    INSERT INTO @TransList(Amount, DateOfTransaction, EmployeeNumber)
    SELECT Amount, DateOfTransaction, @EmployeeNumber 
    FROM tblTransaction
    WHERE EmployeeNumber = @EmployeeNumber
    RETURN
END
GO

select *
from dbo.TransactionList(123) --> this returns a table so we need to use in 'from'
