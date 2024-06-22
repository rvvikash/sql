RANK() functions assign a unique rank to each distinct row in the result set, with tied rows receiving the same rank and leaving gaps in subsequent ranks. For example, if two rows tie for first place, the next row will receive a rank of 3.

On the other hand, DENSE_RANK() also assigns ranks based on criteria, but it does not leave gaps between ranks in case of tied rows. This



  CREATE TABLE Sale (
    ProductName VARCHAR(50),
    SalesAmount DECIMAL(10, 2)
);

INSERT INTO Sale (ProductName, SalesAmount) VALUES
('Product A', 1000.00),
('Product B', 1500.00),
('Product C', 1500.00),
('Product D', 2000.00),
('Product E', 2000.00),
('Product F', 2500.00);

SELECT 
    ProductName,
    SalesAmount,
    RANK() OVER (ORDER BY SalesAmount DESC) AS Rank,
    DENSE_RANK() OVER (ORDER BY SalesAmount DESC) AS Dense_Rank,
	row_number() over (partition by salesamount order by salesamount desc) as ronum,
	dENSE_RANK() OVER (partition by salesamount ORDER BY SalesAmount DESC) AS Dense_Rank-2,
	row_number() over (order by salesamount desc) as ronum1,
	RANK() OVER (partition by salesamount ORDER BY SalesAmount DESC) AS Rank-2
FROM 
    Sale;

| productname | salesamount | rank | dense_rank | ronum | dense_rank-2 | ronum1 | rank-2 |
|-------------|-------------|------|-------------|-------|---------------|--------|--------|
| Product F   | 2500.00     | 1    | 1           | 1     | 1             | 1      | 1      |
------------------------------------------------------------------------------------------------
| Product D   | 2000.00     | 2    | 2           | 1     | 1             | 2      | 1      |
------------------------------------------------------------------------------------------------
| Product E   | 2000.00     | 2    | 2           | 2     | 1             | 3      | 1      |
------------------------------------------------------------------------------------------------
| Product B   | 1500.00     | 4    | 3           | 1     | 1             | 4      | 1      |
------------------------------------------------------------------------------------------------
| Product C   | 1500.00     | 4    | 3           | 2     | 1             | 5      | 1      |
------------------------------------------------------------------------------------------------
| Product A   | 1000.00     | 6    | 4           | 1     | 1             | 6      | 1      |
------------------------------------------------------------------------------------------------


assume if we want to find 3rd highest salary in which repeated product is there ,
so it only way to achieve this using dense rank if there is duplicate salary for the product so in case if someone is looking of 3rd max amount then any window
will work ,but if someine looking all the detail which have 3rd max salary then need to use dense rank without partition. 



LAG :

LAG(column_name, offset, default_value) OVER (ORDER BY order_column)

Lead :

LEAD(column_name, offset, default_value) OVER (ORDER BY order_column)

sum() over(partition by col_name order by col_name) as commulative_sum



	
