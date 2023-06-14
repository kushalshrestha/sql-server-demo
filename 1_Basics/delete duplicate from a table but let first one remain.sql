-- Delete duplicate from a table but let the first one remain

select * 
from dbo.testTable t1, dbo.testTable t2
where t1.name=t2.name;

select * 
from dbo.testTable t1, dbo.testTable t2
where t1.name=t2.name
and t1.id > t2.id; 


delete t1
from dbo.testTable t1, dbo.testtable t2
where t1.name = t2.name
and t1.id > t2.id;

select * from dbo.TestTable;