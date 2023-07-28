
-- Problem 1: Even if the transaction is rolled back, the IDENTITY won't be rolled back
begin transaction
insert into tblTransaction5 (Amount, DateofTransaction, EmployeeNumber)
VALUES (99,'2023-07-27', 135)

select * from tblTransaction5
ROLLBACK transaction

-- Problem 2: Same case for DELETE. If you delete all records, the IDENTITY keeps going. i.e won't reset
-- you need to truncate the table if you need to reset the IDENTITY



