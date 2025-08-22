#1
SELECT t.first_name, c.country_name
FROM tourists t
INNER JOIN countries c ON c.id = t.country_id;
