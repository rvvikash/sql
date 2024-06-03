we used extract function to fetch the day month year time in postgresql.

  SELECT sender_id, COUNT(SENDER_ID) 
FROM messages 
WHERE EXTRACT(YEAR FROM sent_date)='2022'
AND EXTRACT(MONTH FROM SENT_DATE)='08'
GROUP BY sender_id order by count(sender_id) desc
limit 2
https://datalemur.com/questions/teams-power-users


in sql|

DATEDIFF(day, required_date, shipped_date)

SELECT 
    DATEADD(second, 1, '2018-12-31 23:59:59') result;

