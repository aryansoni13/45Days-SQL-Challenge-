# Write your MySQL query statement below
WITH UserRatings AS (
    SELECT user_id, COUNT(*) AS movie_count
    FROM MovieRating
    GROUP BY user_id
),
MaxUserRatings AS (
    SELECT user_id
    FROM UserRatings
    WHERE movie_count = (SELECT MAX(movie_count) FROM UserRatings)
),
MaxUserNames AS (
    SELECT u.name
    FROM MaxUserRatings m
    JOIN Users u ON u.user_id = m.user_id
    ORDER BY u.name
    LIMIT 1
),
MovieAvgRating AS (
    SELECT mr.movie_id, AVG(mr.rating) AS avg_rating
    FROM MovieRating mr
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY mr.movie_id
),
MaxAvgRating AS (
    SELECT movie_id
    FROM MovieAvgRating
    WHERE avg_rating = (SELECT MAX(avg_rating) FROM MovieAvgRating)
),
MaxMovieNames AS (
    SELECT m.title
    FROM MaxAvgRating r
    JOIN Movies m ON m.movie_id = r.movie_id
    ORDER BY m.title
    LIMIT 1
)
SELECT name AS results FROM MaxUserNames
UNION ALL
SELECT title AS results FROM MaxMovieNames;
