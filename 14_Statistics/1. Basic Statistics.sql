
select *
from Sales.SalesOrderDetail
where SalesOrderID <= 43856; --1294.252900

-- Calculating Mean(Average)
select SalesOrderID, avg(LineTotal)
from Sales.SalesOrderDetail
where SalesOrderID <= 43856
group by SalesOrderID;

---- Calculating Median Line Total Value for Each SalesOrderID
SELECT SalesOrderID, SalesOrderDetailID
    , OrderQty, ProductID, UnitPrice, LineTotal
    , PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY LineTotal) over (partition by SalesOrderID) AS MedianLineTotalForContinuous
    , PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY LineTotal) over (partition by SalesOrderID) AS MedianLineTotalForDiscrete
FROM Sales.SalesOrderDetail
where SalesOrderID <= 43856;

-- Calculating Mode (counts the occurrences of highest ProductID ordered)
-- T-SQL doesn't have a built-in function to calculate the mode directly. 
-- You can use subqueries and the COUNT() function to find the mode.
SELECT TOP 1 ProductID AS ModeProductID
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY COUNT(*) DESC;



-- Calculating Standard Deviation
select *
from (
    values(20), (10), (30), (50), (60)
) testTable(number);

SELECT STDEV(number) AS StandardDeviationSalary
FROM (
    values(20), (10), (30), (50), (60)
) testTable(number);  
-- Standard Deviation: 20.74
-- Mean Value: 34 
-- In this specific example, a standard deviation of approximately 18.54 indicates moderate variability among the values.
