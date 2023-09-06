SHOW DATABASES;
USE albums_db;
SHOW TABLES;
SELECT * FROM albums;
-- Use the albums_db database.
-- What is the primary key for the albums table?
-- A) The primary key for the albums table is "id".
-- What does the column named 'name' represent?
-- A) The column represents the name of the album for each artist.
-- What do you think the sales column represents?
-- A) I'm sure that it represents albums sold by the millions.
-- Find the name of all albums by Pink Floyd.
SELECT name, artist FROM albums WHERE name GROUP BY artist;

-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released?

-- What is the genre for the album Nevermind?

-- Which albums were released in the 1990s?

-- Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
