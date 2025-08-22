#1
SELECT ts.first_name, ts.last_name, c.country_name
FROM tourists ts
INNER JOIN countries c ON c.id = ts.country_id;

#2
SELECT ts.first_name, ts.last_name, tr.*
FROM tourists ts
INNER JOIN tours tr ON tr.id = ts.tour_id;

#3
SELECT ts.first_name, ts.last_name, tr.tour_name, tr.start_date, tr.end_date, tr.price, tr.difficulty_level
FROM tourists ts
LEFT JOIN tours tr ON tr.id = ts.tour_id;

#4
SELECT
    ts.id AS tourist_id,
    ts.first_name,
    ts.last_name,
    ts.passport_number,
    ts.country_id,
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
FROM tourists ts
FULL OUTER JOIN tours tr ON ts.tour_id = tr.id;

#5
SELECT ts.first_name, ts.last_name
FROM tourists ts
WHERE ts.tour_id IS NULL;

DELETE FROM tourists
WHERE tour_id IS NULL;

#6
SELECT tr.tour_name, tr.description, tr.start_date, tr.end_date
FROM tours tr
LEFT JOIN tourists ts ON tr.id = ts.tour_id
WHERE ts.tour_id IS NULL;

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

#7
SELECT COUNT(*) AS trips_without_tourists
FROM tours
WHERE id NOT IN (
    SELECT DISTINCT tour_id
    FROM tourists
    WHERE tour_id IS NOT NULL
);

#8
SELECT
    ts.id AS tourist_id,
    ts.first_name,
    ts.last_name,
    ts.tour_id AS tourist_assigned_trip_id,
    c.country_name,
    tr.id AS trip_id,
    tr.tour_name,
    tr.start_date,
    tr.end_date
FROM tours tr
CROSS JOIN tourists ts
JOIN countries c ON ts.country_id = c.id
ORDER BY tr.id, ts.id;
