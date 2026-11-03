CREATE TABLE IF NOT EXISTS Genres (
	genre_id SERIAL PRIMARY KEY,
	genre_type VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Players (
	player_id SERIAL PRIMARY KEY,
	player_name VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS PlayersGenres (
	player_id integer references Players(player_id),
	genre_id integer references Genres(genre_id),
	constraint pk primary key (player_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(80) UNIQUE NOT null,
	album_year smallint NOT null
);

CREATE TABLE IF NOT EXISTS PlayersAlbums (
	player_id integer references Players(player_id),
	album_id integer references Albums(album_id),
	constraint pk2 primary key (player_id, album_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	track_id SERIAL PRIMARY KEY,
	album_id integer references Albums(album_id),
	track_name VARCHAR(80) UNIQUE NOT null,
	duration time NOT null
);

CREATE TABLE IF NOT EXISTS Compilations (
	compilation_id SERIAL PRIMARY KEY,
	compilation_name VARCHAR(80) UNIQUE NOT null,
	compilation_year smallint NOT null
);

CREATE TABLE IF NOT EXISTS CompilationsTracks (
	compilation_id integer references Compilations(compilation_id),
	track_id integer references Tracks(track_id),
	constraint pk3 primary key (compilation_id, track_id)
);
