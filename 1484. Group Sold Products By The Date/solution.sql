# Write your MySQL query statement below
WITH DistinctSales AS (
    SELECT DISTINCT sell_date, product
    FROM Activities
)
SELECT 
    sell_date,
    COUNT(product) AS num_sold,
    GROUP_CONCAT(product ORDER BY product ASC SEPARATOR ',') AS products
FROM DistinctSales
GROUP BY sell_date
ORDER BY sell_date;
