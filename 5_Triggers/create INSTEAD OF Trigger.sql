DROP TRIGGER tr_ViewByDepartment

CREATE TRIGGER tr_ViewByDepartment
ON [dbo].[ViewByDepartment]
INSTEAD OF DELETE
AS
BEGIN
    declare @EmployeeNumber as int
    declare @DateOfTransaction as smalldatetime
    declare @Amount as SMALLMONEY

    select @EmployeeNumber = EmployeeNumber, @DateOfTransaction = DateOfTransaction, @Amount = TotalAmount
    from deleted

    delete tblTransaction
    from tblTransaction as T
    where T.EmployeeNumber = @EmployeeNumber
    and T.DateOfTransaction = @DateOfTransaction
    and T.Amount = @Amount
END

begin transaction
select * , 'BEFORE' from ViewByDepartment where EmployeeNumber = 131 and TotalAmount=100.00
delete from ViewByDepartment
where EmployeeNumber = 131 and TotalAmount=100.00 
select * , 'AFTER' from ViewByDepartment where EmployeeNumber = 131 and TotalAmount=100.00
rollback transaction