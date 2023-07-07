USE AdventureWorks2012
------- CREATE TABLE ---------
CREATE TABLE tblEmployee
(
    EmployeeNumber INT NOT NULL,
    EmployeeFirstName VARCHAR(50) NOT NULL,
    EmployeeMiddleName VARCHAR(50) NULL,
    EmployeeLastName VARCHAR(50) NOT NULL,
    EmployeeGovernmentID CHAR(10) NOT NULL,
    DateOfBirth DATE NOT NULL
)

----- ALTER TABLE -------
ALTER TABLE [AdventureWorks2012].[dbo].[tblEmployee]
ADD Department varchar(50);

---- DROP COLUMN ----
ALTER TABLE tblEmployee
DROP COLUMN department;

SELECT *
FROM tblEmployee;

---  INSERT -----
INSERT INTO tblEmployee
VALUES
    (132, 'Kushal', 'Man', 'Shrestha', 'GID3243', '19910626', 'AIPOPS');

INSERT INTO tblEmployee
VALUES
    (133, 'Anil', 'Man', 'Shrestha', 'GID3243', '19940101', 'MED'),
    (134, 'Saugat', 'Man', 'Ligal', 'GID3221', '19900101', 'MED'),
    (135, 'Shankar', NULL, 'Pandey', 'GID4243', '19910227', 'QA');
