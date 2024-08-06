/*---------------------------------------------------------------------------------
First Day Retention Rate
Calculate the first-day retention rate of a group of video game players. 
The first-day retention occurs when a player logs in 1 day after their first-ever log-in.
Return the proportion of players who meet this definition divided by the total number of players.
-----------------------------------------------------------------------------------*/

WITH first_days AS
  (SELECT player_id,
          MIN(login_date) AS first_day
   FROM players_logins
   GROUP BY player_id)

SELECT 
  CAST(COUNT(DISTINCT first_days.player_id) AS FLOAT)/
  (SELECT COUNT(DISTINCT player_id) AS total_users
   FROM players_logins) AS retention_rate
FROM first_days
JOIN players_logins 
ON first_days.player_id = players_logins.player_id
WHERE login_date - first_day = 1

