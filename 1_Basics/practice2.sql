/** MATHEMATICAL FUNCTIONS **/
DECLARE @myvar AS numeric(7,2) = 9;
SELECT POWER(@myvar, 2), SQUARE(@myvar), POWER(@myvar, 0.5), SQRT(@myvar); 
GO

-- FLOOR, CEILING, ROUND
DECLARE @myvar as NUMERIC(7,2)  = 12.345; 
SELECT FLOOR(@myvar), CEILING(@myvar), ROUND(@myvar,1); -- 12, 13, 12.40
GO

DECLARE @myvar as NUMERIC(7,2)  = -3.7;
SELECT FLOOR(@myvar), CEILING(@myvar); -- -4, -3
GO

-- PI(), EXP(), ABS();
select PI() as mypi;
select EXP(1) as e;
select abs(456), abs(-456), sign(456), sign(-456); -- 456, 456, 1, -1

-- RAND()
select RAND(); -- generates random numbers