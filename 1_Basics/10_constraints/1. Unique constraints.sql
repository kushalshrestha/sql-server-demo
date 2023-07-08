ALTER TABLE tblEmployee
ADD CONSTRAINT unqGovernmentID UNIQUE (EmployeeGovernmentID);

-- Key is created + Indexes is also created : unqGovernmentID (Unique, Non-clustered) index is created


-- Same amount at same time by a single employee is not possible)
ALTER TABLE tblTransaction
ADD CONSTRAINT unqTransaction UNIQUE(Amount, DateOfTransaction, EmployeeNumber);

select * from tblTransaction;

select GETDATE();

insert into tblTransaction
values (100, GETDATE(), 131);

select * from tblTransaction where EmployeeNumber=131;

-- TO DROP A CONSTRAINT
alter table tblTransaction
drop CONSTRAINT unqTransaction;


--- CREATING TABLE + CONSTRAINT AT THE SAME TIME

create table tblTransaction2
(
    Amount smallmoney not null,
    DateofTransaction smalldatetime not null,
    EmployeeNumber int not null,
    CONSTRAINT unqTransaction2 UNIQUE (Amount, DateofTransaction, EmployeeNumber),
)

------------ DEFAULT CONSTRAINT ----------
Alter table tblTransaction
add DateOfEntry datetime

Alter table tblTransaction
Add constraint defDateOfEntry DEFAULT GETDATE() for DateOfEntry;

insert into tblTransaction (Amount, DateOfTransaction, EmployeeNumber)
values (100, GETDATE(), 131);

select * from tblTransaction where EmployeeNumber=131;