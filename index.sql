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








