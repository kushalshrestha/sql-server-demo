with base as (
    select year(ModifiedDate) as [Year], sum(LineTotal) as Revenue
    from Sales.SalesOrderDetail s
    where SalesOrderID in (51721, 51722, 43659, 50814, 50825, 46429, 45377)
    group by year(ModifiedDate)
)
select * , sum(Revenue) over (order by [Year] RANGE BETWEEN unbounded preceding and current row) as [Running Total]
from base;

--------
-- SEE THE EXAMPLE BELOW: RANGE GIVES WRONG RUNNING TOTAL
-- Reason: Same (Order by field i.e Modified Date) is treated as a single unit. 
select salesOrderId, SalesOrderDetailID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount, LineTotal
    , ModifiedDate
    , sum(LineTotal) over (order by ModifiedDate asc RANGE BETWEEN unbounded preceding and current row)as [Running Total]
    from Sales.SalesOrderDetail s
    where SalesOrderID in (51721, 51722, 43659, 50814, 50825, 46429, 45377)
order by ModifiedDate;

-- Note: In order to fix this there are two ways
-- a. Either change the order by 'ModifiedDate' to a different field so that each row is unique and does not be treated as a single unit
-- b. Use ROWS operator instead of RANGE 
select salesOrderId, SalesOrderDetailID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount, LineTotal
    , ModifiedDate
    , sum(LineTotal) over (order by ModifiedDate asc ROWS BETWEEN unbounded preceding and current row)as [Running Total]
    from Sales.SalesOrderDetail s
    where SalesOrderID in (51721, 51722, 43659, 50814, 50825, 46429, 45377)
order by ModifiedDate;


-- Variance Calculation
-- Expected revenue estimated based upon past 2 years

with base as (
    select year(ModifiedDate) as [Year], sum(LineTotal) as AnnualRevenue
    from Sales.SalesOrderDetail s
    group by year(ModifiedDate)
), expectedRevenue as (
    select *, avg(AnnualRevenue) over (Order by Year ROWS BETWEEN 2 preceding and 1 preceding) as ExpectedRevenue
    from base
)
select * 
    ,(AnnualRevenue - expectedRevenue)*100/expectedRevenue as [% Variance] 
    ,sum(AnnualRevenue) over (order by [Year] RANGE BETWEEN unbounded preceding and current row) as [Running Total]
from expectedRevenue;