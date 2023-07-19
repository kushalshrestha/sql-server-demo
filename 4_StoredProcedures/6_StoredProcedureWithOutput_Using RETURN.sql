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
            RETURN 0; -- SUCCESS
    END
    ELSE
        BEGIN 
            Set @NumberOfRows=0; -- defining explicitly. Else, we will get numberofrows = NULL
            Return 1; -- FAILURE
        END
END
GO


Declare @ROUTPUT as int, @ReturnStatus as int;
EXECUTE @ReturnStatus = NameEmployees 123, 125,@ROUTPUT OUTPUT; -- must add variable name in front of procedure when using RETURN
select @ROUTPUT as MyRowCOunt, @ReturnStatus as Return_Status; -- OUTPUT 3
GO

Declare @ROUTPUT as int, @ReturnStatus as int;
EXECUTE @ReturnStatus = NameEmployees 99999, 999999,@ROUTPUT OUTPUT; -- must add variable name in front of procedure when using RETURN
select @ROUTPUT as MyRowCOunt, @ReturnStatus as Return_Status; -- OUTPUT 3
GO