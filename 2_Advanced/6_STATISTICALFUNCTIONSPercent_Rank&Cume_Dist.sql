-- RANKING_FUNCTION & STATISTICAL FUNCTION requires (order by ) clause

-- CUME_DIST() : less than or equal to the value/total number of records
-- PERCENT_RANK() :    (number of records less than current value)/(total records - 1)

select SalesOrderID, ProductID, OrderQty, UnitPrice, LineTotal
    , CUME_DIST() Over (Order by LineTotal ) [CUME_DIST]
    , PERCENT_RANK() Over (Order by LineTotal) [Percent Rank]
from Sales.SalesOrderDetail
where SalesOrderID=43659;