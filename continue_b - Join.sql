#1
SELECT t.first_name, t.last_name, c.country_name
FROM tourists t
INNER JOIN countries c ON c.id = t.country_id;

#2
SELECT t.first_name, t.last_name, tr.*
FROM tourists t
INNER JOIN tours tr ON tr.id = t.tour_id;

#3
SELECT t.first_name, t.last_name, tr.*
FROM tourists t
left JOIN tours tr ON tr.id = t.tour_id;

#4
-- Display all tourists and their assigned trip details, plus all trips with their assigned tourists
-- Using UNION of LEFT JOIN and RIGHT JOIN to simulate FULL JOIN (since SQLite doesn't support FULL JOIN)

SELECT 
    t.id AS tourist_id,
    t.first_name,
    t.last_name,
    t.passport_number,
    t.date_of_birth,
    t.gender,
    t.email,
    t.phone,
    c.country_name,
    tours.id AS tour_id,
    tours.tour_name,
    tours.description,
    tours.start_date,
    tours.end_date,
    tours.price,
    tours.max_participants,
    tours.guide_name,
    tours.difficulty_level,
    tours.pickup_location
FROM tourists t
LEFT JOIN countries c ON t.country_id = c.id
LEFT JOIN tours ON t.tour_id = tours.id

UNION

SELECT 
    t.id AS tourist_id,
    t.first_name,
    t.last_name,
    t.passport_number,
    t.date_of_birth,
    t.gender,
    t.email,
    t.phone,
    c.country_name,
    tours.id AS tour_id,
    tours.tour_name,
    tours.description,
    tours.start_date,
    tours.end_date,
    tours.price,
    tours.max_participants,
    tours.guide_name,
    tours.difficulty_level,
    tours.pickup_location
FROM tours
LEFT JOIN tourists t ON tours.id = t.tour_id
LEFT JOIN countries c ON t.country_id = c.id

ORDER BY tourist_id, tour_id;
