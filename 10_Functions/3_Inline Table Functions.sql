-- Inline Table Function -> returns a table


if OBJECT_ID('TransactionList', 'IF') is not null
    drop function [dbo].[TransactionList]
go

CREATE FUNCTION [dbo].[TransactionList] (@EmployeeNumber int)
RETURNS TABLE 
AS -- NO BEGIN END b/c it returns single statement table
RETURN
(

    select *
    from tblTransaction
    WHERE EmployeeNumber = @EmployeeNumber
)
GO

select *
from dbo.TransactionList(123) --> this returns a table so we need to use in 'from'

-- now to get all tblEmployee who has a transaction
select *
from tblEmployee
where exists (select * from dbo.TransactionList(EmployeeNumber))

-- Comparing with join
select E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, count(T.EmployeeNumber) as TransNum
from tblEmployee as E
join tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
group by E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName