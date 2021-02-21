CREATE DATABASE ACADEMIA_IDIOMAS;
USE ACADEMIA_IDIOMAS;

/* 1.- Generar las siguientes tablas para guardar esta información */
CREATE TABLE PROFESORES (
NOMBRE VARCHAR(20) UNIQUE,
APELLIDO1 VARCHAR(20) UNIQUE,
APELLIDO2 VARCHAR(20) UNIQUE,
DNI VARCHAR(9) PRIMARY KEY,
DIRECCION VARCHAR(40),
TITULO VARCHAR(20),
GANA INT NOT NULL
);

CREATE TABLE CURSOS (
NOMBRE_CURSO VARCHAR(20) UNIQUE,
COD_CURSO INT PRIMARY KEY,
DNI_PROFESOR VARCHAR(9),
MAXIMO_ALUMNOS INT,
FECHA_INICIO DATE,
FECHA_FIN DATE,
NUM_HORAS INT NOT NULL,
CONSTRAINT CHK_FECHA
CHECK (FECHA_FIN >= FECHA_INICIO),
CONSTRAINT FK_CURSOS_PROFESORES
FOREIGN KEY (DNI_PROFESOR)
REFERENCES PROFESORES(DNI) 
); 

CREATE TABLE ALUMNOS (
NOMBRE VARCHAR(20),
APELLIDO1 VARCHAR (20),
APELLIDO2 VARCHAR (20),
DNI VARCHAR(9) PRIMARY KEY,
DIRECCION VARCHAR (40),
SEXO VARCHAR(1),
FECHA_NACIMIENTO DATE,
CURSO INT NOT NULL,
CONSTRAINT CHK_SEXO
CHECK (SEXO = "M" OR SEXO = "H"),
CONSTRAINT FK_ALUMNOS_CURSOS
FOREIGN KEY (CURSO)
REFERENCES CURSOS(COD_CURSO)
);

/* 2.- Insertar las siguientes tuplas */
INSERT INTO PROFESORES
VALUES ("Juan", "Arch", "López", 32432455, "Puerta Negra, 4", "Ing. Informática", 7500);

INSERT INTO PROFESORES
VALUES ("María", "Oliva", "Rubio", 43215643, "Juan Alfonso 32", "Lda. Fil. Inglesa", 5400);

/* El formato para añadir fechas en Mysql es numérico por lo que cambiaremos la fecha a su valor numérico y las ordenaremos para que las acepte */

INSERT INTO CURSOS
VALUES ("Inglés Básico", 1, 43215643, 15, "00-11-01", "00-12-22", 120);

INSERT INTO CURSOS (NOMBRE_CURSO, COD_CURSO, DNI_PROFESOR, FECHA_INICIO, NUM_HORAS)
VALUES ("Administración Linux", 2, 32432455, "00-09-01", 80);

/* Añadimos el sexo de los hombres como H y no V por el constraint que hicimos antes */

INSERT INTO ALUMNOS
VALUES ("Lucas", "Manilva", "López", "123523", "Alhamar 3", "H", "1979-11-01", 1);

INSERT INTO ALUMNOS (NOMBRE, APELLIDO1, APELLIDO2, DNI, DIRECCION, SEXO, CURSO)
VALUES ("Antonia", "López", "Alcantara", "2567567", "Maniquí 21", "M", 2);

INSERT INTO ALUMNOS (NOMBRE, APELLIDO1, APELLIDO2, DNI, DIRECCION, CURSO)
VALUES ("Manuel", "Alcantara", "Pedrós", 3123689, "Julian 2", 2);

INSERT INTO ALUMNOS
VALUES ("José", "Pérez", "Caballar", 4896765, "Jarcha 5", "H", "1977-02-03", 1);

/* 3.-  Insertar la siguiente tupla en ALUMNOS */

/* Al insertar la tabla nos salta el primer error, el campo curso no tiene valor (ni valor por defecto), así que toca añadirselo */
/* Al volverlo a intentar nos salta el check de sexo ya que intentamos introducir el valor P mientras que solo acepta H y M, lo cambiaremos por H */
/* Hay un conflicto con la PK, ya existe en otro usuario, la modificaremos para que entre el valor */

INSERT INTO ALUMNOS (NOMBRE, APELLIDO1, APELLIDO2, DNI, SEXO, CURSO)
VALUES ("Sergio", "Navas", "Retal", "1235231", "H", 1);

/* 4.- Añadir el campo edad de tipo numérico a la tabla PROFESORES */
ALTER TABLE PROFESORES ADD COLUMN EDAD INT;

/* 5.- Añadir las siguientes restricciones */
/* La edad de los profesores está entre 18 y 65 años */

ALTER TABLE PROFESORES ADD CONSTRAINT CHK_EDAD_PROFESORES CHECK (EDAD >= 18 OR EDAD <= 65);

/* No se puede añadir un curso si su número de alumnos máximo es menor que 10 */

ALTER TABLE CURSOS ADD CONSTRAINT CHK_NUM_ALUMNOS_CURSO CHECK (MAXIMO_ALUMNOS >= 10);

/* El número de horas de los cursos debe ser mayor que 100 */

/* Ya tenemos un valor en la tabla que incumple el constraint que queremos añadir, asi que o lo modificamos o eliminamos ese registro, yo voy a modificarlo */
UPDATE CURSOS SET NUM_HORAS = 101 WHERE NUM_HORAS <= 100;
ALTER TABLE CURSOS ADD CONSTRAINT CHK_NUM_HORAS CHECK (NUM_HORAS > 100);

/* 6.- Eliminar la restricción que controla los valores permitidos para el atributo sexo. */
ALTER TABLE ALUMNOS DROP CHECK CHK_SEXO;

/* 7. Se dice que cada alumno ha de estar matriculado en un solo curso. ¿Esto quiere decir que el atributo CURSO de la tabla ALUMNOS ha de ser UNIQUE? */
/* No, si hiciesemos eso sólo podriamos tener tantos registros como cursos tuviesemos activos (Lo que seria lo mismo que tendriamos solo 1 persona por curso), para conseguir eso tenemos que hacer que el valor que no se 
repite sea unico y eso lo conseguimos con la PK (automaticamente asigna el atributo UNIQUE), para registrar los alumnos en mas de un curso necesitariamos una tabla intermedia entre cursos y alumnos */

/* 8.- Eliminar la restricción de tipo NOT NULL del atributo GANA */
ALTER TABLE PROFESORES MODIFY GANA INT;

/* 9.- Insertar restricción no nula en el campo FECHA_INICO de CURSOS */
ALTER TABLE CURSOS MODIFY FECHA_INICIO DATE NOT NULL;

/* 10.- Cambiar la clave primaria de Profesor al nombre y apellidos. */
ALTER TABLE CURSOS DROP FOREIGN KEY FK_CURSOS_PROFESORES;
ALTER TABLE PROFESORES DROP PRIMARY KEY;
ALTER TABLE PROFESORES ADD CONSTRAINT PK_PROFESORES PRIMARY KEY (NOMBRE, APELLIDO1, APELLIDO2);

/* 11.- Insertar las siguientes tupla en profesores y alumnos */
/* Tenemos que acordarnos que hemos añadido el campo edad, por lo que tendremos que especificar todos los valores, no como antes */
/* La PK se repite, por lo que hay que variar uno de los 3 campos para que se acepte la PK */
/* Se habia colocado todos los valores en UNIQUE, asi que hay que variar los 3 campos o quitarle el UNIQUE, voy a quitarle el UNIQUE para que lo acepte de forma mas sencilla */
ALTER TABLE PROFESORES DROP INDEX NOMBRE;
ALTER TABLE PROFESORES DROP INDEX APELLIDO1;
ALTER TABLE PROFESORES DROP INDEX APELLIDO2;
INSERT INTO PROFESORES (NOMBRE, APELLIDO1, APELLIDO2, DNI, DIRECCION, TITULO, GANA)
VALUES ("Juan", "Arch", "López2", 32432455, "Puerta Negra, 4", "Ing. Informática", NULL);

/* 12.- La fecha de nacimiento de Antonia López está equivocada. La verdadera es 23 de diciembre de 1976 */
UPDATE ALUMNOS SET FECHA_NACIMIENTO = "1976-12-23"
WHERE NOMBRE = "Antonia" AND APELLIDO1 = "López";

/* 13.- Cambiar a Antonia López al curso de código 5. */
/* No tenim cap curs que tingui la ID 5 per tant no podem asignar aquest valor a la taula, per tant generarem aquest registre a la taula de cursos per que pugui accedir */
INSERT INTO CURSOS (COD_CURSO, FECHA_INICIO, NUM_HORAS) VALUES (5, NOW(), 101);
UPDATE ALUMNOS SET CURSO = 5 WHERE NOMBRE = "Antonia" AND APELLIDO1 = "López";

/* 14.- Eliminar la profesora Laura Jiménez. */
DELETE FROM PROFESORES
WHERE NOMBRE = "Laura" AND APELLIDO1 = "Jiménez";

/* 15.- Crear una tabla de uso temporal llamada NOMBRE DE ALUMNOS que tenga un solo atributo (NOMBRE_COMPLETO) de tipo cadena de caracteres y con el contenido de la tabla alumnos en esos campos. */
CREATE TEMPORARY TABLE NOMBRE_DE_ALUMNOS 
SELECT CONCAT(NOMBRE, APELLIDO1, APELLIDO2) AS "NOMBRE_COMPLETO" FROM ALUMNOS;

/* 16.- Borrar las tablas. */
DROP TABLE ALUMNOS;
DROP TABLE CURSOS;
DROP TABLE PROFESORES;
DROP TEMPORARY TABLE NOMBRE_DE_ALUMNOS;