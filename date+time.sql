2. Formatting Dates
Use DATE_FORMAT() to format dates:

SELECT 
  DATE_FORMAT(your_date_column, '%W') AS DayOfWeek,
  DATE_FORMAT(your_date_column, '%Y-%m-%d %H:%i:%s') AS FullDateTime
FROM your_table
WHERE WEEKDAY(your_date_column) BETWEEN 0 AND 4;
%W = Weekday name

%Y-%m-%d = Date

%H:%i:%s = Time (Hour:Minute:Second)

🕒 3. Get Current Date & Time

SELECT CURRENT_DATE AS current_date;
SELECT NOW() AS current_datetime;
➕➖ 4. Add or Subtract Time
Add Time:

SELECT DATE_ADD('2025-02-07', INTERVAL 10 DAY) AS future_date;
SELECT DATE_ADD('2025-02-07', INTERVAL 1 MONTH) AS one_month_later;

Subtract Time:

SELECT DATE_SUB('2025-02-07', INTERVAL 10 DAY) AS past_date;
SELECT DATE_SUB('2025-02-07', INTERVAL 2 WEEK) AS two_weeks_earlier;
📆 5. Calculating Date Differences
Days Between Dates:

SELECT DATEDIFF('2025-02-07', '2025-01-01') AS days_difference;
Date Difference in Units:

SELECT TIMESTAMPDIFF(DAY, '2025-01-01', '2025-02-07') AS days_diff;
SELECT TIMESTAMPDIFF(MONTH, '2024-01-01', '2025-02-07') AS months_diff;
⏰ 6. Working with Time
Format Time:

SELECT TIME_FORMAT('18:30:00', '%H:%i') AS formatted_time;
Convert Seconds to Time:

SELECT SEC_TO_TIME(3661) AS time_value;  -- Output: 01:01:01
🧮 7. Time Difference

SELECT TIMEDIFF('18:00:00', '12:00:00') AS time_diff;  -- Output: 06:00:00
📊 8. Last 10 Days Sales Example
Method 1: Using DATE_ADD():

SELECT SUM(sale_amount) AS total_sales_last_10_days
FROM sales
WHERE sale_date >= DATE_ADD(CURRENT_DATE, INTERVAL -10 DAY);
Method 2: Using DATEDIFF():

SELECT SUM(sale_amount) AS total_sales_last_10_days
FROM sales
WHERE DATEDIFF(CURRENT_DATE, sale_date) <= 10;

BY DEFAULT IT WILL RETURN DAY AS DIFF FOR THE OUTPUT.

  
📅 9. Weekday Filtering
WEEKDAY(date) returns:
Monday=0, ..., Sunday=6

Filter Only Weekdays:

SELECT * FROM sales
WHERE WEEKDAY(sale_date) BETWEEN 0 AND 4;
Filters records from Monday to Friday, excluding weekends.


  SELECT 
    *,
    CASE 
        WHEN EXTRACT(DAY FROM price_date) = 1 THEN price_date
        ELSE CAST(DATE_TRUNC('month', price_date) AS DATE)
    END AS month_start_date
FROM product_prices;

1	"2023-01-01"	10	"2023-01-01"
1	"2023-02-15"	15	"2023-02-01"
1	"2023-03-03"	18	"2023-03-01"
1	"2023-03-27"	15	"2023-03-01"
1	"2023-04-06"	20	"2023-04-01"


SELECT 
  start_date,
  months_to_add,
  DATE_ADD(start_date, INTERVAL months_to_add MONTH) AS new_date
FROM example;



to find quarter :-                                
SELECT
  your_date_column,
  QUARTER(your_date_column) AS Quarter
FROM your_table;

