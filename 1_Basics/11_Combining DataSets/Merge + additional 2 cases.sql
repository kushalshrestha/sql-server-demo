BEGIN TRANSACTION
ALTER TABLE tblTransaction
ADD Comments varchar(50) null;
GO

MERGE INTO tblTransaction as T  -- T-> Target Table
USING (select EmployeeNumber, DateOfTransaction, sum(Amount) as Amount
        from tblTransactionNew
        group by EmployeeNumber, DateOfTransaction) as S    -- S-> Source Table
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction


WHEN MATCHED AND T.AMOUNT + S.AMOUNT > -1000 AND T.AMOUNT + S.AMOUNT < 1000 THEN
    update SET T.AMOUNT = T.AMOUNT + S.AMOUNT, T.Comments='Updated Row' -- we don't need to refer the table. so use SET straight

WHEN MATCHED THEN -- T.AMOUNT + S.AMOUNT > 1000
    DELETE -- just delete

WHEN NOT MATCHED BY TARGET THEN -- not matched in the target
    INSERT(Amount, DateOfTransaction, EmployeeNumber, Comments)
    VALUES(S.Amount, S.DateOfTransaction, S.EmployeeNumber, 'INSERTED')

WHEN NOT MATCHED BY SOURCE THEN -- not matched in the source
    UPDATE SET Comments = 'Unchanged'
OUTPUT inserted.*, deleted.* , $action;-- MERGE statement must be terminated by semicolon
ROLLBACK TRANSACTION
