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
            SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
            FROM tblEmployee
            WHERE EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
        
    END
END
GO

-- Ways of executing
NameEmployees 123, 321
EXECUTE NameEmployees 123, 321;
EXEC NameEmployees 123 , 321;
-- OR
NameEmployees @EmployeeNumberFrom = 123, @EmployeeNumberTo=321;
EXECUTE NameEmployees @EmployeeNumberFrom = 123, @EmployeeNumberTo=321;
EXEC NameEmployees @EmployeeNumberFrom = 123, @EmployeeNumberTo=321;