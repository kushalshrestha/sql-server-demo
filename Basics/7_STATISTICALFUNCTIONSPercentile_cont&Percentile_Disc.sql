-- Percentile_cont & Percentile_disc are inverse distribution functions
-- i.e They return a percentile (value) from the set or a calculated value based on the rank we supply as a parameter
-- Percentile_disc : 
    -- based on DISCRETE DISTRIBUTION MODEL
    -- inverse of cume_dist (cumulative distribution)
-- Percentile_cont : based on CONTINUOUS DISTRIBUTION MODEL
    -- 


select SalesOrderID, ProductID, OrderQty, UnitPrice, LineTotal
    , CUME_DIST() Over (Order by LineTotal ) [CUME_DIST]
    , PERCENT_RANK() Over (Order by LineTotal) [Percent Rank]

    , PERCENTILE_DISC(0.5) within GROUP (order by LineTotal) over (partition by ProductID) as [Percentile_disc]
    , PERCENTILE_CONT(0.5) within GROUP (order by LineTotal) over (partition by ProductID) as [Percentile_cont]

    , PERCENTILE_CONT(0.25) within GROUP (order by LineTotal) over (partition by ProductID) as [25th Percentile]
    , PERCENTILE_CONT(0.5) within GROUP (order by LineTotal) over (partition by ProductID) as [Median (50th Percentile)]
    , avg(LineTotal) over (partition by ProductID) as [Average (Mean)]
from Sales.SalesOrderDetail
where ProductID=709
and YEAR(ModifiedDate) = 2012;

/* OUTPUT INTERPRETATION: 
* 50% of the time the buyer buys ProductID 709 worth of $28.5 -> Percentile_dist()
* Percentile_cont can have different value that is not mentioned in the LineTotal. B/c it interpolates and gives the answer.
* Mean OR Average - an outlier can change the mean value
*/



