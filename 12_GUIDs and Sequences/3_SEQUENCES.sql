BEGIN TRANSACTION
CREATE SEQUENCE newSeq AS BIGINT
start WITH 1
increment BY 1
minvalue 1
maxvalue 999999 
cycle    -- cycle/nocycle -> reuse 
cache 50
-- cache set of 50 values

-- simpler way
CREATE SEQUENCE secondSeq AS int


-- check sequences created
SELECT *
FROM sys.sequences

------

--USING SEQUENCES 
-- 1st method
SELECT NEXT VALUE FOR newSeq AS NextValue
-- 2nd method
select *, NEXT VALUE FOR newSeq over (order by DateOfTransaction) as NextNumber
from tblTransaction

-- USING Sequences in Table Schema
Alter table tblTransaction
Add NextNumber int
Alter table tblTransaction
add CONSTRAINT DF_Transaction DEFAULT NEXT VALUE FOR newSeq for NextNumber

ROLLBACK TRANSACTION

