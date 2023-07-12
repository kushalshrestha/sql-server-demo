
IF EXISTS(SELECT *
FROM INFORMATION_SCHEMA.VIEWS
WHERE table_name = 'ViewByDepartment'
    AND table_schema ='dbo' 
        )
        DROP VIEW dbo.ViewByDepartment
GO
CREATE VIEW [dbo].[ViewByDepartment] with SCHEMABINDING
AS

    SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotalAmount
    FROM dbo.tblDepartment AS D
        inner JOIN dbo.tblEmployee AS E
        ON D.Department = E.Department
        inner JOIN dbo.tblTransaction AS T
        ON E.EmployeeNumber = T.EmployeeNumber
    WHERE T.EmployeeNumber BETWEEN 120 AND 139

GO

CREATE UNIQUE CLUSTERED INDEX inx_ViewByDepartment on dbo.ViewByDepartment(EmployeeNumber, Department, DateOfTransaction )
-- If you get such errors:
-- Cannot create index on view 'ViewByDepartment' because the view is not schema bound.
-- see you : 1. references table don't have mentioned schema like : dbo.
-- 2. cannot have left join
-- 3. You need to add 'WITH SCHEMABINDING'
-- combination of (EmployeeNumber, Department) is not repeated i.e unique
