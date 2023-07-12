
-- ALTER VIEW [dbo].[vPerson]
CREATE VIEW [dbo].[vPerson] 
AS 
    
SELECT *
FROM Person.Person
 
GO

-- Selecting from a view
Select * from [dbo].[vPerson] ;

-- Dropping a view
DROP VIEW [dbo].[vPerson];
-------------------------------------
-- The ORDER BY clause is invalid in views, inline functions, derived tables, subqueries, and 
-- common table expressions, unless TOP, OFFSET or FOR XML is also specified. 
-- generally, order by clause is not used in view

CREATE VIEW ViewByDepartment as

-- select top(100) percent D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount
select top(100) percent D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount
from tblDepartment as D
left join tblEmployee as E
on D.Department = E.Department
left join tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber between 120 and 139
 -- order by D.Department, T.EmployeeNumber
GO

-- Executing
select * from ViewByDepartment;

-- 