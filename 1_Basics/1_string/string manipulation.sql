select FirstName, LastName
from [AdventureWorks2012].[Person].[Person]
where FirstName like 'K%';

select FirstName, LastName
from [AdventureWorks2012].[Person].[Person]
where left(FirstName,1) = 'A';

select FirstName, LastName
from [AdventureWorks2012].[Person].Person
where SUBSTRING(FirstName,1,2)='Am';