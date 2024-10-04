# Write your MySQL query statement below
SELECT ROUND(COUNT(a.player_id) / (SELECT COUNT(DISTINCT(player_id)) FROM Activity),2) AS fraction FROM(
    SELECT player_id,event_date,FIRST_VALUE(event_date) OVER(PARTITION BY player_id ORDER BY       
    event_date) AS first_login FROM Activity) a WHERE DATE_ADD(a.first_login,INTERVAL 1 DAY
) = a.event_date;