#1
SELECT t.first_name, t.last_name, c.country_name
FROM tourists t
INNER JOIN countries c ON c.id = t.country_id;

#2
SELECT t.first_name, t.last_name, tr.*
FROM tourists t
INNER JOIN tours tr ON tours.id = t.tour_id;

#3
SELECT t.first_name, t.last_name, tr.*
FROM tourists t
left JOIN tours tr ON tours.id = t.tour_id;

#4
SELECT
    t.id AS tourist_id,
    t.first_name,
    t.last_name,
    t.passport_number,
    t.country_id,
    tr.id AS tour_id,
    tr.tour_name,
    tr.description,
    tr.start_date,
    tr.end_date,
    tr.price,
    tr.max_participants,
    tr.guide_name,
    tr.difficulty_level,
    tr.pickup_location
FROM tourists  AS t
LEFT JOIN tours AS tr ON t.tour_id = tr.id

UNION

SELECT
    t.id,
    t.first_name,
    t.last_name,
    t.passport_number,
    t.country_id,
    tr.id,
    tr.tour_name,
    tr.description,
    tr.start_date,
    tr.end_date,
    tr.price,
    tr.max_participants,
    tr.guide_name,
    tr.difficulty_level,
    tr.pickup_location
FROM tours AS tr
LEFT JOIN tourists AS t ON t.tour_id = tr.id
WHERE t.id IS NULL;

#5
SELECT t.first_name, t.last_name
FROM tourists t
WHERE t.tour_id IS NULL;

DELETE FROM tourists
WHERE tour_id IS NULL;

SELECT t.first_name, t.last_name
FROM tourists t
WHERE t.tour_id IS NOT NULL;

#6
SELECT
    tr.tour_name,
    tr.description,
    tr.start_date,
    tr.end_date
FROM tours tr
LEFT JOIN tourists t ON tr.id = t.tour_id
WHERE t.tour_id IS NULL;



UPDATE tours
SET
    start_date = DATE(start_date, '+1 year'),
    end_date = DATE(end_date, '+1 year')
WHERE
    id NOT IN (
        SELECT DISTINCT tour_id
        FROM tourists
        WHERE tour_id IS NOT NULL
    );


SELECT
    tr.tour_name,
    tr.description,
    tr.start_date,
    tr.end_date
FROM tours tr
LEFT JOIN tourists t ON tr.id = t.tour_id
WHERE t.tour_id IS NOT NULL
