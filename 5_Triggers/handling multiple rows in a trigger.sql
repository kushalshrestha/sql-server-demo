/* GO TO THE BOTTOM TRIGGER SCRIPT FOR SOLUTION*/

/* PROBLEM*/
DROP TRIGGER tr_ViewByDepartment
GO

CREATE TRIGGER tr_ViewByDepartment
ON [dbo].[ViewByDepartment]
INSTEAD OF DELETE
AS
BEGIN
    select *, 'TO BE DELETED' from deleted

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

    -- select * from deleted;
END

/* If you run this you'll see only last row being deleted. So, you're not handling for multiple rows*/
begin transaction
    select * , 'BEFORE DELETE' from ViewByDepartment where EmployeeNumber = 131 and TotalAmount=100.00

    delete from ViewByDepartment
    where EmployeeNumber = 131 and TotalAmount=100.00 
    
    select * , 'AFTER DELETE' from ViewByDepartment where EmployeeNumber = 131 and TotalAmount=100.00
rollback transaction


/* SO THE SOLUTION TO HANDLE MULTIPLE ROWS IS: */
DROP TRIGGER tr_ViewByDepartment
GO

CREATE TRIGGER tr_ViewByDepartment
ON [dbo].[ViewByDepartment]
INSTEAD OF DELETE
AS
BEGIN
    select *, 'TO BE DELETED' from deleted

    -- IMPORTANT: IT handles multiple rows in a trigger
    delete tblTransaction
    from tblTransaction as T
    inner join deleted as D
    on T.EmployeeNumber = D.EmployeeNumber
    and T.DateOfTransaction = D.DateOfTransaction
    and T.Amount = D.TotalAmount

   
END

/* NOW after trigger, no any records are seen in ViewByDepartment. This is how we handle multiple rows */
begin transaction
    select * , 'BEFORE DELETE' from ViewByDepartment where EmployeeNumber = 131 and TotalAmount=100.00

    delete from ViewByDepartment
    where EmployeeNumber = 131 and TotalAmount=100.00 
    
    select * , 'AFTER DELETE' from ViewByDepartment where EmployeeNumber = 131 and TotalAmount=100.00
rollback transaction