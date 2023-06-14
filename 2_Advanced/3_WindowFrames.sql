select salesOrderId,LineTotal, sum(LineTotal) over (order by LineTotal asc) as Total
from Sales.SalesOrderDetail s
where SalesOrderID in (51721, 51722, 43659, 50814, 50825, 46429, 45377);

-- same output : b/c range between <starting> and <ending>
-- unbounded preceding -> considers all rows that preceds the current row
-- current row -> current row considered
-- A. USE OF RANGE
select salesOrderId,LineTotal
    , sum(LineTotal) 
        over (order by LineTotal asc RANGE BETWEEN unbounded preceding and current row) as Total
from Sales.SalesOrderDetail s
where SalesOrderID in (51721, 51722, 43659, 50814, 50825, 46429, 45377);


-- WHAT IF NO ORDER BY? -> The total will be same for all records
select salesOrderId,LineTotal, sum(LineTotal) over () as Total
from Sales.SalesOrderDetail s
where SalesOrderID in (51721, 51722, 43659, 50814, 50825, 46429, 45377);
-- equivalent to : Note: order by <any column>
select salesOrderId,LineTotal
    , sum(LineTotal) over 
            (order by LineTotal asc RANGE BETWEEN unbounded preceding and unbounded following) as Total
from Sales.SalesOrderDetail s
where SalesOrderID in (51721, 51722, 43659, 50814, 50825, 46429, 45377);

-- B. USING ROWS
-- MISCELLENOUS EXERCISE: sums up current row + previous 1 row + next 1 row
select salesOrderId,LineTotal
    , sum(LineTotal) over 
            (order by LineTotal asc ROWS BETWEEN 1 preceding and 1 following) as Total
from Sales.SalesOrderDetail s
where SalesOrderID in (51721, 51722, 43659, 50814, 50825, 46429, 45377);