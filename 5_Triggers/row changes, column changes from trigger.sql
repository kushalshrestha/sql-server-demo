ALTER TRIGGER tr_tblTransaction
ON tblTransaction
AFTER UPDATE
AS
BEGIN
    SELECT @@ROWCOUNT AS RowTotalCount
    -- IF @@ROWCOUNT > 0 -- if any row is affected. But what if any column is updated?
    -- IF UPDATE(DateOfTransaction) -- 1st Simple way (Best way) - Using UPDATE() function, explicitly saying
    IF COLUMNS_UPDATED() & 6 = 6 -- 2nd way (Problem if position changes). Each column in order will have number assigned like 1, 2, 4,8,16 respectively based on column position
    BEGIN
                SELECT *, 'INSERTED'
                FROM Inserted
                SELECT *, 'DELETED'
                FROM Deleted
    END

END
GO


begin transaction
update tblTransaction
set DateOfTransaction='2023-07-08 19:05:00'
where EmployeeNumber = 131
and DateOfEntry = '2023-07-08 19:03:02.363';
ROLLBACK transaction

begin transaction
update tblTransaction
-- set DateOfTransaction='2023-07-08 19:05:00'
set EmployeeNumber = 132
where EmployeeNumber = 131
and DateOfEntry = '2023-07-08 19:03:02.363';
ROLLBACK transaction


-- example for IF COLUMNS_UPDATED() & 6 = 6 i.e EmployeeNumber -> 2 + DateOfTransaction -> 4 = 2 + 4 = 6
begin transaction
update tblTransaction
set EmployeeNumber = 132, DateOfTransaction='2023-07-08 19:05:00'
where EmployeeNumber = 131
and DateOfEntry = '2023-07-08 19:03:02.363';
ROLLBACK transaction

select * from tblTransaction where EmployeeNumber=131;