Alter Table tbltransaction 
ADD CONSTRAINT FK_tblTransaction_EmployeeNumber FOREIGN KEY (EmployeeNumber) REFERENCES tblEmployee(EmployeeNumber) ON UPDATE CASCADE;
-- Gives error

Alter Table tbltransaction WITH NOCHECK
ADD CONSTRAINT FK_tblTransaction_EmployeeNumber 
    FOREIGN KEY (EmployeeNumber) REFERENCES tblEmployee(EmployeeNumber) 
    ON UPDATE CASCADE
    ON DELETE NO ACTION ; 
    -- you could set : SET NULL 
    -- or you could set : SET DEFAULT

Alter Table tbltransaction WITH NOCHECK
ADD CONSTRAINT FK_tblTransaction_EmployeeNumber FOREIGN KEY (EmployeeNumber) REFERENCES tblEmployee(EmployeeNumber) ON UPDATE SET NULL;

Alter Table tbltransaction WITH NOCHECK
ADD CONSTRAINT FK_tblTransaction_EmployeeNumber FOREIGN KEY (EmployeeNumber) REFERENCES tblEmployee(EmployeeNumber) ON UPDATE SET DEFAULT;
-- but you need to have default constraint before applying the above query

select *
from tblEmployee te
right join tblTransaction tt
on te.EmployeeNumber = tt.EmployeeNumber
where tt.EmployeeNumber is null