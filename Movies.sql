DROP TABLE IF EXISTS movierating;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS people;

 CREATE TABLE people (
 nameid INTEGER NOT NULL AUTO_INCREMENT , 
 firstname VARCHAR(100) NOT NULL ,
 lastname VARCHAR(100) NOT NULL , 
 PRIMARY KEY (nameid) 
 );

CREATE TABLE movies ( 
movieid INT NOT NULL AUTO_INCREMENT, 
moviename VARCHAR(100) NOT NULL, 
genre VARCHAR(10), 
director VARCHAR(20),
country VARCHAR(10),
PRIMARY KEY (movieid) 
 );

CREATE TABLE movierating (
 rateid INT NOT NULL AUTO_INCREMENT , 
 movieid INT , 
 nameid INT , 
 rating INT NULL , 
 PRIMARY KEY (rateid) ,
 FOREIGN KEY (movieid) REFERENCES movies (movieid) ON UPDATE CASCADE, 
 FOREIGN KEY (nameid) REFERENCES people (nameid) ON UPDATE CASCADE );
 
INSERT INTO people (firstname, lastname) 
VALUES ('Nicholas', 'Alexander'),
       ('Luca', 'The Pooch'), 
       ('Ambra', 'Alexander'),
       ('Daniele', 'Silvestri'),
	   ('IldeAlfonzo', 'Ramirez');
 
INSERT INTO movies (moviename, genre, director, country)
VALUES ('Twice Born', 'Drama', 'Sergio Castellitto', 'Italy'),
       ('Smetto Quando Voglio', 'Comedy', 'Sydney Sibilia', 'Italy'),
       ('The Imitation Game', 'Drama', 'Morten Tyldum', 'USA'), 
       ('Rosewater', 'Drama', 'Jon Stewart', 'USA'), 
       ('The Secret Life of Pets', '3D', 'Chris Renaud', 'USA'),
	   ('Moonrise Kingdom', 'Drama', 'Wes Anderson', 'USA') ; 
 
INSERT INTO movierating (nameid, movieid, rating) 
VALUES (1, 1, 2), 
(1, 2, 4), 
(1, 3, 5), 
(1, 4, 4),
(1, 5, 2),
(1, 6, 3),
(2, 1, 1),
(2, 2, 2),
(2, 3, 2),
(2, 4, 1),
(2, 5, 5),
(2, 6, 4),
(3, 1, 4),
(3, 2, 4),
(3, 3, 5),
(3, 4, 5),
(3, 5, 3),
(3, 6, 4),
(4, 1, 1),
(4, 2, 5),
(4, 3, 3),
(4, 4, 5),
(4, 5, 1),
(4, 6, 2),
(5, 1, 4),
(5, 2, 2),
(5, 3, 5),
(5, 4, 5),
(5, 5, 1),
(5, 6, 2);

SELECT firstname, rating, moviename, genre, director FROM people
INNER JOIN movierating 
ON people.nameid = movierating.nameid 
INNER JOIN movies 
ON movierating.movieid=movies.movieid ; 

SELECT rating, moviename FROM movies
INNER JOIN movierating
ON movierating.movieid=movies.movieid
GROUP by moviename
ORDER by avg(rating) desc;

SELECT nameid, rating, moviename FROM movies
INNER JOIN movierating
ON movierating.movieid=movies.movieid;

SELECT firstname, moviename, genre, rating FROM people
INNER JOIN movierating ON people.nameid = movierating.nameid 
INNER JOIN movies ON movierating.movieid = movies.movieid 
WHERE rating = 5 ;  