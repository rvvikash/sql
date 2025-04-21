✅ Definition:
A View is a virtual table based on the result of a SELECT query.

It does not store data physically; it pulls data from the underlying tables each time it is queried.

✅ Purpose & Use Cases:
Hide sensitive columns

Simplify complex queries

Abstract data access

Improve security by restricting direct table access

✅ Syntax:
sql
Copy
Edit
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
✅ Drop a View:
sql
Copy
Edit
DROP VIEW view_name;
📌 Materialized Views in SQL
✅ Definition:
A Materialized View stores the physical result of a query like a table.

Unlike a normal view, it does not update automatically unless refreshed.

✅ Purpose & Use Cases:
Boost performance for complex/expensive queries

Improve aggregation/reporting speed

Ideal for summary tables, dashboards, reporting systems

✅ Syntax:
sql
Copy
Edit
CREATE MATERIALIZED VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
✅ Refresh the Data:
sql
Copy
Edit
REFRESH MATERIALIZED VIEW view_name;
This re-runs the underlying query and updates the materialized view with latest data.

🆚 Key Differences: View vs Materialized View

Feature	View	Materialized View
Data Storage	Virtual (no storage)	Physically stored
Performance	Depends on query complexity	Faster, as data is precomputed
Data Freshness	Always current	May be stale until refreshed
Refresh Required	❌ No	✅ Yes (manual or scheduled)
Use Case	Simplify queries, security	Speed up complex reporting
