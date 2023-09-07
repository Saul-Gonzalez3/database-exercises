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
SELECT * FROM albums;
SELECT name FROM albums WHERE artist = "Pink Floyd";
-- A) The Dark Side of the Moon and The Wall 
-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
SELECT * FROM albums;
SELECT release_date FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
-- A) The release year was 1967. 

-- What is the genre for the album Nevermind?
SELECT * FROM albums;
SELECT genre FROM albums WHERE name = "Nevermind";
-- A) The genre is Grunge, Alternative rock 

-- Which albums were released in the 1990s?
SELECT * FROM albums;
SELECT name FROM albums WHERE release_date > 1989 AND release_date < 2000;
-- A) The albums were: The Bodyguard, Jagged Little Pill, Come On Over, Falling into You, Let's Talk About Love, Dangerous, The Immaculate Collection, Titanic: Music from the Motion Picture, Metallica, Nevermind, and Supernatural.
 
-- Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
SELECT * FROM albums;
SELECT name AS low_selling_albums FROM albums WHERE sales < 20.0;
-- A) The albums were: Grease, Bad, Sgt. Pepper's Lonely Hearts Club Band, Dirty Dancing, Let's Talk About Love, Dangerous, The Immaculate Collection, Abbey Road, Born in the U.S.A, Brothers in Arms, Titanic, Nevermind, The Wall. 