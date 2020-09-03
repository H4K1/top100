CREATE DATABASE peliculas;


CREATE TABLE peliculas(id SERIAL PRIMARY KEY, pelicula VARCHAR(200), año_estreno INT, director VARCHAR(40));

\copy peliculas FROM '~/Documentos/psql/desafios/top100/peliculas.csv' csv header;    

CREATE TABLE reparto(id INT, nombre VARCHAR(50));

ALTER TABLE reparto ADD FOREIGN KEY(id) REFERENCES peliculas(id);

\copy reparto FROM '~/Documentos/psql/desafios/top100/reparto.csv' csv header;

-- Titanic
select *, reparto.nombre from peliculas INNER JOIN reparto ON peliculas.id=reparto.id where peliculas.id=2;

-- Harrison ford
select peliculas.pelicula, reparto.nombre from peliculas INNER JOIN reparto ON peliculas.id=reparto.id where reparto.nombre='Harrison Ford';


-- listar top 10 directores, no me queda muy claro que habia que hacer. 

select director, count(pelicula) AS peliculas from peliculas where director IN(select director from peliculas limit 10) group by director;


-- cantidad de directores
select count(distinct director) AS cantidad_directores from peliculas;

-- peliculas enrte 1990 y 1990
select peliculas from peliculas where año_estreno > 1889 and año_estreno < 2000 ORDER BY pelicula;

-- peliculas 2001

select peliculas.pelicula, reparto.nombre from peliculas FULL JOIN reparto ON peliculas.id=reparto.id where año_estreno=2001;

-- listar actores peli mas nueva

SELECT reparto.nombre, peliculas.pelicula FROM peliculas INNER JOIN reparto ON peliculas.id=reparto.id where año_estreno=2008 limit 22;

