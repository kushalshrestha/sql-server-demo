USE AdventureWorks2012
GO

ALTER VIEW [dbo].[ViewByDepartment]
AS

    SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotalAmount
    FROM tblDepartment AS D
        LEFT JOIN tblEmployee AS E
        ON D.Department = E.Department
        LEFT JOIN tblTransaction AS T
        ON E.EmployeeNumber = T.EmployeeNumber
    WHERE T.EmployeeNumber BETWEEN 120 AND 139

GO

--HOW TO ALTER? METHOD 1: (see method 2 for better approach)
IF EXISTS(SELECT *
FROM sys.views
WHERE name = 'ViewByDepartment')
    DROP VIEW dbo.ViewByDepartment
GO
--- AND CREATE A VIEW
--------------------------------

-- METHOD 2 to ALTER VIEW USING INFORMATION_SCHEMA.VIEWS <- points to the currently used Database
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
-- you could use : sys.views, sys.objects, information_schema.views, sys.tables <- for tables
----------------------- END OF METHOD 2 --------------
SELECT *
FROM INFORMATION_SCHEMA.VIEWS;


-- DROPPING A VIEW
DROP VIEW [dbo].ViewByDepartment;

SELECT *
FROM sys.views;