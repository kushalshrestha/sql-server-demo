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
    DECLARE @TotalAmount decimal(5,2); -- use money. Here, for Throw example, we're using decimal
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
        IF ERROR_NUMBER() = 8134  -- @@Error - Don't use it b/c it holds only the last error
            BEGIN
                set @AverageBalance=0;
                RETURN 8134
            END
        ELSE 
            declare @ErrorMessage as varchar(255)
            select @ErrorMessage = ERROR_MESSAGE()
            PRINT 'WE reached here and employeeNumberFrom : ' + cast(@EmployeeNumberFrom as varchar(10)); -- THIS is just for debug purpose
            
            -- 1st WAY: THROW  56789, 'Unknown Error', 1
            THROW  56789, @ErrorMessage, 1
            
            -- ALTERNATE WAY INSTEAD OF THROW: using RAISERROR
            -- RAISERROR (@ErrorMessage, 16, 1) -- errormessage, severity, state
            -- select 'This code gets executed when RAISERROR is used. b/c it allows works to proceed but THROW does not'
        
    END CATCH
END
GO

-- Arithmetic overflow issue. But we're returning custom error
DECLARE @AvgBalance AS int, @ReturnStatus AS int;
EXECUTE @ReturnStatus = AverageBalance 3, 11,@AvgBalance OUTPUT;
SELECT @AvgBalance AS AverageBalance, @ReturnStatus AS Return_Status; -- OUTPUT 3
GO

DECLARE @AvgBalance AS int, @ReturnStatus AS int;
EXECUTE @ReturnStatus = AverageBalance 39999, 199999,@AvgBalance OUTPUT;
SELECT @AvgBalance AS AverageBalance, @ReturnStatus AS Return_Status; -- OUTPUT 3
GO

-- THROW EXAMPLE. 
DECLARE @AvgBalance AS int, @ReturnStatus AS int;
EXECUTE @ReturnStatus = AverageBalance 1, 199999,@AvgBalance OUTPUT;
SELECT @AvgBalance AS AverageBalance, @ReturnStatus AS Return_Status; -- OUTPUT 3
GO
