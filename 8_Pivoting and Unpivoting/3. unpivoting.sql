/* To remove NULL in pivot values -> isnull([columnName],0) as [newColumnName] is used*/
with myTable as (
    select year(DateOfTransaction) as TheYear,
            month(DateOfTransaction) as TheMonth,
            Amount 
    from tblTransaction
)

select TheYear , isnull([1],0) as [1]
                , isnull([2],0) as [2]
                , isnull([3],0) as [3]
from myTable
PIVOT (sum(Amount) for TheMonth in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) as myPivot
ORDER BY TheYear