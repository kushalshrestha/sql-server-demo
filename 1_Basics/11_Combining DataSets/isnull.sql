select * from tblEmployee where EmployeeMiddleName is null;


declare @myOption as varchar(10) = 'Option A'
-- isnull() takes only 2 arguments
select ISNULL(@myOption,'No Option') as SelectedOption

-- coalesce takes any number of arguments
declare @myOption1 as varchar(10) 
declare @myOption2 as varchar(10) 

select coalesce(@myOption1, @myOption2 ,'No Option') as SelectedOption


select isnull('ABC', 12313) -- OUTPUT: ABC

-- Coalesce looks at all the arguments and takes highest precedence
select coalesce('ABC', 12313) -- Conversion failed when converting the varchar value 'ABC' to data type int. i.e 


-----
select ISNULL(null, null) -- NULL
select coalesce(null, null) -- Error: At least one of the arguments to COALESCE must be an expression that is not the NULL constant