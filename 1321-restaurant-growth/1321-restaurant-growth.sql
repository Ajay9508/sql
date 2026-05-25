# Write your MySQL query statement below
WITH DailyAmount AS (
    SELECT 
        visited_on,
        SUM(amount) AS daily_sum
    FROM 
        Customer
    GROUP BY 
        visited_on
),
MovingStats AS (
    SELECT 
        visited_on,
        SUM(daily_sum) OVER(
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        ROUND(AVG(daily_sum) OVER(
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ), 2) AS average_amount,
        -- Find the absolute first date available in the dataset
        MIN(visited_on) OVER() AS first_date
    FROM 
        DailyAmount
)
SELECT 
    visited_on, 
    amount, 
    average_amount
FROM 
    MovingStats
WHERE 
    DATEDIFF(visited_on, first_date) >= 6
ORDER BY 
    visited_on ASC;