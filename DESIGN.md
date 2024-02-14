# Design Document

By Indhumathi R

Video overview: https://youtu.be/uZbGgIru1WE

## Scope

### Purpose of your database:
The purpose of the database is to manage a music streaming service, including user accounts, songs, playlists, artists, and albums.

### Inclusion in Scope:
Entities included in the scope:
- Users, with details like user_id, user_name, email, password, subscription_type, DOB, gender.
- Songs, including song_id, song_name, artist_id, album_id, duration.
- Playlists, with playlist_id, playlist_name, user_id, and preference (public or private).
- Playlist-Song relationships.
- Artists, containing artist_id and artist_name.
- Albums, with album_id, album_name, artist_id, and release year.

### Exclusion from Scope:
Elements outside the scope include:
- Detailed financial transactions or user-sensitive information beyond authentication data.

## Functional Requirements

### User Abilities:
Users can:
- Register and manage their accounts.
- Browse songs, artists, and albums.
- Create, view, and manage playlists.
- Play songs.
- Explore public playlists created by other users.

### Beyond Scope:
Functionalities beyond the scope:
- Detailed financial transactions.
- Social features like friend requests or sharing playlists directly between users.

## Representation

### Entities

#### Users
- Attributes: user_id, user_name, email, password, subscription_type, DOB, gender.
- Types and Constraints:
  - user_id INTEGER PRIMARY KEY
  - user_name TEXT UNIQUE NOT NULL
  - email TEXT NOT NULL
  - password TEXT NOT NULL
  - subscription_type TEXT CHECK('free', 'premium')
  - DOB DATE
  - gender TEXT CHECK('male', 'female', 'not to say')

#### Songs
- Attributes: song_id, song_name, artist_id, album_id, duration.
- Types and Constraints:
  - song_id INTEGER PRIMARY KEY
  - song_name TEXT NOT NULL
  - artist_id INTEGER
  - album_id INTEGER
  - duration TEXT NOT NULL

#### Playlists
- Attributes: playlist_id, playlist_name, user_id, prefer.
- Types and Constraints:
  - playlist_id INTEGER PRIMARY KEY
  - playlist_name TEXT NOT NULL
  - user_id INTEGER
  - prefer TEXT CHECK('public', 'private')

#### Playlist_Songs
- Attributes: playlist_id, song_id.
- Types and Constraints:
  - playlist_id INTEGER
  - song_id INTEGER
  - PRIMARY KEY (playlist_id, song_id)

#### Artists
- Attributes: artist_id, artist_name.
- Types and Constraints:
  - artist_id INTEGER PRIMARY KEY
  - artist_name TEXT NOT NULL

#### Albums
- Attributes: album_id, album_name, artist_id, released.
- Types and Constraints:
  - album_id INTEGER PRIMARY KEY
  - album_name TEXT NOT NULL
  - artist_id INTEGER
  - released INTEGER NOT NULL

### Relationships

#### Entity Relationship Diagram (ERD):

![ER Diagram](/workspaces/128172726/project/ER Diagram.png)



#### Relationships Description:
- User - Playlist: One-to-Many relationship (One user can have many playlists).
- Song - Artist: Many-to-One relationship (Many songs can belong to one artist).
- Song - Album: Many-to-One relationship (Many songs can belong to one album).
- Playlist - Playlist_Songs: Many-to-Many relationship (Many songs can belong to many playlists).
- Playlist - User: Many-to-One relationship (Many playlists can be created by one user).


## Optimizations

### Implemented Optimizations:
- Indexes on:
  - `song_name` in the `songs` table.
  - `prefer` in the `playlists` table.
  - `playlist_id` in the `playlist_songs` table.
  - `artist_id` and `album_id` in the `songs` table.
  - `user_email` in the `user` table.
  - `released` in the `albums` table.
  - `artist_name` in the `artists` table.

### Reasons for Optimizations:
- Faster searching and sorting based on song names, playlist preferences, playlist IDs, artist IDs, album IDs, user emails, release years, and artist names.

## Limitations

### Design Limitations:
- The current schema assumes individual song submissions. Collaborative playlists or sharing of playlists are not supported in this version.

### Representation Challenges:
- Representing complex relationships, such as collaborative playlists or user collaborations on songs, may be a challenge.




