IF EXISTS(SELECT *
FROM sys.procedures
WHERE name='NameEmployees')
    DROP PROCEDURE NameEmployees
GO
IF object_id('NameEmployees', 'P') IS NOT NULL
    DROP PROCEDURE NameEmployees
GO

CREATE PROCEDURE NameEmployees(@EmployeeNumberFrom int,
    @EmployeeNumberTo int)
AS
BEGIN
    IF EXISTS(SELECT *
    FROM tblEmployee
    WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo)
    BEGIN
        DECLARE @EmployeeNumber AS int = @EmployeeNumberFrom
        WHILE @EmployeeNumber <= @EmployeeNumberTo
        BEGIN
            SELECT @EmployeeNumber % 2;
            IF (@EmployeeNumber%2 = 0)
            BEGIN
                SET @EmployeeNumber = @EmployeeNumber + 1;
                CONTINUE;
            END

            SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
            FROM tblEmployee
            WHERE EmployeeNumber = @EmployeeNumber;

            SET @EmployeeNumber = @EmployeeNumber + 1;

        END

    END
END
GO


EXECUTE NameEmployees @EmployeeNumberFrom = 123, @EmployeeNumberTo=130;