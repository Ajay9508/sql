# Write your MySQL query statement below
SELECT 
    ROUND(count(event_date)/(select COUNT(distinct player_id)from Activity), 2) AS `fraction`
FROM Activity
WHERE (player_id, DATE_SUB(event_date, INTERVAL 1 DAY)) IN (
    SELECT player_id , MIN(event_date)
    FROM Activity
    GROUP BY player_id
);