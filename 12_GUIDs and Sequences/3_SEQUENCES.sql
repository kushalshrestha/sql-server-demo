BEGIN Transaction
create SEQUENCE newSeq as BIGINT
start with 1
increment by 1
minvalue 1
maxvalue 999999 
cycle    -- cycle/nocycle -> reuse 
cache 50  -- cache set of 50 values

-- simpler way
create sequence secondSeq as int


-- check sequences created
select * from sys.sequences
Rollback transaction