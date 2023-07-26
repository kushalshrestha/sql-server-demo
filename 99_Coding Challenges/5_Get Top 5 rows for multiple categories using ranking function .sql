-- Use the ranking function to select top(5) rows for multiple categories in a single query

select D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
    rank() over (partition by D.Department order by E.EmployeeNumber) as TheRank
from tblDepartment as D
    join tblEmployee as E
    on D.Department = E.Department
    where rank() over (partition by D.Department order by E.EmployeeNumber) <= 5
order by D.Department, EmployeeNumber;
-- Gives an error
--!!! Windowed functions can only appear in the SELECT or ORDER BY clauses

select *
from (
    select D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
        rank() over (partition by D.Department order by E.EmployeeNumber) as TheRank
    from tblDepartment as D
        join tblEmployee as E
        on D.Department = E.Department
    -- order by D.Department, EmployeeNumber -- The ORDER BY clause is invalid in views, inline functions, derived tables, subqueries, and common table expressions, unless TOP, OFFSET or FOR XML is also specified.
) tableA
where tableA.TheRank <= 5 
order by Department, EmployeeNumber;