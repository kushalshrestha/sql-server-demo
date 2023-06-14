-- select convert(date, ModifiedDate), LineTotal
-- from Sales.SalesOrderDetail;

/**
REPORT TO CHECK % of growth rate by quarter against last year quarter
*/

with total as (
select year(ModifiedDate) as [Year], (month(ModifiedDate)/4) + 1 as [Quarter], sum(LineTotal) as [QuarterRevenue]
from Sales.SalesOrderDetail
where year(ModifiedDate) >=2012
group by year(ModifiedDate), ((month(ModifiedDate)/4) + 1)
)
,PrevTotals as (
select *
    , lag(QuarterRevenue,4,0) OVER (ORDER by [Year], [Quarter] asc) as PreviousQtRevenue
from total
)
select * 
        , case 
            when PreviousQtRevenue != 0 then (QuarterRevenue-PreviousQtRevenue)*100/PreviousQtRevenue
            else PreviousQtRevenue
        end as [% of GrowthRate after Last Year Same Quarter]
from PrevTotals;
