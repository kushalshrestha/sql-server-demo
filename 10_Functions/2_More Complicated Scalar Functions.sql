-- if exists (select * from sys.objects where name = 'NumberOfTransactions' and type='FN')
--     DROP FUNCTION NumberOfTransactions
-- GO

IF object_ID(N'NumberOfTransactions' , N'FN') is not null
    DROP FUNCTION NumberOfTransactions
GO

CREATE FUNCTION NumberOfTransactions(@EmployeeNumber int)
RETURNS int
AS
BEGIN
    Declare @NumberOfTransactions INT

    select @NumberOfTransactions = count(*) 
    from tblTransaction
    where EmployeeNumber = @EmployeeNumber;

    RETURN @NumberOfTransactions
END
GO


select *, dbo.NumberOfTransactions (EmployeeNumber) as TransNum
from tblEmployee;

-- Comparing Query Execution Plan with joining table and getting no. of transaction
select E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, count(T.EmployeeNumber) as TransNum
from tblEmployee as E
left join tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
group by E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName