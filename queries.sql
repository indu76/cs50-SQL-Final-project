-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database


-- Inserting a new user into the Users table
INSERT INTO "user" ("user_name", "email", "password", "subscription_type", "DOB", "gender")
VALUES ('elsa', 'esa2@gmail.com', 'es#134', 'free', '2007-03-10', 'female'),
('sam','samy@gmail.com','sam@41','free','2002-06-12','male'),
('maron', 'maro@gmail.com', 'pan04', 'premium' , '2007-10-05', 'male'),
('Jane', 'jane12@gmail.com', 'jane#34', 'premium', '1999-03-05', 'male'),
('doe','doe@gmail.com','doe$21','free','2000-01-12','female'),
('melodic', 'hash@gmail.com', 'melo#4', 'premium' , '2005-05-05', 'female');


-- Inserting a new artist into the Artists table
INSERT INTO "artists" ("artist_name")
VALUES ('Taylor swift'),
('Ruth B'),
('Indila'),
('Stephen sanchez'),
('Maroon 5'),
('Ed sheeran');



-- Inserting a new album into the Albums table
INSERT INTO "albums" ("album_name","artist_id","released")
VALUES ('Lover','1','2019'),
('Safe Haven','2','2017'),
('Mini world','3','2014'),
('Angel Face','4','2022'),
('Jordi','5','2021'),
('Red pill blues','5','2017'),
('Divide','6','2017');



-- Inserting a new song into the Songs table
 INSERT INTO "songs"("song_name","artist_id","album_id","duration")
 VALUES ('Lover',1,1,'3:41'),
 ('Dandelions',2,2,'3:54'),
 ('Love story',3,3,'5:16'),
 ('Until i found you',4,4,'2:56'),
 ('Memories',5,5,'3:09'),
 ('Girls like you',5,6,'3:35'),
 ('Perfect',6,7,'4:23');



-- Inserting a new playlist into the Playlists table
INSERT INTO "playlists" ("playlist_name","user_id","prefer")
VALUES ('fav','1','private'),
('Haven','2','public'),
('best of love','3','public'),
('Angel','3','private'),
('favor','4','private'),
('love','6','public');



-- Inserting a new entry into the PlaylistSongs table
INSERT INTO "playlist_songs" ("playlist_id", "song_id")
VALUES ('1','1'),
 ('1','2'),
 ('1','3'),
 ('4','3'),
 ('5','2'),
 ('6','7');





-- SELECT queries

-- Retrieve all users
SELECT * FROM user;

-- Get details of a specific song
SELECT * FROM songs WHERE song_name = 'Lover';

-- Find public playlists
SELECT * FROM playlists WHERE prefer = 'public';


-- list of all songs name along with artist and album name
SELECT songs.song_name, artists.artist_name, albums.album_name
FROM "songs"
JOIN "artists" ON songs.artist_id = artists.artist_id
JOIN "albums" ON songs.album_id = albums.album_id;


--list of all playlist_name with songs
SELECT playlists.playlist_name, songs.song_name
FROM "playlists"
JOIN "playlist_songs" ON playlists.playlist_id = playlist_songs.playlist_id
JOIN "songs" ON playlist_songs.song_id = songs.song_id;

--  INSERT queries

-- Add a new user
INSERT INTO user (user_name, email, password, subscription_type, DOB, gender)
VALUES ('rose', 'rosy@gmail.com', 'securepwd', 'free', '2002-07-10', 'female');

-- Create a new song
INSERT INTO songs (song_name, artist_id, album_id, duration)
VALUES ('Cruel summer',1, 1, '2:59');

-- Add a song to a playlist
INSERT INTO playlist_songs (playlist_id, song_id)
VALUES (1, 4);

-- UPDATE query

-- Update playlist name
UPDATE playlists SET playlist_name = 'Favorites' WHERE playlist_id = 1;

-- DELETE query

-- Remove a song from a playlist
DELETE FROM playlist_songs WHERE playlist_id = 2 AND song_id = 3;
