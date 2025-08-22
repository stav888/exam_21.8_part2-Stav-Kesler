#1
SELECT genre, COUNT(*) as movies_count
FROM movies
GROUP BY genre
ORDER BY movies_count DESC;

#2
SELECT SUM(revenue) as all_revenue , year
FROM movies
GROUP BY year

#3
SELECT genre, AVG(revenue) as avg_revenue
FROM movies
GROUP BY genre
ORDER BY avg_revenue DESC;
