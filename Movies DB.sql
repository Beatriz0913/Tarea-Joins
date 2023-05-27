CREATE DATABASE Movies_DB 
Use Movies_DB

CREATE TABLE Peliculas (
    idPelicula INT PRIMARY KEY,
    Titulo VARCHAR(100),
    Duracion INT,
    Genero VARCHAR(50),
    Idioma VARCHAR(50),
    Director VARCHAR(100),
    AnioEstreno INT
);
INSERT INTO Peliculas (idPelicula, Titulo, Duracion, Genero, Idioma, Director, AnioEstreno)
VALUES
    (1, 'Titanic', 195, 'Drama', 'Español', 'James Cameron', 1997),
    (2, 'El Padrino', 175, 'Drama', 'Español', 'Francis Ford Coppola', 1972),
    (3, 'La La Land', 128, 'Musical', 'Inglés', 'Damien Chazelle', 2016),
    (4, 'El Laberinto del Fauno', 118, 'Español', 'Español', 'Guillermo del Toro', 2006),
    (5, 'Pulp Fiction', 154, 'Crimen', 'Inglés', 'Quentin Tarantino', 1994),
    (6, 'Amélie', 122, 'Comedia romántica', 'Francés', 'Jean-Pierre Jeunet', 2001);


--Mostrar la lista de todas las peliculas indicando si esta en Idioma español o no
SELECT Titulo, CASE WHEN Idioma = 'Español' THEN 'Sí' ELSE 'No' END AS En_Español
FROM Peliculas;

--Mostrar el genero(drama, accion, terror, etc) de cada pelicula
SELECT Titulo, Genero FROM Peliculas;

--Mostrar la cantidad de idiomas en los que se dobla cada pelicula
SELECT Titulo, COUNT(Idioma) AS CantidadIdiomas FROM Peliculas GROUP BY Titulo;
