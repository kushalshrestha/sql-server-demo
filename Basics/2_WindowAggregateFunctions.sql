SELECT salesorderid, ProductID, OrderQty, UnitPrice

        FROM [AdventureWorks2012].[Sales].SalesOrderDetail
        WHERE SalesOrderID in (51721, 51722)
order by SalesOrderID asc, UnitPrice desc;

select SalesOrderID, count(*)
from Sales.SalesOrderDetail
where SalesOrderID in (51721, 51722)
group by SalesOrderID;

-- now this gives a entire different output
select SalesOrderID,ProductID,OrderQty, count(*)
from Sales.SalesOrderDetail
where SalesOrderID in (51721, 51722)
group by SalesOrderID, ProductID, OrderQty
order by SalesOrderID, ProductID, OrderQty;

-- so in terms or orderid only we want to see the count + all possible productid and order quantity
-- 2 ways: a. CTE with grouping of salesOrderId and then join cte with the original table
-- b. count(*) over (partition by salesOrderId)

with cteTable as (
    select SalesOrderID, count(*) as totalSalesOrderIds
from Sales.SalesOrderDetail
where SalesOrderID in (51721, 51722)
group by SalesOrderID 
)

select c.SalesOrderID , ProductID, OrderQty, UnitPrice, c.totalSalesOrderIds
from cteTable c
inner join Sales.SalesOrderDetail sod
on c.SalesOrderID = sod.SalesOrderID; --72, 31

-- b. Alternate way using count(*) over (partition by salesorderid)

select s.SalesOrderID, s.ProductID,  LineTotal
    , count(*) over (order by salesOrderId) as totalSalesOrderedBy -- see the difference
    , count(*) over (partition by salesorderid order by salesOrderId) as totalSalesBySalesOrderID -- see the difference
    , sum(LineTotal) over () as TotalLineTotal
    , avg(LineTotal) over () as AvgLineTotalPrice
    , min(LineTotal) over () as MinLineTotalPrice
    , max(LineTotal) over () as MaxLineTotalPrice
    , sum(LineTotal) over (partition by s.salesOrderId)/sum(LineTotal) over () as SalesOrderIDRevenueRatio
from Sales.SalesOrderDetail s
where SalesOrderID in (51721, 51722);

