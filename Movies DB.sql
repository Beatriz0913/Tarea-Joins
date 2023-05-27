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
    (1, 'Titanic', 195, 'Drama', 'Espa�ol', 'James Cameron', 1997),
    (2, 'El Padrino', 175, 'Drama', 'Espa�ol', 'Francis Ford Coppola', 1972),
    (3, 'La La Land', 128, 'Musical', 'Ingl�s', 'Damien Chazelle', 2016),
    (4, 'El Laberinto del Fauno', 118, 'Espa�ol', 'Espa�ol', 'Guillermo del Toro', 2006),
    (5, 'Pulp Fiction', 154, 'Crimen', 'Ingl�s', 'Quentin Tarantino', 1994),
    (6, 'Am�lie', 122, 'Comedia rom�ntica', 'Franc�s', 'Jean-Pierre Jeunet', 2001);


--Mostrar la lista de todas las peliculas indicando si esta en Idioma espa�ol o no
SELECT Titulo, CASE WHEN Idioma = 'Espa�ol' THEN 'S�' ELSE 'No' END AS En_Espa�ol
FROM Peliculas;

--Mostrar el genero(drama, accion, terror, etc) de cada pelicula
SELECT Titulo, Genero FROM Peliculas;

--Mostrar la cantidad de idiomas en los que se dobla cada pelicula
SELECT Titulo, COUNT(Idioma) AS CantidadIdiomas FROM Peliculas GROUP BY Titulo;
