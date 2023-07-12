SELECT *
FROM sys.syscomments;

SELECT *
FROM sys.views;

------------ WAYS OF RETRIEVING A VIEW i.e it's insecured -------------------
-- 1. Method 1: JOINING BOTH sys.syscomments and sys.views
SELECT V.name, S.text
FROM sys.syscomments AS S
    INNER JOIN sys.views AS V
    ON S.id = V.object_id
WHERE V.name LIKE '%ViewByDepartment%'

-- ANOTHER WAY
-- METHOD 2
SELECT OBJECT_DEFINITION(OBJECT_ID('dbo.ViewByDepartment'));
-- METHOD 3
SELECT *
FROM sys.sql_modules;

---------------------END OF RETRIEVING VIEWS IN DIFFERENT WAY -------

-- HOW TO SECURE THE VIEW ? -> add WITH ENCRYPTION -> EVEN you won't be able to get the view when you execute the above queries. You'll get NULL.
IF EXISTS(SELECT *
FROM INFORMATION_SCHEMA.VIEWS
WHERE table_name = 'ViewByDepartment'
    AND table_schema ='dbo' 
        )
        DROP VIEW dbo.ViewByDepartment
GO
CREATE VIEW [dbo].[ViewByDepartment] WITH ENCRYPTION
AS

    SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotalAmount
    FROM tblDepartment AS D
        LEFT JOIN tblEmployee AS E
        ON D.Department = E.Department
        LEFT JOIN tblTransaction AS T
        ON E.EmployeeNumber = T.EmployeeNumber
    WHERE T.EmployeeNumber BETWEEN 120 AND 139

GO