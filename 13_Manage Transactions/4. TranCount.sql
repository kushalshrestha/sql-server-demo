
SELECT @@TRANCOUNT ,'0'
BEGIN TRAN OuterTransaction
    SELECT @@TRANCOUNT,'1'
    BEGIN TRAN InnerTransaction
        UPDATE dbo.tblEmployee SET EmployeeNumber = 123 WHERE EmployeeNumber = 123
        SELECT @@TRANCOUNT,'2'
    COMMIT TRAN InnerTransaction
    SELECT @@TRANCOUNT,'1'
IF @@TRANCOUNT > 0
    select 'greater than 0 tran'
COMMIT TRAN OuterTransaction
SELECT @@TRANCOUNT ,'0'
--------- HERE'S THE PERFECT EXAMPLE
BEGIN TRY
    select @@TRANCOUNT; -- 0
    BEGIN TRANSACTION;

    -- Operation 1: Insert a new employee
    UPDATE dbo.tblEmployee SET EmployeeNumber = 123 WHERE EmployeeNumber = 123;
    select @@TRANCOUNT; -- 1
    -- Operation 2: Update the salary of an existing employee
    UPDATE dbo.tblEmployee SET EmployeeNumber = 122 WHERE EmployeeNumber = 123;
    
    select @@TRANCOUNT; -- 1
    -- If all operations succeed, commit the transaction
    COMMIT TRANSACTION;
    select @@TRANCOUNT; -- 0
    PRINT 'Transaction completed successfully!!!!';
    select @@TRANCOUNT; -- 0
END TRY
BEGIN CATCH
    -- If any operation fails, rollback the transaction
    IF @@TRANCOUNT > 0
        ROLLBACK;
    PRINT 'Transaction failed and rolled back.';
END CATCH;
