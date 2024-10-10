WITH DailyTotals AS (
    SELECT
        visited_on,
        SUM(amount) AS total_amount
    FROM
        Customer
    GROUP BY
        visited_on
),
MovingAverage AS (
    SELECT
        dt1.visited_on,
        SUM(dt2.total_amount) AS amount,
        ROUND(AVG(dt2.total_amount), 2) AS average_amount
    FROM
        DailyTotals dt1
        JOIN DailyTotals dt2 ON dt2.visited_on BETWEEN DATE_SUB(dt1.visited_on, INTERVAL 6 DAY)
        AND dt1.visited_on
    GROUP BY
        dt1.visited_on
)
SELECT
    visited_on,
    amount,
    average_amount
FROM
    MovingAverage
WHERE
    visited_on >= (
        SELECT
            MIN(visited_on)
        FROM
            DailyTotals
    ) + INTERVAL 6 DAY
ORDER BY
    visited_on;