Clustered vs Non-Clustered Index

In a table, there can be only one clustered index or  there can be 
one or more than one non_clustered index.


In Clustered index, there is no separate index storage 
but in Non-Clustered index, there is separate index storage for the index.
Clustered index offers faster data access, on the other hand, the Non-clustered index is slower.


when we create a primary key then it automatically behave as index .

if there is no index define in table it will scan full scan to retrive the data.


B-tree indexes organize data in a balanced tree structure,
allowing for efficient search, insertion, and deletion operations.

CREATE INDEX index_name
ON table_name (column_name);


unique index:
  A unique index in SQL ensures that the values in a specified column or set of columns are unique across the table. This means that no two rows can have the same combination of values in the indexed columns.
  Unique indexes are often used to enforce data integrity and prevent duplicate entries in a database table
  example :--
  suppose you have a table named employees with columns emp_id and emp_email, and you want to ensure that each email address is unique across the table.
  You can create a unique index on the emp_email column like this:

CREATE UNIQUE INDEX idx_emp_id_email
ON employees (emp_id, emp_email);


composite index:
A composite index in SQL is an index that spans multiple columns in a table. It allows you to create an index on a combination of two or more columns, which can improve the efficiency of queries that involve filtering, sorting, or joining data based on those columns.
  Composite indexes are particularly useful when queries frequently involve conditions that reference multiple columns.

  For example, suppose you have a table named employees with columns department_id, salary, and hire_date, and you frequently run queries that filter or sort data based on both the department_id and hire_date columns.
  You can create a composite index on these columns like this:
example:
CREATE INDEX idx_department_hiredate
ON employees (department_id, hire_date);









