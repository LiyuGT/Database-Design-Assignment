CREATE SCHEMA `app`;

Use app;

CREATE TABLE IF NOT EXISTS author (
author_id INT AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
date_of_birth DATE,
PRIMARY KEY (author_id)
);

CREATE TABLE IF NOT EXISTS genre (
genre_id INT AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
PRIMARY KEY (genre_id)
);

CREATE TABLE IF NOT EXISTS songs (
song_id INT AUTO_INCREMENT,
title VARCHAR(50) NOT NULL,
duration VARCHAR(50),
is_explicit BOOL NULL DEFAULT FALSE,
cloud_link VARCHAR(255) NULL,
author_id INT NOT NULL,
genre_id INT NOT NULL,
PRIMARY KEY (song_id),
FOREIGN KEY (author_id) REFERENCES author(author_id),
FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE IF NOT EXISTS song_genre (
genre_id INT,
song_id INT,
PRIMARY KEY (genre_id,song_id),
FOREIGN KEY (song_id) REFERENCES songs(song_id),
FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE IF NOT EXISTS user (
user_id INT AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR (75) NOT NULL,
password VARCHAR (255) NOT NULL,
playlist_id int,
PRIMARY KEY (user_id),
FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id),
UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS playlist (
playlist_id INT AUTO_INCREMENT,
orders INT NOT NULL,
ranks INT NOT NULL,
song_id INT NOT NULL,
PRIMARY KEY (playlist_id),
FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

CREATE TABLE IF NOT EXISTS favorite (
favorite_id INT AUTO_INCREMENT,
user_id INT NOT NULL,
song_id INT NOT NULL,
PRIMARY KEY (favorite_id),
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

















