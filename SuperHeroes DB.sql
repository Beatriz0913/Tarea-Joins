CREATE DATABASE SuperHeroes
use SuperHeroes
CREATE TABLE SuperHeroes (
  idSuperHeroe INT PRIMARY KEY,
  nombreSuperHeroe VARCHAR(100),
  superpoder VARCHAR(100),
  atributo VARCHAR(100),
  genero VARCHAR(20),
  colorOjos VARCHAR(20),
  colorTraje VARCHAR(20),
  colorPelo VARCHAR(20),
  origen VARCHAR(100),
  alignment VARCHAR(20)
);
INSERT INTO SuperHeroes (idSuperHeroe, nombreSuperHeroe, superpoder, atributo, genero, colorOjos, colorTraje, colorPelo, origen, alignment)
VALUES
  (1, 'Superman', 'Super strength', 'Strength', 'Male', 'Blue', 'Red', 'Black', 'Kryptonian', 'Good'),
  (2, 'Wonder Woman', 'Lasso of Truth', 'Combat skills', 'Female', 'Blue', 'Red', 'Black', 'Amazonian', 'Good'),
  (3, 'Spider-Man', 'Wall-crawling', 'Agility', 'Male', 'Hazel', 'Red and Blue', 'Brown', 'Human', 'Good'),
  (4, 'Batman', 'Utility belt', 'Intelligence', 'Male', 'Brown', 'Black', 'Black', 'Human', 'Good'),
  (5, 'Thor', 'Mjolnir', 'God-like strength', 'Male', 'Blue', 'Red and Silver', 'Blond', 'Asgardian', 'Good'),
  (6, 'Black Widow', 'Espionage', 'Agility', 'Female', 'Green', 'Black', 'Red', 'Human', 'Good'),
  (7, 'Hulk', 'Superhuman strength', 'Strength', 'Male', 'Green', 'Purple', 'Green', 'Human', 'Good'),
  (8, 'Captain America', 'Shield', 'Enhanced strength', 'Male', 'Blue', 'Red, White and Blue', 'Blond', 'Human', 'Good'),
  (9, 'Storm', 'Weather manipulation', 'Elemental control', 'Female', 'Blue', 'Black', 'White', 'Mutant', 'Good'),
  (10, 'Wolverine', 'Regeneration', 'Healing factor', 'Male', 'Blue', 'Yellow and Blue', 'Black', 'Mutant', 'Good');

  select *from SuperHeroes

----Mostrar una lista de los superpoderes que tiene cada Super Heroe----

SELECT sh.nombreSuperHeroe, sp.superpoder
FROM SuperHeroes sh
JOIN (
  SELECT DISTINCT idSuperHeroe, superpoder
  FROM SuperHeroes
) sp ON sh.idSuperHeroe = sp.idSuperHeroe
ORDER BY sh.nombreSuperHeroe;

---Mostrar la cantidad de superpoderes con los que cuenta cada Super Heroe----
SELECT nombreSuperHeroe, COUNT(DISTINCT superpoder) AS cantidadSuperpoderes
FROM SuperHeroes
GROUP BY nombreSuperHeroe;

---Mostrar los diez superpoderes que es mas frecuente en cada Super Heroe---
SELECT nombreSuperHeroe, superpoder, COUNT(*) AS frecuencia
FROM SuperHeroes
GROUP BY nombreSuperHeroe, superpoder
HAVING COUNT(*) >= 10
ORDER BY nombreSuperHeroe, COUNT(*) DESC;

--Mostrar los Super Heroes que no cuentan con el Atributo de Intelligence---
SELECT nombreSuperHeroe
FROM SuperHeroes
WHERE atributo <> 'Intelligence';

---Mostrar los Super Heroes que cuentan con tres o 5 Atributos---
SELECT nombreSuperHeroe
FROM SuperHeroes
GROUP BY nombreSuperHeroe
HAVING COUNT(DISTINCT atributo) IN (3, 5);

---Mostrar la lista de las mujeres que son Super Heroes---
SELECT nombreSuperHeroe
FROM SuperHeroes
WHERE genero = 'Female';

---Mostrar la lista de los colores de como se identifca un Super Heroe (color de ojos, traje y pelo)----
SELECT DISTINCT colorOjos, colorTraje, colorPelo
FROM SuperHeroes;

---Mostrar la lista de Super Heroe indicando su origen (race) y cantidad de superpoderes----
SELECT nombreSuperHeroe, origen, COUNT(DISTINCT superpoder) AS cantidadSuperpoderes
FROM SuperHeroes
GROUP BY nombreSuperHeroe, origen;

---Mostrar la cantidad de superheroes que tienen un papel de Superheroe Bueno(alignment) agrupado por cada editor(publisher)---
SELECT alignment, COUNT(*) AS cantidad_superheroes
FROM SuperHeroes
WHERE alignment = 'Good'
GROUP BY alignment;


