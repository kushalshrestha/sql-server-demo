IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'kushal_pagination'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.kushal_pagination
GO

SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'kushal_pagination'
    AND ROUTINE_TYPE = N'PROCEDURE'