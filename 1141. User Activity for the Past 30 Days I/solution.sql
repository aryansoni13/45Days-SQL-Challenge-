# Write your MySQL query statement below
SELECT
    activity_date as day,
    COUNT(DISTINCT user_id) AS active_users
FROM
    Activity
GROUP BY
    day
HAVING
    day between '2019-06-28'
    and '2019-07-27'