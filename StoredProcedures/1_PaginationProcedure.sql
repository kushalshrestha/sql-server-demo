CREATE PROCEDURE dbo.kushal_pagination
    @start as int,
    @step as int=10
AS
BEGIN
    with trackPageForProductID as (
        SELECT ProductID, OrderQty, UnitPrice, ROW_NUMBER() over (order by Unitprice desc) as rowNumber
        FROM [AdventureWorks2012].[Sales].SalesOrderDetail
        WHERE SalesOrderID = 51721
    )
    select *
    from trackPageForProductID
    where rowNumber > @start 
    and rowNumber <= @start + @step
END
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.kushal_pagination 0; -- using default parameter
GO

EXECUTE dbo.kushal_pagination 10; -- second page
GO

EXECUTE dbo.kushal_pagination 10, 100; --another page with 100
GO