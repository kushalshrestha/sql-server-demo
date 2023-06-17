
-- ALTER VIEW [dbo].[vPerson]
CREATE VIEW [dbo].[vPerson] 
AS 
    
SELECT *
FROM Person.Person
 
GO

-- Selecting from a view
Select * from [dbo].[vPerson] ;

-- Dropping a view
DROP VIEW [dbo].[vPerson];