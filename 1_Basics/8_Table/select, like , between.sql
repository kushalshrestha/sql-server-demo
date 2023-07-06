--- LIKE OPERATOR ---
SELECT *
FROM tblEmployee
WHERE EmployeeFirstName LIKE 'k%';
-- LIKE is case insensitive. 
-- To see: right click column for properties and see Collation : SQL_Latin1_General_CP1_CI_AS -> CI refers to case insensitive

SELECT *
FROM tblEmployee
WHERE [EmployeeFirstName] LIKE '[A-K]%';
-- any employee with firstname starts with A,B,C...,K

SELECT *
FROM tblEmployee
WHERE [EmployeeFirstName] LIKE '[^ak]%';
-- any employee first name not starting with a, k

SELECT *
FROM tblEmployee
WHERE [EmployeeFirstName] LIKE '[%]%';
-- must start with '%' and then second % says any

SELECT *
FROM tblEmployee
WHERE EmployeeNumber < 133;
-- now opposite of above query
-- using not
SELECT *
FROM tblEmployee
WHERE NOT EmployeeNumber < 133;
-- OR
SELECT *
FROM tblEmployee
WHERE EmployeeNumber > 132;

----- BETWEEN -----
SELECT *
FROM tblEmployee
WHERE EmployeeNumber BETWEEN 132 AND 133; -- 132 and 133 both is included

-- NOT BETWEEN --
SELECT *
FROM tblEmployee
WHERE EmployeeNumber NOT BETWEEN 132 AND 133; -- 132 and 133 both is included