IF EXISTS(SELECT *
FROM sys.procedures
WHERE name='NameEmployees')
    DROP PROCEDURE NameEmployees
GO
CREATE PROCEDURE NameEmployees(@EmployeeNumberFrom int, @EmployeeNumberTo int, @NumberOfRows int OUTPUT)
AS
BEGIN
    IF EXISTS(SELECT *
    FROM tblEmployee
    WHERE EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo)
    BEGIN
            SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
            FROM tblEmployee
            WHERE EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo;
            SET @NumberOfRows = @@ROWCOUNT
        
    END
    ELSE
        BEGIN 
            Set @NumberOfRows=0; -- defining explicitly. Else, we will get numberofrows = NULL
        END
END
GO

-- must declare this scalar variable
Declare @ROUTPUT as int;
EXECUTE NameEmployees 123, 125,@ROUTPUT OUTPUT;
select @ROUTPUT as MyRowCOunt; -- OUTPUT 3