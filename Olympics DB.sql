CREATE DATABASE Olympics_DB
use Olympics_DB
CREATE TABLE Medallas (
  Deporte VARCHAR(50),
  Tipo_Medalla VARCHAR(20),
  Ganador VARCHAR(100)
);



INSERT INTO Medallas (Deporte, Tipo_Medalla, Ganador)
VALUES ('F�tbol', 'Oro', 'Equipo Brasil'),
       ('F�tbol', 'Plata', 'Equipo Francia'),
       ('F�tbol', 'Bronce', 'Equipo Belgica'),
       ('Baloncesto', 'Oro', 'Equipo de Espa�a'),
       ('Baloncesto', 'Plata', 'Equipo de Argentina'),
       ('Golf', 'Oro', 'Xander Schauffele'),
       ('Golf', 'Bronce', ' Paul Casey'),
       ('Golf', 'Plata', 'Rory Sabbatini ');

---Mostrar la lista de los ganadores de medalla de oro en eventos de Futbol, Baloncesto y Golf
SELECT Ganador
FROM Medallas
WHERE Deporte IN ('F�tbol', 'Baloncesto', 'Golf') AND Tipo_Medalla = 'Oro';

 


---Cuales son los eventos que se jugaron en el a�o 2000
CREATE TABLE Eventos_Olimpicos (
  Evento VARCHAR(100),
  A�o INT
);
INSERT INTO Eventos_Olimpicos (Evento, A�o)
VALUES
  ('Juegos Ol�mpicos de Verano', 2000),
  ('Juegos Ol�mpicos de Invierno', 2000),
  ('Juegos Paral�mpicos de Verano', 2000),
  ('Juegos Paral�mpicos de Invierno', 2000);
  
  SELECT Evento
FROM Eventos_Olimpicos
WHERE A�o = 2000;

---Cuales son las 20 principales ciudades donde se han jugado mas Olimpiadas
CREATE TABLE Ciudades_Olimpiadas (
  Ciudad VARCHAR(100),
  Evento VARCHAR(100),
  A�o INT
);

INSERT INTO Ciudades_Olimpiadas (Ciudad, Evento, A�o)
VALUES
  ('Atenas', 'Juegos Ol�mpicos de Verano', 1896),
  ('Par�s', 'Juegos Ol�mpicos de Verano', 1900),
  ('San Luis', 'Juegos Ol�mpicos de Verano', 1904),
  ('Londres', 'Juegos Ol�mpicos de Verano', 1908),
  ('Estocolmo', 'Juegos Ol�mpicos de Verano', 1912),
  ('Amberes', 'Juegos Ol�mpicos de Verano', 1920),
  ('Par�s', 'Juegos Ol�mpicos de Verano', 1924),
  ('�msterdam', 'Juegos Ol�mpicos de Verano', 1928),
  ('Los �ngeles', 'Juegos Ol�mpicos de Verano', 1932),
  ('Berl�n', 'Juegos Ol�mpicos de Verano', 1936),
  ('Londres', 'Juegos Ol�mpicos de Verano', 1948),
  ('Helsinki', 'Juegos Ol�mpicos de Verano', 1952),
  ('Melbourne', 'Juegos Ol�mpicos de Verano', 1956),
  ('Roma', 'Juegos Ol�mpicos de Verano', 1960),
  ('Tokio', 'Juegos Ol�mpicos de Verano', 1964),
  ('M�xico', 'Juegos Ol�mpicos de Verano', 1968),
  ('M�nich', 'Juegos Ol�mpicos de Verano', 1972),
  ('Montreal', 'Juegos Ol�mpicos de Verano', 1976),
  ('Mosc�', 'Juegos Ol�mpicos de Verano', 1980),
  ('Los �ngeles', 'Juegos Ol�mpicos de Verano', 1984),
  ('Se�l', 'Juegos Ol�mpicos de Verano', 1988),
  ('Barcelona', 'Juegos Ol�mpicos de Verano', 1992),
  ('Atlanta', 'Juegos Ol�mpicos de Verano', 1996),
  ('S�dney', 'Juegos Ol�mpicos de Verano', 2000);
 
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
       (5, 'Jap�n'),
       (6, 'Brasil'),
       (7, 'M�xico'),
       (8, 'Australia'),
       (9, 'Canad�'),
       (10, 'Italia');

INSERT INTO Participantes (Participantes_ID, Nombre, Olimpiada)
VALUES (1, 'John Smith', 2020),
       (2, 'Maria L�pez', 2016),
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
(1, 'Juegos Ol�mpicos de Verano 2020', '2021-07-23', '2021-08-08', 'Tokio, Jap�n', 11000,'Futbol'),
(2, 'Juegos Ol�mpicos de Invierno 2022', '2022-02-04', '2022-02-20', 'Beijing, China', 3000,'Golf'),
(3, 'Juegos Ol�mpicos de Verano 2024', '2024-07-26', '2024-08-11', 'Par�s, Francia', 9000,'Baloncesto');

INSERT INTO ParticipantesP(ParticipanteIDP, NombreP, EdadP, PaisP, EventoIDP)
VALUES
(1, 'John Smith', 25, 'Estados Unidos', 1),
(2, 'Emma Johnson', 28, 'Canad�', 1),
(3, 'Carlos Garc�a', 30, 'Espa�a', 1),
(4, 'Sophie Martin', 23, 'Francia', 2),
(5, 'Liu Wei', 27, 'China', 2),
(6, 'Marta L�pez', 31, 'Espa�a', 3),
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
