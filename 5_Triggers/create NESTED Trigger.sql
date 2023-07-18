ALTER TRIGGER tr_tblTransaction
ON tblTransaction
AFTER DELETE, INSERT, UPDATE
AS
BEGIN
    SELECT @@NESTLEVEL AS Nest_Level
    if @@NESTLEVEL = 1
    begin
        SELECT *, 'INSERTED | Nested Level : 1'
        FROM Inserted
        SELECT *, 'DELETED | Nested Level : 1'
        FROM Deleted
    end
    if @@NESTLEVEL = 2
    begin
        SELECT *, 'INSERTED | Nested Level : 2'
        FROM Inserted
        SELECT *, 'DELETED | Nested Level : 2'
        FROM Deleted
    end
END
GO


-- NEST LEVEL: 1
BEGIN TRANSACTION
INSERT INTO tblTransaction
    (Amount, DateOfTransaction, EmployeeNumber)
VALUES
    (999, '2023-07-18', 132)
ROLLBACK TRANSACTION

-- NEST LEVEL 2
begin transaction
select * from ViewByDepartment where EmployeeNumber=131 and TotalAmount=100;
delete from ViewByDepartment  -- ViewByDepartment -> tblTransaction
where EmployeeNumber=131 and TotalAmount=100;
select * from ViewByDepartment where EmployeeNumber=131 and TotalAmount=100;
ROLLBACK transaction