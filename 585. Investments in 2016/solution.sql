# Write your MySQL query statement below
WITH DuplicateTIV AS (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
),
UniqueLocation AS (
    SELECT pid
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
)
SELECT ROUND(SUM(i.tiv_2016), 2) AS tiv_2016
FROM Insurance i
JOIN DuplicateTIV d
ON i.tiv_2015 = d.tiv_2015
JOIN UniqueLocation u
ON i.pid = u.pid;
