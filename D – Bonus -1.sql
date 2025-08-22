#1
CREATE TABLE tourists (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    passport_number TEXT UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL,
    gender TEXT CHECK(gender IN ('Male', 'Female', 'Other')) NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT UNIQUE NOT NULL,
    country_id INTEGER NOT NULL,
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

#2
CREATE TABLE tourists (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    passport_number TEXT UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL,
    gender TEXT CHECK(gender IN ('Male', 'Female', 'Other')) NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT UNIQUE NOT NULL,
    country_id INTEGER NOT NULL,
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

#3
INSERT INTO tourist_tours (tourist_id, tour_id) VALUES
(1, 1),
(2, 3),
(3, 6),
(4, 4),
(5, 11),
(6, 6),
(7, 11),
(8, 10),
(9, 5),
(10, 9),
(11, 4),
(12, 8),
(13, 7),
(14, 10),
(15, 5),
(16, 7),
(17, 3),
(18, 10),
(19, 3),
(20, 6);
