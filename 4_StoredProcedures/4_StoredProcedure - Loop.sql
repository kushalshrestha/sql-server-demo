IF EXISTS(SELECT *
FROM sys.procedures
WHERE name='NameEmployees')
    DROP PROCEDURE NameEmployees
GO
IF object_id('NameEmployees', 'P') IS NOT NULL
    DROP PROCEDURE NameEmployees
GO

CREATE PROCEDURE NameEmployees(@EmployeeNumberFrom int, @EmployeeNumberTo int)
AS
BEGIN
    IF EXISTS(SELECT *
    FROM tblEmployee
    WHERE EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo)
    BEGIN
        Declare @EmployeeNumber as int = @EmployeeNumberFrom
        WHILE @EmployeeNumber <= @EmployeeNumberTo
        BEGIN
            
            SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
            FROM tblEmployee
            WHERE EmployeeNumber = @EmployeeNumber;

            SET @EmployeeNumber = @EmployeeNumber + 1;
            select @EmployeeNumber % 2;

        END
        
    END
END
GO


EXECUTE NameEmployees @EmployeeNumberFrom = 123, @EmployeeNumberTo=130;