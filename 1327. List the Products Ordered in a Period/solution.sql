WITH OrderSummary AS (
    SELECT product_id, SUM(unit) AS total_units
    FROM Orders
    WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY product_id
)
SELECT P.product_name, OS.total_units AS unit
FROM Products P
JOIN OrderSummary OS
ON P.product_id = OS.product_id
WHERE OS.total_units >= 100;
