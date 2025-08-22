#1
SELECT genre, COUNT(*) as movies_count
FROM movies
GROUP BY genre
ORDER BY movies_count DESC;

#2
SELECT SUM(revenue) as all_revenue , year
FROM movies
GROUP BY year;

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
LIMIT 1;

#6
SELECT country, COUNT(*) as movie_count
FROM movies
GROUP BY country
ORDER BY movie_count DESC
limit 1;

#7
SELECT genre, COUNT(*) AS total_movies
FROM movies
GROUP BY genre
HAVING COUNT(*) > 2
ORDER BY total_movies DESC;

#8
SELECT year, sum(revenue) AS total_revenue
FROM movies
GROUP BY year
HAVING total_revenue > 1000
ORDER BY year;

#9
SELECT language, COUNT(*) AS total_movies
FROM movies
GROUP BY language
HAVING COUNT(*) >= 3
ORDER BY total_movies DESC;

