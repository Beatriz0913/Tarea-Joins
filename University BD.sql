CREATE DATABASE University_BD
use University_BD
-----------------------------------------------------------------
CREATE TABLE Universidades (
    idUniversidad INT PRIMARY KEY,
    nombreUniversidad VARCHAR(100),
    idPaisU INT
);

CREATE TABLE Paises (
    idPais INT PRIMARY KEY,
    nombrePais VARCHAR(100)
);


INSERT INTO Paises (idPais, nombrePais)
VALUES (1, 'Estados Unidos'),
(2, 'Reino Unido'),
(3, 'Canad�')
;

INSERT INTO Universidades (idUniversidad, nombreUniversidad, idPaisU)
values (1, 'Universidad de Harvard',1),
(2,	'Instituto de Tecnolog?a de Massachusetts',	1),
(3,	'Universidad de Stanford',	1),	
(4,	'Universidad de Cambridge',	2),	
(5,	'Universidad de Oxford',	2),	
(6,	'Universidad de Princeton',	1),
(7,	'Universidad de Columbia',	1),
(8,	'Universidad de Chicago',	1),
(9,	'Universidad de Pensilvania',1),
(10,	'Universidad McGill', 3);

Delete from Universidades

select *from Universidades

select *from Paises

----Realizar una consulta donde pueda obtener los paises donde estan ubicadas cada universidad.----
SELECT nombreUniversidad, nombrePais
FROM Universidades
JOIN Paises  ON idPaisU = idPais;