import os
import sqlite3

if os.path.exists('movies.db'):
    os.remove('movies.db')

conn = sqlite3.connect('movies.db')
conn.row_factory = sqlite3.Row
cursor = conn.cursor()

cursor.execute('''
CREATE TABLE movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    movie_name TEXT NOT NULL UNIQUE,
    genre TEXT NOT NULL,
    country TEXT NOT NULL,
    language TEXT NOT NULL,
    year INTEGER NOT NULL CHECK (year >= 2009),
    revenue REAL NOT NULL CHECK (revenue >= 0)
);
''')

data = [
    ('Oppenheimer', 'Biography', 'USA', 'English', 2023, 960),
    ('Barbie', 'Comedy', 'USA', 'English', 2023, 1440),
    ('Dune Part Two', 'Sci-Fi', 'USA', 'English', 2024, 700),
    ('John Wick 4', 'Action', 'USA', 'English', 2023, 440),
    ('Everything Everywhere All at Once', 'Sci-Fi', 'USA', 'English', 2022, 140),
    ('The Batman', 'Action', 'USA', 'English', 2022, 772),
    ('Spider Man No Way Home', 'Action', 'USA', 'English', 2021, 1920),
    ('Top Gun Maverick', 'Action', 'USA', 'English', 2022, 1490),
    ('The Whale', 'Drama', 'USA', 'English', 2022, 55),
    ('Guardians of the Galaxy Vol 3', 'Action', 'USA', 'English', 2023, 845),
    ('Parasite', 'Thriller', 'South Korea', 'Korean', 2019, 266),
    ('Train to Busan 2', 'Horror', 'South Korea', 'Korean', 2020, 92),
    ('Decision to Leave', 'Mystery', 'South Korea', 'Korean', 2022, 23),
    ('Joker', 'Drama', 'USA', 'English', 2019, 1074),
    ('Tenet', 'Sci-Fi', 'USA', 'English', 2020, 365),
    ('The Irishman', 'Crime', 'USA', 'English', 2019, 8),
    ('Ford v Ferrari', 'Drama', 'USA', 'English', 2019, 225),
    ('1917', 'War', 'UK', 'English', 2019, 385),
    ('The Farewell', 'Drama', 'USA', 'English/Chinese', 2019, 23),
    ('The Banshees of Inisherin', 'Comedy', 'Ireland', 'English', 2022, 49),
    ('Django Unchained', 'Western', 'USA', 'English', 2012, 426),
    ('Avengers Endgame', 'Action', 'USA', 'English', 2019, 2798),
    ('Black Panther', 'Action', 'USA', 'English', 2018, 1347),
    ('Coco', 'Animation', 'USA', 'English/Spanish', 2017, 807),
    ('Mad Max Fury Road', 'Action', 'Australia', 'English', 2015, 380),
    ('Inception', 'Sci-Fi', 'USA', 'English', 2010, 837),
    ('The Revenant', 'Adventure', 'USA', 'English', 2015, 532),
    ('La La Land', 'Musical', 'USA', 'English', 2016, 447),
    ('The Secret in Their Eyes', 'Crime', 'Argentina', 'Spanish', 2009, 34),
    ('No Time to Die', 'Action', 'UK', 'English', 2021, 774)
]

cursor.executemany('''
INSERT INTO movies (movie_name, genre, country, language, year, revenue)
VALUES (?, ?, ?, ?, ?, ?);
''', data)


# 1 show all movies
print("MOVIE DATABASE - ALL MOVIES")

cursor.execute("SELECT * FROM movies")
movies = cursor.fetchall()
for movie in movies:
    print(f"{movie['movie_name']} ({movie['year']})")
    print(f"   ID: {movie['id']} | Genre: {movie['genre']} | Country: {movie['country']} | Language: {movie['language']}")
    print(f"   Box Office: ${movie['revenue']}M")

conn.commit()


# 2 search movie script

def search_movies():
    print("\nMOVIE SEARCH")
    search_term = input("Enter movie name or keyword to search: ")

    if not search_term:
        print("Please enter a valid search term.")
        return

    cursor.execute("SELECT * FROM movies WHERE movie_name LIKE ? ORDER BY movie_name",
                   (f"%{search_term}%",))
    matching_movies = cursor.fetchall()

    if matching_movies:
        print(f"\nFound {len(matching_movies)} movie(s) matching '{search_term}':")

        for movie in matching_movies:
            print(f"{movie['movie_name']} ({movie['year']})")
            print(f"   Genre: {movie['genre']} | Country: {movie['country']} | Language: {movie['language']}")
            print(f"   Box Office: ${movie['revenue']}M | ID: {movie['id']}")
    else:
        print(f"No movies found matching '{search_term}'. Try a different search term.")

search_movies()


# 3 add new movie to DB

def add_movie():
    print("\nADD NEW MOVIE TO DATABASE")

    try:
        movie_name = input("Enter movie title: ")
        if not movie_name:
            print("Movie title cannot be empty.")
            return

        genre = input("Enter genre (Action, Drama, Comedy...): ")
        if not genre:
            print("Genre cannot be empty.")
            return

        country = input("Enter country of origin: ")
        if not country:
            print("Country cannot be empty.")
            return

        language = input("Enter primary language: ")
        if not language:
            print("Language cannot be empty.")
            return

        year = int(input("Enter release year (2009 or later): "))
        if year < 2009:
            print("Release year must be 2009 or later.")
            return

        revenue = float(input("Enter movie revenue: "))
        if revenue < 0:
            print("Revenue cannot be negative.")
            return

        cursor.execute('''
        INSERT INTO movies (movie_name, genre, country, language, year, revenue)
        VALUES (?, ?, ?, ?, ?, ?)
        ''', (movie_name, genre, country, language, year, revenue))

        conn.commit()

        print(f"SUCCESS! Movie '{movie_name}' added to the database!")

    except ValueError:
        print("Invalid input! Please enter valid numbers for year and revenue.")
    except Exception as e:
        print(f"Error occurred while adding the movie: {e}")

add_movie()

conn.close()
