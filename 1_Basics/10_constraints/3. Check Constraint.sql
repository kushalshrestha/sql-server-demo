-- ADDING CHECK CONSTRAINT. BUT IF THERE'S ALREADY A CONDITION that don't satisfy, you won't be able to create it
ALTER TABLE tblTransaction
ADD CONSTRAINT chkAmount CHECK (Amount > 0 AND Amount < 10);
-- Error: The ALTER TABLE statement conflicted with the CHECK constraint "chkAmount".

-- SO, inorder to bypass the condition, we use 'WITH NOCHECK' -> i.e doesn't check the existing row
ALTER TABLE tblTransaction 
WITH NOCHECK
ADD CONSTRAINT chkAmount CHECK (Amount > 0 AND Amount < 10);

-- Let's make it practical
ALTER TABLE tblTransaction
ADD CONSTRAINT chkAmount CHECK (Amount > -1000 AND Amount < 1000);

ALTER TABLE tblTransaction
DROP CONSTRAINT chkAmount;

INSERT INTO tblTransaction
    (Amount, DateofTransaction, EmployeeNumber)
VALUES
    (-100000, '2014-01-01', 1);
-- Error: The INSERT statement conflicted with the CHECK constraint "chkAmount".

-- NOW adding a valid row
INSERT INTO tblTransaction
    (Amount, DateofTransaction, EmployeeNumber)
VALUES
    (100, '2014-01-01', 1);


--- 
ALTER TABLE tblEmployee WITH NOCHECK
ADD CONSTRAINT chkDateOfBirth CHECK (DateOfBirth BETWEEN '1900-01-01' AND getdate());

-- CREATE + UNIQUE CONSTRAINT + CHECK CONSTRAINT

CREATE TABLE tblTransaction4
(
Amount smallmoney NOT NULL CONSTRAINT defAmount4 DEFAULT 0.0,
DateofTransaction smalldatetime NOT NULL,
EmployeeNumber int NOT NULL,
DateOfEntry datetime NULL CONSTRAINT defEntry4 DEFAULT GETDATE()

CONSTRAINT unqTransaction4 UNIQUE(Amount, DateofTransaction, EmployeeNumber),
CONSTRAINT chkDateOfTransaction4 CHECK(DateofTransaction BETWEEN '1900-01-01' AND getdate())
);