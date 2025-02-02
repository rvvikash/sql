we used extract function to fetch the day month year time in postgresql.

SELECT sender_id, COUNT(SENDER_ID) 
FROM messages 
WHERE EXTRACT(YEAR FROM sent_date)='2022'
AND EXTRACT(MONTH FROM SENT_DATE)='08'
SELECT TO_char(event_date, 'YYYY') AS event_date_formatted
SELECT EXTRACT(EPOCH FROM end_time_column - start_time_column) AS time_diff_seconds
SELECT TO_CHAR(your_date_column, 'Day') AS DayOfWeek
FROM your_table
WHERE EXTRACT(DOW FROM your_date_column) BETWEEN 1 AND 5;

FROM your_table;

FROM user_actions;

GROUP BY sender_id order by count(sender_id) desc
limit 2
https://datalemur.com/questions/teams-power-users


in sql|

DATEDIFF(day, required_date, shipped_date)

SELECT 
    DATEADD(second, 1, '2018-12-31 23:59:59') result;
  SELECT TIMEDIFF('2018-05-23 18:00:00', '2018-05-23 12:00:00')
  SELECT CURRENT_DATE AS current_date;
  As Result;


  THEN SEC_TO_TIME(TIMESTAMPDIFF(SECOND, Arrival, Next_Arrival))


      
  DATEPART(year, shipped_date) [year], 
  DATEPART(quarter, shipped_date) [quarter], 
  DATEPART(month, shipped_date) [month], 
  DATEPART(day, shipped_date) [day]
SELECT Name, FORMAT(HireDate, 'HH:mm:ss') AS HireTimeOnly FROM Employee;
SELECT Name, FORMAT(HireDate, 'yyyy-MM-dd') AS HireDateOnly FROM Employee;
SELECT Name, FORMAT(HireDate, 'yyyy-MM-dd HH:mm:ss') AS FormattedHireDate FROM Employee;
SELECT Name, DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsOfService FROM Employee;
SELECT Name, DATEADD(YEAR, 1, HireDate) AS OneYearAfterHire FROM Employee;--add one year--
SELECT Name, DATEADD(DAY, 10, HireDate) AS TenDaysAfterHire FROM Employee;
SELECT Name, DAY(DateOfBirth) AS BirthDay FROM Employee;
SELECT Name, MONTH(DateOfBirth) AS BirthMonth FROM Employee;
SELECT Name, FORMAT(DateOfBirth, 'dddd, MMMM dd, yyyy') AS FullDateOfBirth FROM Employee;
SELECT DATE_FORMAT(your_date_column, '%W') AS DayOfWeek
FROM your_table
WHERE WEEKDAY(your_date_column) BETWEEN 0 AND 4;

SELECT FORMAT(GETDATE(), 'yyyy-MM-dd HH:mm:ss') AS formatted_datetime;

----last 10 days using date add--
SELECT SUM(sale_amount) AS total_sales_last_10_days
FROM sales
WHERE sale_date >= DATEADD(DAY, -10, GETDATE());
----last 10 days using date diff--

SELECT SUM(sale_amount) AS total_sales_last_10_days
FROM sales
WHERE DATEDIFF(DAY, sale_date, GETDATE()) <= 10;

SELECT DATEADD(HOUR, -10, GETDATE()) AS NewDateTime;











