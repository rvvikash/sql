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


 if we have no primary key and we want to join from another table then we can 
create a composite key combination of two column and make as unique and perform join .


 Tip: Also look at the CEILING() and ROUND() functions.




