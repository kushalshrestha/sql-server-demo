-- create a scalar function so that amount = amount + 1
CREATE FUNCTION AmountPlusOne (@Amount smallmoney) RETURNS smallmoney
AS
BEGIN
    RETURN @Amount + 1
END
GO



SELECT DateOfTransaction, EmployeeNumber, Amount,  dbo.AmountPlusOne(Amount) as AmountAndOne
FROM tblTransaction

DECLARE @myValue SMALLMONEY
EXEC @myValue = dbo.AmountPlusOne 345.67
EXEC @myValue = dbo.AmountPlusOne @Amount = 345.67
select @myValue;