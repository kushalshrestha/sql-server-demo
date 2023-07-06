USE AdventureWorks2012
------- CREATE TABLE ---------
CREATE TABLE tblEmployee
(
    EmployeeNumber INT NOT NULL,
    EmployeeFirstName VARCHAR(50) NOT NULL,
    EmployeeMiddleName VARCHAR(50) NULL,
    EmployeeLastName VARCHAR(50) NOT NULL,
    EmployeeGovernmentID  CHAR(10) NOT NULL,
    DateOfBirth DATE NOT NULL
)


----- ALTER TABLE -------
ALTER table [AdventureWorks2012].[dbo].[tblEmployee]
add Department varchar(50);

---- DROP COLUMN ----
alter table tblEmployee
drop column department;

select * from tblEmployee;

---  INSERT -----
insert into tblEmployee
values (132,'Kushal', 'Man', 'Shrestha', 'GID3243', '19910626', 'AIPOPS');

insert into tblEmployee
values (133,'Anil', 'Man', 'Shrestha', 'GID3243', '19940101', 'MED');