*** copy the data format without copying data


new_table is the name of the new table you want to create.
original_table is the name of the original table whose structure you want to copy.

SELECT * selects all columns from the original table.
WHERE 1 = 0 

ensures that no rows are selected (since 1 is never equal to 0), but the structure of the selected columns remains intact.


  *** unique constraint vs primary key

a unique constraint allows NULL but primary contain not null this is the huge diff 

create index for table
*** CREATE INDEX idx_last_name ON employees(last_name);


-- merge statment in table 
group by with two column 


 

SELECT emp_id, emp_name, SUM(salary) AS total_salary
FROM employees
GROUP BY emp_id, emp_name;



