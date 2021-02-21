/* 1.- Crear  una  base  de  datos  con  el  nombre  'Prueba  +  _Nombre  +  _Apellido'  y establecerla  como predeterminada. */
/* CREATE DATABASE Prueba_Carlos_Valenzuela;
USE Prueba_Carlos_Valenzuela

/* 2.- Crear una tabla similar a la tabla world.city con el nombre 'ciudades' con los campos */
/* CREATE TABLE ciudades (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(35),
pais VARCHAR(3),
distrito VARCHAR(30),
poblacion INT
)

/* 3.- Importar   las   ciudades   desde   world.city   que posean   una   población   de   al menos   100.000 habitantes. */
/* INSERT INTO ciudades (nombre, pais, distrito, poblacion)
SELECT Name, CountryCode, District, population FROM world.city WHERE population >= 100.000;

/* 4.- Crear una tabla similar a la tabla world.country con el nombre 'paises' y los campos */
/* CREATE TABLE paises (
codigo VARCHAR(3) PRIMARY KEY,
nombre VARCHAR(52),
continente VARCHAR(50),
region VARCHAR(50),
superficie FLOAT(10,2),
independiente INT,
poblacion INT,
esperanzavida FLOAT(3,1)
);

/* 5.- Importar todos los registros de la tabla country a la tabla paises. */
/* INSERT INTO paises
SELECT Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy FROM world.country;

/* 6.- Crear una tabla similar a la tabla world.countrylanguage con el nombre 'lenguajes' y los  campos (0,5pts) */ 
/* CREATE TABLE lenguajes (
id INT AUTO_INCREMENT PRIMARY KEY,
codigo VARCHAR(3),
lengua VARCHAR(30),
oficial VARCHAR(20),
uso FLOAT(4,1)
)

/* 7.- Importar todos los registros de la tabla. */
/* INSERT INTO lenguajes (codigo, lengua, oficial, uso)
SELECT * FROM world.countrylanguage;

/* 8.- Establecer el campo ciudades.pais como clave foránea que apunta a el campo 'codigo' de la tabla 'paises'. */
/* ALTER TABLE ciudades
ADD CONSTRAINT fkCiudadPais
FOREIGN KEY (pais)
REFERENCES paises(codigo);

/* 9.- Insertar la ciudad 'Alzira' con pais 'ESP' y habitantes 45000. */
/* INSERT INTO ciudades (nombre, pais, poblacion)
VALUES ("Alzira", "ESP", 45000);

/* 10.- Mostrar  la  cantidad  de países que  en  la  actualidad  son  independientes.  Utilizar  para  todas  las consultas la nueva base de datos (las nuevas tablas). */
/* SELECT COUNT(*) AS "Cantidad de paises independientes" FROM paises WHERE independiente IS NOT NULL;

/* 11.- Mostrar el número de ciudades con más habitantes que la media. */
/* SELECT COUNT(*) FROM ciudades WHERE poblacion > (SELECT AVG(poblacion) FROM ciudades);

/* 12 .- Mostrar el  nombre  del país,  el  nombre  de  la  ciudad  y  el  número  de  habitantes  de  las  ciudades con más de 3 millones de habitantes. */
/* SELECT paises.nombre, ciudades.nombre, ciudades.poblacion
FROM ciudades
INNER JOIN paises ON ciudades.pais = paises.codigo
WHERE ciudades.poblacion > 3000000;

/* 13.- Mostrar Países (nombre, continente y región) más pequeños y más grandes de cada continente. */
/* SELECT nombre, continente, region FROM paises WHERE superficie = (SELECT MAX(superficie) FROM paises) OR superficie = (SELECT MIN(superficie) FROM paises); */

/* 14.- Mostrar código,  nombre  de país y  población  repartida  en  ciudades  de  menos  de  100.000 habitantes (no incluidas en la tabla de ciudades). Descartar países con menos de 100.000 habitantesy los que el cálculo sea nulo. */
/* SELECT codigo, nombre, (poblacion/superficie) AS poblacionRepartida FROM paises WHERE poblacion >= 100000 AND poblacion/superficie IS NOT NULL; */

/* 15.- Mostrar nombre, continente y tamaño de los países que sean mayores a la media de su propio continente. */
/* SELECT nombre, paises.continente, superficie FROM paises
INNER JOIN (SELECT continente, AVG(superficie) superficieMedia FROM paises GROUP BY continente) x ON x.continente = paises.continente
WHERE superficie > superficieMedia;
