DECLARE @cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX);

-- Generate a comma-separated list of customer IDs for pivot columns
SELECT @cols = STUFF((SELECT ',' + QUOTENAME(CustomerID) 
                    FROM Sales
                    GROUP BY CustomerID
                    ORDER BY CustomerID
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'');

-- Construct the dynamic SQL query
SET @query = 
    'SELECT Product, ' + @cols + ' 
    FROM (
        SELECT Product, CustomerID, Amount
        FROM Sales
    ) AS SourceTable
    PIVOT (
        MAX(Amount)
        FOR CustomerID IN (' + @cols + ')
    ) AS PivotTable;';

-- Execute the dynamic SQL query
EXEC(@query);
