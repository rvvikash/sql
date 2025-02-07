1. Extracting Parts of a Date
EXTRACT(): Extracts specific parts (such as year, month, day) from a date or datetime column.
sql
Copy
SELECT EXTRACT(YEAR FROM sent_date) AS year,
       EXTRACT(MONTH FROM sent_date) AS month,
       EXTRACT(DAY FROM sent_date) AS day
FROM messages;
Explanation:
The EXTRACT() function is used to pull out the YEAR, MONTH, and DAY components from the sent_date column.
2. Formatting Dates
DATE_FORMAT(): Formats a date or datetime value according to a specified format.
sql
Copy
SELECT DATE_FORMAT(your_date_column, '%W') AS DayOfWeek
FROM your_table
WHERE WEEKDAY(your_date_column) BETWEEN 0 AND 4;
Explanation:
The DATE_FORMAT() function is used to extract the full name of the day (%W), and WEEKDAY() is used to filter weekdays (Monday to Friday) where 0 is Monday and 4 is Friday.
3. Getting Current Date and Time
CURRENT_DATE: Returns the current date in YYYY-MM-DD format.
sql
Copy
SELECT CURRENT_DATE AS current_date;
Explanation:

CURRENT_DATE provides the current date without the time component.
NOW(): Returns the current date and time in YYYY-MM-DD HH:MM:SS format.

sql
Copy
SELECT NOW() AS current_datetime;
Explanation:
NOW() retrieves the current date and time.
4. Adding or Subtracting Time
DATE_ADD(): Adds a specified time interval to a date or datetime.
sql
Copy
SELECT DATE_ADD('2025-02-07', INTERVAL 10 DAY) AS future_date;
Explanation:

This adds 10 days to the date '2025-02-07', returning '2025-02-17'.
DATE_SUB(): Subtracts a specified time interval from a date or datetime.

sql
Copy
SELECT DATE_SUB('2025-02-07', INTERVAL 10 DAY) AS past_date;
Explanation:
This subtracts 10 days from '2025-02-07', resulting in '2025-01-28'.
5. Calculating Date Differences
DATEDIFF(): Returns the difference in days between two dates.
sql
Copy
SELECT DATEDIFF('2025-02-07', '2025-01-01') AS date_diff;
Explanation:

DATEDIFF() calculates the number of days between '2025-02-07' and '2025-01-01', returning 37 days.
TIMESTAMPDIFF(): Returns the difference between two datetime values based on the specified unit (e.g., second, minute, day).

sql
Copy
SELECT TIMESTAMPDIFF(DAY, '2025-01-01', '2025-02-07') AS date_diff_in_days;
Explanation:
TIMESTAMPDIFF(DAY, ...) calculates the difference in days between two datetime values.
6. Working with Time
TIME_FORMAT(): Formats a time value into a string.
sql
Copy
SELECT TIME_FORMAT('18:30:00', '%H:%i') AS formatted_time;
Explanation:

TIME_FORMAT() is used to display only the hours and minutes (18:30).
SEC_TO_TIME(): Converts seconds into a TIME value.

sql
Copy
SELECT SEC_TO_TIME(3661) AS time_value;
Explanation:
This converts 3661 seconds into 01:01:01 (1 hour, 1 minute, 1 second).
7. Working with Date and Time Intervals
DATE_ADD() and DATE_SUB() with Intervals: Both functions allow you to add or subtract time intervals such as days, months, years, and more.
sql
Copy
SELECT DATE_ADD('2025-02-07', INTERVAL 1 MONTH) AS one_month_later;
Explanation:
This adds one month to '2025-02-07', returning '2025-03-07'.
sql
Copy
SELECT DATE_SUB('2025-02-07', INTERVAL 2 WEEK) AS two_weeks_earlier;
Explanation:
This subtracts 2 weeks from '2025-02-07', resulting in '2025-01-24'.
8. Time Differences
TIMEDIFF(): Returns the difference between two TIME values.
sql
Copy
SELECT TIMEDIFF('18:00:00', '12:00:00') AS time_diff;
Explanation:
This function calculates the difference between 18:00:00 and 12:00:00, resulting in 06:00:00 (6 hours).
9. Using NOW() to Get Current Date and Time
NOW(): Returns the current date and time in YYYY-MM-DD HH:MM:SS format.
sql
Copy
SELECT NOW() AS current_datetime;
Explanation:
This retrieves the current date and time.
10. Last 10 Days Sales Calculation
You can use either DATE_ADD() or DATEDIFF() to calculate total sales over the last 10 days.

Using DATE_ADD():
sql
Copy
SELECT SUM(sale_amount) AS total_sales_last_10_days
FROM sales
WHERE sale_date >= DATE_ADD(CURRENT_DATE, INTERVAL -10 DAY);
Explanation:

This filters sales that occurred in the last 10 days by subtracting 10 days from CURRENT_DATE.
Using DATEDIFF():

sql
Copy
SELECT SUM(sale_amount) AS total_sales_last_10_days
FROM sales
WHERE DATEDIFF(CURRENT_DATE, sale_date) <= 10;
Explanation:
This calculates the number of days between the sale date and today, filtering for sales within the last 10 days.
