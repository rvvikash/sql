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
