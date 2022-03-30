
--Crear una base de datos llamada películas.
CREATE DATABASE peliculas;

\c peliculas;

CREATE TABLE peliculas(id_pelicula SERIAL, pelicula VARCHAR(100),    anio_estreno INTEGER, director VARCHAR(50), PRIMARY KEY (id_pelicula));

CREATE TABLE reparto(id_pelicula INTEGER, nombre_actor VARCHAR(50), FOREIGN KEY (id_pelicula) REFERENCES peliculas (id_pelicula));

--Cargar ambos archivos a su tabla correspondiente.

\copy peliculas FROM '/Users/ale/Documents/bootcamp/programacion/parte-3/2_desafio_top100/peliculas.csv' csv header; 

\copy reparto FROM '/Users/ale/Documents/bootcamp/programacion/parte-3/2_desafio_top100/reparto.csv' csv;

--Obtener el ID de la película “Titanic”.

SELECT id_pelicula FROM peliculas WHERE pelicula='Titanic';

--Listar a todos los actores que aparecen en la película "Titanic".

SELECT * FROM reparto WHERE id_pelicula='2';

--Consultar en cuántas películas del top 100 participa Harrison Ford

SELECT count(id_pelicula) FROM reparto WHERE nombre_actor='Harrison Ford';

--Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.

SELECT * FROM peliculas WHERE anio_estreno BETWEEN 1990 and 1999 ORDER BY pelicula ASC;

--Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.

SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas GROUP BY pelicula;

--Consultar cual es la longitud más grande entre todos los títulos de las películas.

SELECT MAX(LENGTH(pelicula)) FROM peliculas;