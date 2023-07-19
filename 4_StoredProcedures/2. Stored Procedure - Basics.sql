IF EXISTS(SELECT *
FROM sys.procedures
WHERE name='NameEmployees')
    DROP PROCEDURE NameEmployees
GO
IF object_id('NameEmployees', 'P') IS NOT NULL
    DROP PROCEDURE NameEmployees
GO

CREATE PROCEDURE NameEmployees(@EmployeeNumber int)
AS
BEGIN
    IF EXISTS(SELECT *
    FROM tblEmployee
    WHERE EmployeeNumber = @EmployeeNumber)
    BEGIN
        IF (@EmployeeNumber < 300)
        BEGIN
            SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
            FROM tblEmployee
            WHERE EmployeeNumber = @EmployeeNumber
        END
        ELSE
        BEGIN
            select @EmployeeNumber, EmployeeFirstName, employeeLastName, Department
            from tblEmployee
            where EmployeeNumber = @EmployeeNumber;

            select * from tblTransaction where EmployeeNumber = @EmployeeNumber;
        END
    END
END
GO

-- Ways of executing
NameEmployees 321
EXECUTE NameEmployees 123;
EXEC NameEmployees 123;