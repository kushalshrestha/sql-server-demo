--- NOW CREATE A STORED PROCEDURE TO CALCULATE AVG AMOUNT for EmployeeNumber between 3 & 11
IF OBJECT_ID('AverageBalance', 'P') IS NOT NULL
    DROP PROCEDURE AverageBalance
GO

CREATE PROCEDURE AverageBalance(@EmployeeNumberFrom int,
    @EmployeeNumberTo int,
    @AverageBalance int OUTPUT)
AS
BEGIN
    SET NOCOUNT ON
    DECLARE @TotalAmount money;
    DECLARE @NumOfEmployee int;
    BEGIN TRY
        SELECT @TotalAmount = sum(Amount)
    FROM tblTransaction
    WHERE EmployeeNumber BETWEEN 3 AND 11
    SELECT @NumOfEmployee = count(DISTINCT EmployeeNumber)
    FROM tblTransaction
    WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo
        SET @AverageBalance = @TotalAmount/@NumOfEmployee
        -- we could do in this way but let's use try/catch
        -- IF @NumOfEmployee = 0
        --     SET @AverageBalance = 0;
        -- ELSE
        --     SET @AverageBalance = @TotalAmount/@NumOfEmployee
        RETURN 0
    END TRY
    BEGIN CATCH
        SET @AverageBalance = NULL
        SELECT ERROR_MESSAGE() AS ErrorMessage, ERROR_LINE() AS ErrorLine,
        ERROR_NUMBER() AS ErrorNumber, ERROR_PROCEDURE() AS ErrorProcedure,
        -- ERROR_SEVERITY() AS ErrorSeverity  -- not working in Microsoft SQL Edge
        -- Error Severity Numbers : 
        -- 0-10 - INFO, 
        -- 16 - DEFAULT SQL Server Log/Windows Application log, 
        -- 20-25 -  (Very Bad) stops, rollback, closes database connection
        ERROR_STATE() AS ErrorState
        RETURN 1
    END CATCH
END
GO

DECLARE @AvgBalance AS int, @ReturnStatus AS int;
EXECUTE @ReturnStatus = AverageBalance 3, 11,@AvgBalance OUTPUT;
-- must add variable name in front of procedure when using RETURN
SELECT @AvgBalance AS MyRowCOunt, @ReturnStatus AS Return_Status; -- OUTPUT 3
GO

DECLARE @AvgBalance AS int, @ReturnStatus AS int;
EXECUTE @ReturnStatus = AverageBalance 39999, 199999,@AvgBalance OUTPUT;
-- must add variable name in front of procedure when using RETURN
SELECT @AvgBalance AS MyRowCOunt, @ReturnStatus AS Return_Status; -- OUTPUT 3
GO
