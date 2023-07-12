CREATE TRIGGER tr_tblDepartment
ON [dbo].[tblDepartment]
AFTER DELETE, INSERT, UPDATE
AS
BEGIN
    select * from Inserted
    select * from Deleted
END

BEGIN TRANSACTION
insert into tblTransaction(Amount, DateOfTransaction, EmployeeNumber)
Values (123, '2015-07-10', 123)
ROLLBACK TRANSACTION
GO

select * from tblTransaction where EmployeeNumber=123;