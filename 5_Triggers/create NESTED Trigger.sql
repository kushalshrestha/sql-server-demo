ALTER TRIGGER tr_tblTransaction
ON tblTransaction
AFTER DELETE, INSERT, UPDATE
AS
BEGIN
    SELECT @@NESTLEVEL AS Nest_Level, @@ROWCOUNT AS RowTotalCount
    IF @@ROWCOUNT > 0 -- if any row is affected. But what if any column is updated?

    BEGIN
            IF @@NESTLEVEL = 1
            BEGIN
                SELECT *, 'INSERTED | Nested Level : 1'
                FROM Inserted
                SELECT *, 'DELETED | Nested Level : 1'
                FROM Deleted
            END
            IF @@NESTLEVEL = 2
            BEGIN
                SELECT *, 'INSERTED | Nested Level : 2'
                FROM Inserted
                SELECT *, 'DELETED | Nested Level : 2'
                FROM Deleted
            END
    END

END
GO


--- NESTED WITH ROW COUNT -> won't trigger if row count is 0
BEGIN TRANSACTION

DELETE FROM ViewByDepartment  -- ViewByDepartment -> tblTransaction
WHERE EmployeeNumber=13100 AND TotalAmount=100;
SELECT *
FROM ViewByDepartment
WHERE EmployeeNumber=131 AND TotalAmount=100;
ROLLBACK TRANSACTION

