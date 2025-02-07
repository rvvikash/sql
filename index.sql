Clustered vs Non-Clustered Index

In a table, there can be only one clustered index or  there can be 
one or more than one non_clustered index.

  clustered index:

Definition: A clustered index determines the physical order of data in the table. In other words, the rows are stored on disk in the same order as the clustered index.
  
Unique Constraint: Each table can have only one clustered index because the data can be sorted in only one way.
  
Primary Key: By default, the primary key of a table is often used as the clustered index. However, this is not mandatory.
  
Performance: Clustered indexes can improve performance for queries that retrieve a range of values or involve sorting. Since the data is physically ordered, it can be retrieved more efficiently.

  Non clustered index:

Definition: A non-clustered index is a separate structure from the data table. It creates a logical order of the data but does not alter the physical order of the data in the table.
Multiple Indexes: A table can have multiple non-clustered indexes, each potentially optimizing different types of queries.
Structure: It contains pointers to the data rows, which means it creates a separate data structure that references the location of the actual data in the table.
Performance: Non-clustered indexes can improve query performance by providing quick access to data without affecting the physical storage of the data. However, they can be less efficient for range queries compared to clustered indexes.

when we create a primary key then it automatically behave as index  / Clustered Index:.

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


ndex Type	Best For	Example
Clustered Index	Range queries and sorting	CREATE TABLE employees (emp_id INT PRIMARY KEY, emp_name VARCHAR(100));

Non-Clustered Index	Quick lookups, not for range queries	CREATE INDEX idx_emp_name ON employees (emp_name);

Unique Index	Preventing duplicates	CREATE UNIQUE INDEX idx_emp_email ON employees (emp_email);

Composite Index	Queries using multiple columns	CREATE INDEX idx_department_hiredate ON employees (department_id, hire_date);

Bitmap Index	Low cardinality columns (e.g., gender, status)	CREATE BITMAP INDEX idx_department_id ON employees (department_id);

Primary Key Index	Enforcing uniqueness and automatic indexing	CREATE TABLE employees (emp_id INT PRIMARY KEY, emp_name VARCHAR(100));

B-tree Index	Fast lookups, range queries, and sorting	CREATE INDEX idx_emp_id_btree ON employees (emp_id);










