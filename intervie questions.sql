*** copy the data format without copying data


new_table is the name of the new table you want to create.
original_table is the name of the original table whose structure you want to copy.

SELECT * selects all columns from the original table.
WHERE 1 = 0 

ensures that no rows are selected (since 1 is never equal to 0), but the structure of the selected columns remains intact.


  *** unique constraint vs primary key

a unique constraint allows NULL but primary contain not null this is the huge diff 


-- merge statment in table 
group by with two column  

SELECT emp_id, emp_name, SUM(salary) AS total_salary
FROM employees
GROUP BY emp_id, emp_name;

moving sum()
select a.*,sum(salary)over(order by emp_id asc) as tt from employees a 

To calculate the moving sum from all previous values in SQL, 
you can use a window function along with the ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW clause.
This clause defines the window for the window function to include all rows from the beginning of the partition up to the current row. 
 Heres an example query:

 SELECT
    date,
    value,
    SUM(value) OVER (ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS moving_sum_all_previous
FROM
    your_table
 in order by put those column which increasing and behalf that we want to add so we used here date.

 if we want to change the moving sum from last 4 days we can replace the unbounded with number. 
 6 preceding like that .

 example :- https://datalemur.com/questions/rolling-average-tweets


 if we have no primary key and we want to join from another table then we can 
create a composite key combination of two column and make as unique and perform join .


 Tip: Also look at the CEILING() and ROUND() functions.


 select a.*,dense_rank() over( order by email_id) as rn,ascii(email_id) from employe a
--check we used ascii value 

SELECT LPAD("SQL Tutorial", 20, "ABC");
ABCABCABSQL Tutorial

 

WITH PeriodicSales AS (
    SELECT 
        SaleDate,
        Amount,
        CEILING(DAY(SaleDate) / 5.0) AS Period
    FROM Sales
)
SELECT 
    Period,
    MIN(SaleDate) AS PeriodStartDate,
    MAX(SaleDate) AS PeriodEndDate,
    SUM(Amount) AS TotalSales
FROM PeriodicSales
GROUP BY Period
ORDER BY Period;

| Period | PeriodStartDate | PeriodEndDate | TotalSales |
|--------|-----------------|---------------|------------|
| 1      | 2024-06-01      | 2024-06-05    | 750.00     |
| 2      | 2024-06-06      | 2024-06-10    | 780.00     |
| 3      | 2024-06-11      | 2024-06-15    | 1150.00    |
| 4      | 2024-06-16      | 2024-06-20    | 1400.00    |
| 5      | 2024-06-21      | 2024-06-25    | 1650.00    |
| 6      | 2024-06-26      | 2024-06-30    | 1900.00    |


(CAST((EXTRACT(DAY FROM date) - 1) / 4 AS float) + 1) AS period_number

WITH WeeklySales AS (
    SELECT 
        SaleDate,
        Amount,
        DATEPART(WEEK, SaleDate) AS WeekNumber
    FROM Sales
)
SELECT 
    WeekNumber,
    MIN(SaleDate) AS WeekStartDate,
    MAX(SaleDate) AS WeekEndDate,
    SUM(Amount) AS TotalSales
FROM WeeklySales
GROUP BY WeekNumber
ORDER BY WeekNumber;

| WeekNumber | WeekStartDate | WeekEndDate | TotalSales |
|------------|---------------|-------------|------------|
| 22         | 2024-06-01    | 2024-06-02  | 250.00     |
| 23         | 2024-06-03    | 2024-06-09  | 990.00     |
| 24         | 2024-06-10    | 2024-06-16  | 1450.00    |
| 25         | 2024-06-17    | 2024-06-23  | 1760.00    |
| 26         | 2024-06-24    | 2024-06-30  | 2220.00    |






