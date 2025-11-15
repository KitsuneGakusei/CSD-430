CREATE DATABASE IF NOT EXISTS CSD430;
USE CSD430;

CREATE USER IF NOT EXISTS 'student1'@'localhost' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON CSD430.* TO 'student1'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS Crystal_Movies_data (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    release_year YEAR NOT NULL,
    mpaa_rating VARCHAR(10) NOT NULL,
    runtime_minutes SMALLINT NOT NULL
);

INSERT INTO Crystal_Movies_data
    (title, genre, release_year, mpaa_rating, runtime_minutes)
VALUES
    ('Spirited Away',               'Animation',      2001, 'PG',     125),
    ('Howl''s Moving Castle',       'Fantasy',         2004, 'PG',     119),
    ('Kiki''s Delivery Service',    'Animation',      1989, 'G',       103),
    ('Fantastic Beasts',            'Fantasy',         2016, 'PG-13',  133),
    ('Now You See Me',              'Thriller',        2013, 'PG-13',  115),
    ('Lilo & Stitch',               'Animation',       2002, 'PG',      85),
    ('Demon Hunters',               'Action',          2024, 'PG-13',  142),
    ('Toy Story',                   'Animation',       1995, 'G',       81),
    ('The Quintessential Quintuplets', 'Romance',     2023, 'PG-13',  136),
    ('Pokémon 2000',                'Animation',       2000, 'G',       84);

SELECT * FROM Crystal_Movies_data;
