-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

--user table
CREATE TABLE "user"(
    "user_id" INTEGER,
    "user_name" TEXT UNIQUE NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "subscription_type" TEXT CHECK("subscription_type" IN ('free','premium')),
    "DOB" DATE ,"gender" TEXT CHECK ("gender" IN ('male','female','not to say')),
     PRIMARY KEY ("user_id"));


--artists table
CREATE TABLE "artists" (
    "artist_id" INTEGER,
    "artist_name" TEXT NOT NULL ,
    PRIMARY KEY ("artist_id"));


--albums table
CREATE TABLE "albums" (
    "album_id" INTEGER,
    "album_name" TEXT NOT NULL ,
    "artist_id" INTEGER ,
    "released" INTEGER NOT NULL ,
     PRIMARY KEY ("album_id"),
     FOREIGN KEY ("artist_id") REFERENCES "artists"("artist_id"));


--songs table
CREATE TABLE "songs" (
    "song_id" INTEGER,
    "song_name" TEXT NOT NULL ,
    "artist_id" INTEGER ,
    "album_id" INTEGER ,
    "duration" TEXT NOT NULL,
    PRIMARY KEY ("song_id"),
    FOREIGN KEY ("artist_id") REFERENCES "artists"("artist_id"),
    FOREIGN KEY ("album_id") REFERENCES "albums"("album_id"));


--playlists table
CREATE TABLE "playlists"(
    "playlist_id" INTEGER,
    "playlist_name" TEXT NOT NULL ,
    "user_id" INTEGER ,
    "prefer" TEXT CHECK("prefer" IN ('public','private')),
     PRIMARY KEY ("playlist_id"),
     FOREIGN KEY ("user_id") REFERENCES "user"("user_id"));


--playlist_songs table
CREATE TABLE "playlist_songs"(
    "playlist_id" INTEGER,
    "song_id" INTEGER ,
    PRIMARY KEY ("playlist_id","song_id"),
    FOREIGN KEY ("playlist_id") REFERENCES "playlists"("playlist_id"),
    FOREIGN KEY ("song_id") REFERENCES "songs"("song_id"));




-- Create indexes to speed common searches

CREATE INDEX "idx_song_name" ON "songs" ("song_name");

CREATE INDEX "idx_prefer" ON "playlists" ("prefer");

CREATE INDEX "idx_playlist_id" ON "playlist_songs" ("playlist_id");

CREATE INDEX "idx_artist_id" ON "songs"("artist_id");

CREATE INDEX "idx_album_id" ON "songs"("album_id");

CREATE INDEX "idx_user_email" ON "user" ("email");

CREATE INDEX "idx_albums_released" ON "albums" ("released");

CREATE INDEX "idx_artist_name" ON "artists" ("artist_name");

--create a view that shows information

CREATE VIEW playlist_details AS
SELECT
    p.playlist_id,
    p.playlist_name,
    u.user_name AS creator,
    s.song_id,
    s.song_name,
    a.artist_name,
    al.album_name,
    s.duration
FROM
    playlists p
JOIN playlist_songs ps ON p.playlist_id = ps.playlist_id
JOIN songs s ON ps.song_id = s.song_id
JOIN artists a ON s.artist_id = a.artist_id
JOIN albums al ON s.album_id = al.album_id
JOIN user u ON p.user_id = u.user_id;



CREATE VIEW public_playlists AS
SELECT
    p.playlist_id,
    p.playlist_name,
    u.user_name AS creator,
    p.prefer
FROM
    playlists p
JOIN user u ON p.user_id = u.user_id
WHERE
    p.prefer = 'public';

