in normal view we used to create hide column or dont want do any direct manipulation of data in main table we can use 

a view is a virtual table that is based on the result of a SELECT query.
It allows you to store a query as if it were a table, which can then be queried like a regular table.
Views are useful for simplifying complex queries, abstracting data access, and enforcing security policies.



CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;


DROP VIEW view_name; 
-- To delete the view 


A materialized view in SQL is a database object that contains the results of a query, 
similar to a regular view. However, unlike regular views,
a materialized view physically stores the data returned by the query, 
which allows for faster access and better performance, especially for complex queries and aggregations.


CREATE MATERIALIZED VIEW view_name
AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;


To refresh the data in a materialized view (i.e., update it with the latest data from the underlying tables), 
you typically use the REFRESH command:

REFRESH MATERIALIZED VIEW view_name;







