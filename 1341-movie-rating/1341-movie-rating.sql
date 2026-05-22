# Write your MySQL query statement below
-- select * from Movies;
-- select * from Users;
-- select * from MovieRating;
select results from(
    -- Subquery 1: Fetch the top user
select u.name as results
from MovieRating mr
join Users u on u.user_id = mr.User_id
group by mr.User_id
order by count(mr.movie_id) desc,u.name asc limit 1
) as top_user
union all
SELECT results FROM (
    -- Subquery 2: Fetch the top movie in Feb 2020
    SELECT m.title AS results
FROM MovieRating mr
JOIN Movies m ON mr.movie_id = m.movie_id
WHERE mr.created_at >= '2020-02-01' AND mr.created_at < '2020-03-01'
GROUP BY mr.movie_id
    ORDER BY AVG(mr.rating) DESC, m.title ASC LIMIT 1
) AS top_movie;