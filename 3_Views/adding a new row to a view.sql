-- IF you add a row into a view -> and it affects only one base table, it is allowed
begin transaction
select count(*) from ViewByDepartment where EmployeeNumber = 131;
-- inserting into view
insert into ViewByDepartment(EmployeeNumber, DateofTransaction, TotalAmount)
values (131, '2015-07-07' , 999.99)
select count(*) from ViewByDepartment where EmployeeNumber = 131;
rollback TRANSACTION

-- IF you add a row into a view -> and it affects only multiple base tables, it is not allowed
-- You'll get error: View or function 'ViewByDepartment' is not updatable because the modification affects multiple base tables.
begin transaction
select count(*) from ViewByDepartment where EmployeeNumber = 131;
-- inserting into view
insert into ViewByDepartment(Department,EmployeeNumber, DateofTransaction, TotalAmount)
values ('New Department', 131, '2015-07-07' , 999.99)
select count(*) from ViewByDepartment where EmployeeNumber = 131;
rollback TRANSACTION

------- WHAT IF YOU try to update a row in a view that won't be a part of the view later after modification-------
-- Eg: A view has where condition: WHERE T.EmployeeNumber between 120 and 139 and try to update the EmployeeNumber to 132 (132 is not part of the view)
-- You're allowed unless you add WITH CHECK OPTION
BEGIN TRANSACTION
IF EXISTS(SELECT *
FROM INFORMATION_SCHEMA.VIEWS
WHERE table_name = 'ViewByDepartment'
    AND table_schema ='dbo' 
        )
        DROP VIEW dbo.ViewByDepartment
GO
CREATE VIEW [dbo].[ViewByDepartment]
AS

    SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotalAmount
    FROM tblDepartment AS D
        LEFT JOIN tblEmployee AS E
        ON D.Department = E.Department
        LEFT JOIN tblTransaction AS T
        ON E.EmployeeNumber = T.EmployeeNumber
    WHERE T.EmployeeNumber BETWEEN 120 AND 139

GO


select employeenumber, count(*) from ViewByDepartment where employeenumber in( 131, 132) group by employeenumber;

select employeenumber, count(*) from tbltransaction where employeeNumber in (131, 132) group by employeenumber;

UPDATE ViewByDepartment
set EmployeeNumber = 132
where EmployeeNumber = 131;

select * from ViewByDepartment where employeenumber in( 131, 132);
select employeenumber, count(*) from ViewByDepartment where employeenumber in( 131, 132) group by employeenumber;
select employeenumber, count(*) from tbltransaction where employeeNumber in (131, 132) group by employeenumber;

ROLLBACK TRANSACTION

--------------------------------------
--- AFTER ADDING WITH CHECK OPTION
--------------------------------------
BEGIN TRANSACTION
IF EXISTS(SELECT *
FROM INFORMATION_SCHEMA.VIEWS
WHERE table_name = 'ViewByDepartment'
    AND table_schema ='dbo' 
        )
        DROP VIEW dbo.ViewByDepartment
GO
CREATE VIEW [dbo].[ViewByDepartment]
AS

    SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotalAmount
    FROM tblDepartment AS D
        LEFT JOIN tblEmployee AS E
        ON D.Department = E.Department
        LEFT JOIN tblTransaction AS T
        ON E.EmployeeNumber = T.EmployeeNumber
    WHERE T.EmployeeNumber BETWEEN 120 AND 139
    WITH CHECK OPTION ----> ADDED HERE!!!!!

GO


select employeenumber, count(*) from ViewByDepartment where employeenumber in( 131, 132) group by employeenumber;

select employeenumber, count(*) from tbltransaction where employeeNumber in (131, 132) group by employeenumber;

UPDATE ViewByDepartment
set EmployeeNumber = 132
where EmployeeNumber = 131;

select * from ViewByDepartment where employeenumber in( 131, 132);
select employeenumber, count(*) from ViewByDepartment where employeenumber in( 131, 132) group by employeenumber;
select employeenumber, count(*) from tbltransaction where employeeNumber in (131, 132) group by employeenumber;

ROLLBACK TRANSACTION


