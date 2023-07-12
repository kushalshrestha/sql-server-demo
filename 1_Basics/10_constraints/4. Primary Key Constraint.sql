ALTER table tblEmployee
add constraint PK_tblEmployee PRIMARY KEY(EmployeeNumber);

-- DROP Constraint
ALTER TABLE tblEmployee
DROP CONSTRAINT PK_tblEmployee

-- CREATE
CREATE TABLE tblTransaction5
(
Id int constraint PK_tblTransaction5 PRIMARY KEY IDENTITY(1,1),
Amount smallmoney NOT NULL CONSTRAINT defAmount5 DEFAULT 0.0,
DateofTransaction smalldatetime NOT NULL,
EmployeeNumber int NOT NULL,
DateOfEntry datetime NULL CONSTRAINT defEntry5 DEFAULT GETDATE()

CONSTRAINT unqTransaction5 UNIQUE(Amount, DateofTransaction, EmployeeNumber),
CONSTRAINT chkDateOfTransaction5 CHECK(DateofTransaction BETWEEN '1900-01-01' AND getdate())
);

-- You cannot insert explicitly the value of column having primary key
-- EG:
Insert into tblTransaction5 (Id, Amount, DateofTransaction, EmployeeNumber)
values (10, 100, '2022-10-23', 131)
-- Error Message: Cannot insert explicit value for identity column in table 'tblTransaction5' when IDENTITY_INSERT is set to OFF.
-- You need to do:
SET IDENTITY_INSERT tblTransaction5 ON;

select * from tblTransaction5;

-- reverting back
SET IDENTITY_INSERT tblTransaction5 OFF;


select @@IDENTITY -- returns the last identity used
select SCOPE_IDENTITY() -- depends upon the scope. If you are using in function, they'll have their own identity

select IDENT_CURRENT('dbo.tblTransaction5') -- to check last identity of particular table
