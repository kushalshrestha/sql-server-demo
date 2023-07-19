

BEGIN TRANSACTION
MERGE INTO tblTransaction as T  -- T-> Target Table
USING tblTransactionNew as S    -- S-> Source Table
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN
    update SET AMOUNT = T.AMOUNT + S.AMOUNT-- we don't need to refer the table. so use SET straight
WHEN NOT MATCHED BY TARGET THEN -- not matched in the target
    INSERT(Amount, DateOfTransaction, EmployeeNumber)
    VALUES(S.Amount, S.DateOfTransaction, S.EmployeeNumber); -- semicolon is mandatory
ROLLBACK TRANSACTION

---- We might get 2 errors like below although its syntatically correct
-- The MERGE statement attempted to UPDATE or DELETE the same row more than once. 
-- This happens when a target row matches more than one source row. 
-- A MERGE statement cannot UPDATE/DELETE the same row of the target table multiple times. 
-- Refine the ON clause to ensure a target row matches at most one source row, or use the GROUP BY clause to group the source rows.

-- REASON: 1 row in tblTransaction, matches with multiple rows in tblTransactionNew. Let's check
select Amount, DateOfTransaction, count(*)
from tblTransactionNew
group by Amount, DateOfTransaction
having count(*) > 1


-- SO THE SOLUTION IS: apply GROUP and sum the Amount + treat it as Source
BEGIN TRANSACTION
ALTER TABLE tblTransaction
ADD Comments varchar(50) null;
GO


MERGE INTO tblTransaction as T  -- T-> Target Table
USING (select EmployeeNumber, DateOfTransaction, sum(Amount) as Amount
        from tblTransactionNew
        group by EmployeeNumber, DateOfTransaction) as S    -- S-> Source Table
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN
    -- update SET AMOUNT = T.AMOUNT + S.AMOUNT-- we don't need to refer the table. so use SET straight
    update SET AMOUNT = T.AMOUNT, T.Comments='Updated Row' -- we have a check constraint and amount should be between ... to ... . So for now not adding on purpose.

WHEN NOT MATCHED BY TARGET THEN -- not matched in the target
    INSERT(Amount, DateOfTransaction, EmployeeNumber, Comments)
    VALUES(S.Amount, S.DateOfTransaction, S.EmployeeNumber, 'INSERTED')

WHEN NOT MATCHED BY SOURCE THEN -- not matched in the source
    UPDATE SET Comments = 'Unchanged';

select * from tblTransaction;   

-- OUTPUT inserted.*, deleted.*  ;-- MERGE statement must be terminated by semicolon
ROLLBACK TRANSACTION


-- to disable/enable trigger
-- IF you use OUTPUT in DML statement, you'll have error:
-- The target table 'T' of the DML statement cannot have any enabled triggers if the statement contains an OUTPUT clause 
-- without INTO clause.
DISABLE TRIGGER tr_tblTransaction ON [dbo].[tblTransaction];
ENABLE TRIGGER tr_tblTransaction ON [dbo].[tblTransaction];