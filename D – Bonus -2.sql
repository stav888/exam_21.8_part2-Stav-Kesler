CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    movie_name TEXT NOT NULL UNIQUE,
    genre TEXT NOT NULL,
    country TEXT NOT NULL,
    language TEXT NOT NULL,
    year INTEGER NOT NULL CHECK (year >= 2009),
    revenue REAL NOT NULL CHECK (revenue >= 0)e
);

DROP FUNCTION IF EXISTS total_revenue_for_year(INTEGER);

CREATE OR REPLACE FUNCTION total_revenue_for_year(target_year INTEGER)
RETURNS REAL
LANGUAGE plpgsql AS
$$
DECLARE year_total REAL;
BEGIN
    SELECT SUM(revenue) INTO year_total
    FROM movies
    WHERE year = target_year;

    RETURN year_total;
END;
$$;

SELECT total_revenue_for_year(2023) AS total_revenue;
