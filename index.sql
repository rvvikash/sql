Clustered vs Non-Clustered Index

In a table, there can be only one clustered index or  there can be 
one or more than one non_clustered index.


In Clustered index, there is no separate index storage 
but in Non-Clustered index, there is separate index storage for the index.
Clustered index offers faster data access, on the other hand, the Non-clustered index is slower.

reason :
  When you search for data using a non-clustered index,
  the database engine first locates the rows in the index and then uses the pointers to retrieve the corresponding rows from the table.
  
  When you search for data using a clustered index, the database engine can quickly navigate directly to the correct location
  in the data file because the rows are physically stored in the order of the index


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


NOTE :primary key automatically behave as index ;

BITMAP INDEX:
Bitmap indexes are most effective for columns with low cardinality, where the number of distinct values is relatively small compared to the total number of rows in the table.
They are commonly used in data warehousing and decision support systems to improve query performance for analytical queries and reporting.
example:
CREATE BITMAP INDEX idx_department_id
ON employees (department_id);

| emp_id | emp_name | department_id |
|--------|----------|---------------|
|   101  |   Alice  |       1       |
|   102  |   Bob    |       2       |
|   103  |   Carol  |       1       |
|   104  |   David  |       3       |
|   105  |   Emma   |       2       |


| department_id | Bitmap                |
|---------------|-----------------------|
|       1       | 1 1 0 0 0             |
|       2       | 0 0 1 0 1             |
|       3       | 0 0 0 1 0             |









