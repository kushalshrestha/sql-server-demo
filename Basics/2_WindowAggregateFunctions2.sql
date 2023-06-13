with base as (
select SalesOrderID, ModifiedDate
    , year(ModifiedDate) as Year
    , month(ModifiedDate) as Month
    , sum(LineTotal) over (partition by year(ModifiedDate), month(ModifiedDate)) as MonthlySales
    , sum(LineTotal) over (partition by year(ModifiedDate)) as YearlySales 
from Sales.SalesOrderDetail s
where SalesOrderID in (51721, 51722, 43659, 50814, 50825, 46429, 45377)
),
MonthlyDetails as (
select *
    , MonthlySales*100/YearlySales as [% of Annual Sales]
    , DENSE_RANK() over (partition by Year order by MonthlySales desc) [Monthly Sales Rank] -- highest monthly sales ranking for all year
from base b
)

select *
from MonthlyDetails
where [Monthly Sales Rank] = 1;

