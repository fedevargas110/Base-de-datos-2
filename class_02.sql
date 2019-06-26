-- 1 Create a new database called imdb
-- 2 Create tables: film (film_id, title, description, release_year);
-- actor (actor_id, first_name, last_name) , film_actor (actor_id, film_id)
	-- Use autoincrement id
	-- Create PKs
-- 3 Alter table add column last_update to film and actor
-- 4 Alter table add foreign keys to film_actor table 
-- 5 Insert some actors, films and who acted in each film

CREATE DATABASE imdb;
USE imdb;

CREATE TABLE films(
	film_id int NOT NULL AUTO_INCREMENT,
	titulo varchar (250),
	descripcion varchar (250),
	release_year date,
	CONSTRAINT pk_film PRIMARY KEY (film_id)
);

CREATE TABLE actor(
	actor_id int NOT NULL AUTO_INCREMENT,
	first_name varchar (250),
	last_name varchar (250),
	CONSTRAINT pk_actor PRIMARY KEY (actor_id)
);

CREATE TABLE film_actor(
	film_id int NOT NULL,
	actor_id int NOT NULL,
	FOREIGN KEY (film_id) REFERENCES films(film_id),
	FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
);

ALTER TABLE films ADD last_update date;
ALTER TABLE actor ADD last_update date;

INSERT INTO imdb.actor
(first_name, last_name, last_update)
VALUES('Scarlet', 'Antonel', '2011-03-30');

INSERT INTO imdb.films
(titulo, descripcion, release_year, last_update)
VALUES('Mowgli', 'muy buena ndeaah', '2001-03-30', '2010-03-30');