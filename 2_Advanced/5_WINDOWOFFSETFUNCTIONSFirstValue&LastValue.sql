select year(ModifiedDate) as Year, SalesOrderID, LineTotal
    , FIRST_VALUE(SalesOrderID) OVER (partition by year(ModifiedDate) ORDER by salesOrderId) as FirstSalesOrderID
    , LAST_VALUE(SalesOrderID) OVER (partition by year(ModifiedDate) ORDER by salesOrderId) as LastSalesOrderID
from Sales.SalesOrderDetail;
-- the above query only gives FirstSalesOrderId correct
-- LastSalesOrderID is incorrect. B/C Default frame is being used and for default the RANGE is : UNBOUNDED Precedence and Current Row

/* SO THE CORRECT WAY IS: Use your own frame range 
 + changing view to get firstsales and last sales of each year by adding distinct
*/

select distinct year(ModifiedDate) as Year
    , FIRST_VALUE(SalesOrderID) OVER (
        partition by year(ModifiedDate) ORDER by salesOrderId asc
        RANGE BETWEEN UNBOUNDED preceding and UNBOUNDED FOLLOWING
    ) as FirstSalesOrderID
    , LAST_VALUE(SalesOrderID) OVER (
        partition by year(ModifiedDate) ORDER by salesOrderId asc
        RANGE BETWEEN UNBOUNDED preceding and UNBOUNDED FOLLOWING
    ) as LastSalesOrderID
from Sales.SalesOrderDetail
order by year(ModifiedDate);


select distinct year(ModifiedDate) as Year
    , FIRST_VALUE(SalesOrderID) OVER (
        partition by year(ModifiedDate) ORDER by salesOrderId asc
        RANGE BETWEEN UNBOUNDED preceding and UNBOUNDED FOLLOWING
    ) as FirstSalesOrderID
    , LAST_VALUE(SalesOrderID) OVER (
        partition by year(ModifiedDate) ORDER by salesOrderId asc
        RANGE BETWEEN UNBOUNDED preceding and UNBOUNDED FOLLOWING
    ) as LastSalesOrderID
from Sales.SalesOrderDetail
order by year(ModifiedDate);

/* ADDITIONAL : To get the first sales order id and last sales order id for each product in each year */

select distinct year(ModifiedDate) as Year, productId
    , FIRST_VALUE(SalesOrderID) OVER (
        partition by year(ModifiedDate), productId ORDER by salesOrderId asc
        RANGE BETWEEN UNBOUNDED preceding and UNBOUNDED FOLLOWING
    ) as FirstSalesOrderID
    , LAST_VALUE(SalesOrderID) OVER (
        partition by year(ModifiedDate), productId ORDER by salesOrderId asc
        RANGE BETWEEN UNBOUNDED preceding and UNBOUNDED FOLLOWING
    ) as LastSalesOrderID
from Sales.SalesOrderDetail
order by productId,year(ModifiedDate);