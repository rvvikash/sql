we used extract function to fetch the day month year time in postgresql.

  SELECT sender_id, COUNT(SENDER_ID) 
FROM messages 
WHERE EXTRACT(YEAR FROM sent_date)='2022'
AND EXTRACT(MONTH FROM SENT_DATE)='08'
GROUP BY sender_id order by count(sender_id) desc
limit 2
https://datalemur.com/questions/teams-power-users
