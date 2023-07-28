/* WITH MARK is optional */
BEGIN TRANSACTION MyTransaction WITH MARK 'Name: My First Transaction'

SELECT *
FROM dbo.tblEmployee

UPDATE dbo.tblEmployee SET EmployeeNumber = 122
WHERE EmployeeNumber = 123

ROLLBACK TRANSACTION MyTransaction