WITH RECURSIVE employee_hierarchy AS (
  SELECT employee_id, name, manager_id, 1 as level
  FROM employees
  WHERE employee_id = 1   -- Anchor member: select the starting employee
  UNION ALL
  SELECT e.employee_id, e.name, e.manager_id, eh.level + 1
  FROM employees e
  JOIN employee_hierarchy eh ON e.manager_id = eh.employee_id   -- Recursive member: join with previous level
)
SELECT employee_id, name, level
FROM employee_hierarchy;


https://www.stratascratch.com/blog/learn-to-use-a-recursive-cte-in-sql-query/
https://www.youtube.com/watch?v=Rml3UX8no0M&ab_channel=LearnatKnowstar

  
WITH RECURSIVE file_paths AS (
  SELECT file_id, name, parent_id, name as path
  FROM files
  WHERE parent_id IS NULL   -- Anchor member: select the root files
  UNION ALL
  SELECT f.file_id, f.name, f.parent_id, CONCAT(fp.path, '/', f.name)
  FROM files f
  JOIN file_paths fp ON f.parent_id = fp.file_id   -- Recursive member: join with previous level
)
SELECT file_id, path
FROM file_paths;



WITH RECURSIVE Triangle AS (
    -- Base case: The first row with one number (1)
    SELECT 1 AS num, 1 AS row_num
    UNION ALL
    -- Recursive case: Adding the next number to the row for each iteration
    SELECT num + 1, row_num + 1
    FROM Triangle
    WHERE row_num < 5  -- This sets the height of the triangle (5 rows)
)
SELECT REPEAT(' ', 5 - row_num) + REPEAT('*', row_num)
FROM Triangle;

