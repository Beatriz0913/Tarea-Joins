CREATE DATABASE Olympics_DB
use Olympics_DB
CREATE TABLE Medallas (
  Deporte VARCHAR(50),
  Tipo_Medalla VARCHAR(20),
  Ganador VARCHAR(100)
);



INSERT INTO Medallas (Deporte, Tipo_Medalla, Ganador)
VALUES ('Fútbol', 'Oro', 'Equipo Brasil'),
       ('Fútbol', 'Plata', 'Equipo Francia'),
       ('Fútbol', 'Bronce', 'Equipo Belgica'),
       ('Baloncesto', 'Oro', 'Equipo de España'),
       ('Baloncesto', 'Plata', 'Equipo de Argentina'),
       ('Golf', 'Oro', 'Xander Schauffele'),
       ('Golf', 'Bronce', ' Paul Casey'),
       ('Golf', 'Plata', 'Rory Sabbatini ');

---Mostrar la lista de los ganadores de medalla de oro en eventos de Futbol, Baloncesto y Golf
SELECT Ganador
FROM Medallas
WHERE Deporte IN ('Fútbol', 'Baloncesto', 'Golf') AND Tipo_Medalla = 'Oro';

 


---Cuales son los eventos que se jugaron en el año 2000
CREATE TABLE Eventos_Olimpicos (
  Evento VARCHAR(100),
  Año INT
);
INSERT INTO Eventos_Olimpicos (Evento, Año)
VALUES
  ('Juegos Olímpicos de Verano', 2000),
  ('Juegos Olímpicos de Invierno', 2000),
  ('Juegos Paralímpicos de Verano', 2000),
  ('Juegos Paralímpicos de Invierno', 2000);
  
  SELECT Evento
FROM Eventos_Olimpicos
WHERE Año = 2000;

---Cuales son las 20 principales ciudades donde se han jugado mas Olimpiadas
CREATE TABLE Ciudades_Olimpiadas (
  Ciudad VARCHAR(100),
  Evento VARCHAR(100),
  Año INT
);

INSERT INTO Ciudades_Olimpiadas (Ciudad, Evento, Año)
VALUES
  ('Atenas', 'Juegos Olímpicos de Verano', 1896),
  ('París', 'Juegos Olímpicos de Verano', 1900),
  ('San Luis', 'Juegos Olímpicos de Verano', 1904),
  ('Londres', 'Juegos Olímpicos de Verano', 1908),
  ('Estocolmo', 'Juegos Olímpicos de Verano', 1912),
  ('Amberes', 'Juegos Olímpicos de Verano', 1920),
  ('París', 'Juegos Olímpicos de Verano', 1924),
  ('Ámsterdam', 'Juegos Olímpicos de Verano', 1928),
  ('Los Ángeles', 'Juegos Olímpicos de Verano', 1932),
  ('Berlín', 'Juegos Olímpicos de Verano', 1936),
  ('Londres', 'Juegos Olímpicos de Verano', 1948),
  ('Helsinki', 'Juegos Olímpicos de Verano', 1952),
  ('Melbourne', 'Juegos Olímpicos de Verano', 1956),
  ('Roma', 'Juegos Olímpicos de Verano', 1960),
  ('Tokio', 'Juegos Olímpicos de Verano', 1964),
  ('México', 'Juegos Olímpicos de Verano', 1968),
  ('Múnich', 'Juegos Olímpicos de Verano', 1972),
  ('Montreal', 'Juegos Olímpicos de Verano', 1976),
  ('Moscú', 'Juegos Olímpicos de Verano', 1980),
  ('Los Ángeles', 'Juegos Olímpicos de Verano', 1984),
  ('Seúl', 'Juegos Olímpicos de Verano', 1988),
  ('Barcelona', 'Juegos Olímpicos de Verano', 1992),
  ('Atlanta', 'Juegos Olímpicos de Verano', 1996),
  ('Sídney', 'Juegos Olímpicos de Verano', 2000);
 
SELECT Ciudad, COUNT(*) AS Total_Olimpiadas
FROM Ciudades_Olimpiadas
GROUP BY Ciudad
ORDER BY Total_Olimpiadas DESC


---Liste los paises no tienen ningun participante en las ultimas 10 olimpiadas
CREATE TABLE Paises (
 PaisID INT PRIMARY KEY,
  Paises_Nombre VARCHAR(100)
);
CREATE TABLE Participantes (
  Participantes_ID INT PRIMARY KEY,
  Nombre VARCHAR(100),
  Olimpiada INT
);


INSERT INTO Paises (PaisID, Paises_Nombre)
VALUES (1, 'Estados Unidos'),
       (2, 'China'),
       (3, 'Alemania'),
       (4, 'Francia'),
       (5, 'Japón'),
       (6, 'Brasil'),
       (7, 'México'),
       (8, 'Australia'),
       (9, 'Canadá'),
       (10, 'Italia');

INSERT INTO Participantes (Participantes_ID, Nombre, Olimpiada)
VALUES (1, 'John Smith', 2020),
       (2, 'Maria López', 2016),
       (3, 'Liu Wei', 2020),
       (4, 'Sophie Martin', 2012),
       (5, 'Carlos Hernandez', 2016),
       (6, 'Anna Schmidt', 2020),
       (7, 'Mohamed Ali', 2012),
       (8, 'Isabella Rossi', 2020),
       (9, 'Pedro Silva', 2016),
       (10, 'Emma Johnson', 2020);


SELECT Paises_Nombre
FROM Paises
LEFT JOIN Participantes ON PaisID = Participantes_ID
WHERE Participantes_ID IS NULL OR Olimpiada < (YEAR(GETDATE()) - 10)

---liste los 5 paises que mas ganan medallas de oro, plata y bronce
SELECT Paises_Nombre, SUM(CASE WHEN Medallas.Tipo_Medalla = 'Oro' THEN 1 ELSE 0 END) AS MedallasOro,
       SUM(CASE WHEN Medallas.Tipo_Medalla = 'Plata' THEN 1 ELSE 0 END) AS MedallasPlata,
       SUM(CASE WHEN Medallas.Tipo_Medalla = 'Bronce' THEN 1 ELSE 0 END) AS MedallasBronce
FROM Paises
JOIN Medallas ON PaisID = Medallas.Tipo_Medalla
GROUP BY Paises_Nombre
ORDER BY MedallasOro DESC, MedallasPlata DESC, MedallasBronce DESC
LIMIT 5;

---El evento con mayor cantidad de personas participando
CREATE TABLE Eventos (
  EventoID INT PRIMARY KEY,
  Nombre VARCHAR(100),
  FechaInicio DATE,
  FechaFin DATE,
  Lugar VARCHAR(100),
  CantidadParticipantesE INT,
  Deporte varchar(250)
);
drop table Eventos
DROP TABLE Participantes

CREATE TABLE ParticipantesP (
  ParticipanteIDP INT PRIMARY KEY,
  NombreP VARCHAR(100),
  EdadP INT,
  PaisP VARCHAR(100),
  EventoIDP INT,
  FOREIGN KEY (EventoIDP) REFERENCES Eventos(EventoID)
);
INSERT INTO Eventos (EventoID, Nombre, FechaInicio, FechaFin, Lugar, CantidadParticipantesE, Deporte)
VALUES
(1, 'Juegos Olímpicos de Verano 2020', '2021-07-23', '2021-08-08', 'Tokio, Japón', 11000,'Futbol'),
(2, 'Juegos Olímpicos de Invierno 2022', '2022-02-04', '2022-02-20', 'Beijing, China', 3000,'Golf'),
(3, 'Juegos Olímpicos de Verano 2024', '2024-07-26', '2024-08-11', 'París, Francia', 9000,'Baloncesto');

INSERT INTO ParticipantesP(ParticipanteIDP, NombreP, EdadP, PaisP, EventoIDP)
VALUES
(1, 'John Smith', 25, 'Estados Unidos', 1),
(2, 'Emma Johnson', 28, 'Canadá', 1),
(3, 'Carlos García', 30, 'España', 1),
(4, 'Sophie Martin', 23, 'Francia', 2),
(5, 'Liu Wei', 27, 'China', 2),
(6, 'Marta López', 31, 'España', 3),
(7, 'Alex Petrov', 26, 'Rusia', 3);

delete ParticipantesP
select *from ParticipantesP
SELECT Nombre AS NombreP, COUNT(ParticipanteIDP) AS CantidadParticipantesE
FROM Eventos 
INNER JOIN ParticipantesP ON EventoID = EventoIDP
GROUP BY EventoID, Nombre
ORDER BY CantidadParticipantesE DESC


---Liste los deportes que en todas las olimpiadas siempre se llevan a cabo

SELECT Deporte
FROM Eventos
GROUP BY Deporte
HAVING COUNT(DISTINCT Lugar) = (SELECT COUNT(DISTINCT Lugar) FROM Eventos);


---Muestre la comparacion de la cantidad de veces entre los dos generos(M,F) que ganado medallas de cualquier tipo
SELECT Ganador, COUNT(*) AS CantidadMedallas
FROM Medallas
GROUP BY Ganador;

---Cual es la altura y peso que mas es mas frecuente en los participantes del deporte de Boxeo
SELECT Altura, Peso, COUNT(*) AS Frecuencia
FROM Participantes
WHERE Deporte = 'Boxeo'
GROUP BY Altura, Peso
ORDER BY Frecuencia DESC


---Muestre los participantes menores de edad que participan en las olimpiadas
SELECT NombreP, EdadP
FROM ParticipantesP
WHERE EdadP < 18;
