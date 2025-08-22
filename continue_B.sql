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

#4
SELECT genre, AVG(revenue) as avrage_revenue, language
FROM movies
GROUP BY genre, language
ORDER BY genre ASC;

#5
SELECT language, COUNT(*) as movie_count
FROM movies
GROUP BY language
ORDER BY movie_count ASC

#6
