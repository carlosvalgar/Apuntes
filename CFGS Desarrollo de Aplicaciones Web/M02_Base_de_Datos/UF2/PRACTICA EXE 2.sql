CREATE DATABASE EMPLEADOS_EMPRESA;
USE EMPLEADOS_EMPRESA;

CREATE TABLE EMPLEADOS (
DNI INT(8) PRIMARY KEY,
NOMBRE VARCHAR(10) NOT NULL,
APELLIDO1 VARCHAR(15) NOT NULL,
APELLIDO2 VARCHAR(15),
DIRECC1 VARCHAR(25),
DIRECC2 VARCHAR(20),
CIUDAD VARCHAR(20),
MUNICIPIO VARCHAR(20),
COD_POSTAL VARCHAR(5),
SEXO CHAR(1),
FECHA_NAC DATE,
CONSTRAINT CHK_SEXO CHECK (SEXO = "H" OR SEXO = "M")
);

CREATE TABLE DEPARTAMENTOS (
DPTO_COD INT(5) PRIMARY KEY,
NOMBRE_DPTO VARCHAR(30) NOT NULL UNIQUE,
JEFE INT(8),
PRESUPUESTO FLOAT(10, 2) NOT NULL,
PRES_ACTUAL FLOAT(10, 2),
CONSTRAINT FK_DEPARTAMENTOS_JEFE FOREIGN KEY (JEFE) REFERENCES EMPLEADOS(DNI)
);

CREATE TABLE TRABAJOS (
TRABAJO_COD INT(5) PRIMARY KEY,
NOMBRE_TRAB VARCHAR(20) NOT NULL UNIQUE,
SALARIO_MIN FLOAT(10, 2) NOT NULL,
SALARIO_MAX FLOAT(10, 2) NOT NULL
);

CREATE TABLE UNIVERSIDADES (
UNIV_COD INT(5) PRIMARY KEY,
NOMBRE_UNIV VARCHAR(25) NOT NULL,
CIUDAD VARCHAR(20),
MUNICIPIO VARCHAR(2),
COD_POSTAL VARCHAR(5)
);

/* Introduzco como PK EMPLEADO_DNI + FECHA_INICIO, porque un trabajador empieza un trabajo en un momento determinado */

CREATE TABLE HISTORIAL_LABORAL (
EMPLEADO_DNI INT(8),
TRAB_COD INT(5),
FECHA_INICIO DATE,
FECHA_FIN DATE UNIQUE,
DPTO_COD INT(5),
SUPERVISOR_DNI INT(8),
CONSTRAINT PK_HISTORIAL_LABORAL PRIMARY KEY (EMPLEADO_DNI, FECHA_INICIO),
CONSTRAINT FK_HISTORIAL_LABORAL_EMPLEADO FOREIGN KEY (EMPLEADO_DNI) REFERENCES EMPLEADOS(DNI),
CONSTRAINT FK_HISTORIAL_LABORAL_TRABAJO FOREIGN KEY (TRAB_COD) REFERENCES TRABAJOS(TRABAJO_COD),
CONSTRAINT FK_HISTORIAL_LABORAL_DEPARTAMENTOS FOREIGN KEY (DPTO_COD) REFERENCES DEPARTAMENTOS(DPTO_COD)
);

/* Lo mismo que en el punto anterior, un empleado tiene un sueldo determinado en un momento, por lo que no puede comenzar a cobrar dos sueldos a la vez */

CREATE TABLE HISTORIAL_SALARIAL (
EMPLEADO_DNI INT(8),
SALARIO FLOAT(10, 2) NOT NULL,
FECHA_COMIENZO DATE, 
FECHA_FIN DATE UNIQUE,
CONSTRAINT CHK_DATE CHECK (FECHA_FIN > FECHA_COMIENZO),
CONSTRAINT PK_HISTORIAL_SALARIAL PRIMARY KEY (EMPLEADO_DNI, FECHA_COMIENZO),
CONSTRAINT FK_HISTORIAL_SALARIAL_EMPLEADO FOREIGN KEY (EMPLEADO_DNI) REFERENCES EMPLEADOS(DNI)
);

/* Como PK voy a introducir el EMPLEADO_DNI + ESPECIALIDAD porque un empleado no deberia tener una especialidad en diversos años, universidades o grados por ende, no deberia repetirse nunca*/

CREATE TABLE ESTUDIOS (
EMPLEADO_DNI INT(8),
UNIVERSIDAD INT(5),
AÑO INT,
GRADO VARCHAR(3),
ESPECIALIDAD VARCHAR(20),
CONSTRAINT PK_ESTUDIOS PRIMARY KEY (EMPLEADO_DNI, ESPECIALIDAD),
CONSTRAINT FK_ESTUDIOS_EMPLEADOS FOREIGN KEY (EMPLEADO_DNI) REFERENCES EMPLEADOS(DNI),
CONSTRAINT FK_ESTUDIOS_UNIVERSIDADES FOREIGN KEY (UNIVERSIDAD) REFERENCES UNIVERSIDADES(UNIV_COD)
);

/* 1.- Insertar dos tuplas en cada tabla, rellenando todos sus atributos y haciendo cumplir las restricciones de integridad anteriores. */
INSERT INTO EMPLEADOS 
VALUES(12345678, "Pepito", "Gamberrito", "Garcia", "Calle de la piruleta 123", "Calle del dolar", "Chupilandia", "Barrio guay", "12345", "H", "1955-7-23");
INSERT INTO EMPLEADOS 
VALUES(87654321, "Pepota", "Gamberrota", "Vuelve", "Calle del chupachups 123", "Calle del euro", "Guachilandia", "Barrio chupi", "54321", "M", "1995-12-01");

INSERT INTO DEPARTAMENTOS
VALUES (1, "Márqueting", 12345678, 980032, 346598);
INSERT INTO DEPARTAMENTOS
VALUES (2, "Producción", 12345678, 7.34, 0.23);

INSERT INTO TRABAJOS
VALUES (1, "Diseñador jefe", 1234.67, 4321.76);
INSERT INTO TRABAJOS
VALUES (2, "Diseñador mandao", 234.67, 431.76);

INSERT INTO UNIVERSIDADES
VALUES (1, "Delavida", "La Calle", "AP", 55556);
INSERT INTO UNIVERSIDADES
VALUES (2, "De leyendas", "Runaterra", "AD", 00001);

/* Introduzco valores nulos porque implica que es su salario actual */

INSERT INTO HISTORIAL_SALARIAL
VALUES (12345678, 2345.98, NOW(), NULL);
INSERT INTO HISTORIAL_SALARIAL
VALUES (87654321, 445.98, NOW(), NULL);


/* Introduzco valores nulos porque implica que ese es su puesto actual */

INSERT INTO HISTORIAL_LABORAL
VALUES (12345678, 1, NOW(), NULL, 1, 12345678);
INSERT INTO HISTORIAL_LABORAL
VALUES (87654321, 1, NOW(), NULL, 1, 12345678);

INSERT INTO ESTUDIOS
VALUES (12345678, 1, 1987, "GPH", "Microgestión");
INSERT INTO ESTUDIOS
VALUES (12345678, 2, 2010, "LOL", "Flameo y toxicidad");

/* 2.- Insertar las siguientes tuplas (las columnas que no aparecen se considerarán nulas). Si no te dejase insertar la tupla por violación de una restricción, desactívala temporalmente y vuelva a activarla */
ALTER TABLE EMPLEADOS DROP CONSTRAINT CHK_SEXO;

INSERT INTO EMPLEADOS (NOMBRE, APELLIDO1, APELLIDO2, DNI, SEXO)
VALUES ("Sergio", "Palma", "Entrena", "111222", "P");
INSERT INTO EMPLEADOS (NOMBRE, APELLIDO1, APELLIDO2, DNI, SEXO)
VALUES ("Lucia", "Ortega", "Plus", "222333", NULL);

 /* ALTER TABLE EMPLEADOS ADD CONSTRAINT CHK_SEXO CHECK (SEXO = "H" OR SEXO = "M"); */

/* Al quitar el constraint nos deja añadir sin problemas las dos tuplas sin problemas (la problematica era unicamente la que tenia el valor "P" aseignado a SEXO, pero al volver a generar la constraint nos dice que
es inválido porque tenemos un registro con la "P", así que tendriamos que cambiar la constraint (Añadiendole OR SEXO = "P"), cambiando esa parte del registro o eliminándolo */

UPDATE EMPLEADOS
SET SEXO = "H" WHERE SEXO = "P";
ALTER TABLE EMPLEADOS ADD CONSTRAINT CHK_SEXO CHECK (SEXO = "H" OR SEXO = "M");

INSERT INTO HISTORIAL_LABORAL
VALUES (111222, NULL, "1996-6-16", NULL, NULL, 222333);

/* 3.- Borra una universidad de la tabla de Universidades ¿Qué le sucede a la restricción de clave foránea (o externa) de la tabla Estudios? ¿Se sigue manteniendo? 
Altera la definición de la tabla para que se mantenga la restricción aunque se borre una universidad. */
/* DELETE FROM UNIVERSIDADES WHERE UNIV_COD = 1; */

/* Impide el borrado de ese campo por el hecho que es una FK, para mantener la restricción tendriamos que hacer que se pueda borrar en cascada */
ALTER TABLE ESTUDIOS DROP FOREIGN KEY FK_ESTUDIOS_UNIVERSIDADES;
ALTER TABLE ESTUDIOS ADD CONSTRAINT FK_ESTUDIOS_UNIVERSIDADES FOREIGN KEY (UNIVERSIDAD) REFERENCES UNIVERSIDADES(UNIV_COD) ON DELETE CASCADE;
DELETE FROM UNIVERSIDADES WHERE UNIV_COD = 1;

/* 4. Añada una restricción que obligue a que las personas de sexo masculino hayan de tener el campo Fecha de Nacimiento NOT NULL. ¿Qué ocurre con las tuplas ya introducidas? */
/* ALTER TABLE EMPLEADOS ADD CONSTRAINT CHK_HOMBRE_NACIMIENTO CHECK ((SEXO = "H" AND FECHA_NAC IS NOT NULL) OR SEXO = "M"); */

/* Sucede lo mismo que cuando reintroduciamos la constraint de sexo, no nos deja crearla porque tenemos registros que incumplen esos valores, por lo que hay que modificar esos valores para poder crearla */
UPDATE EMPLEADOS
SET FECHA_NAC = "0001-01-01" WHERE SEXO = "H" AND FECHA_NAC IS NULL;
ALTER TABLE EMPLEADOS ADD CONSTRAINT CHK_HOMBRE_NACIMIENTO CHECK ((SEXO = "H" AND FECHA_NAC IS NOT NULL) OR SEXO = "M");

/* 5.- Añada un nuevo atributo Valoración en la tabla de Empleados que indica de 1 a 10 la valoración que obtuvo el empleado en su entrevista de trabajo al iniciar su andadura en la empresa.
Ponga el valor por defecto 5 para ese campo. ¿Qué ocurreo con las tuplas que ahora existen en la tabla? Inserte una nueva tupla en empleado sin señalar ningún valor para el atributo nuevo. */
ALTER TABLE EMPLEADOS ADD COLUMN VALORACION INT(2) DEFAULT(5);

/* Al añadir esta columna todos los valores de los registros antiguos se han colocado en 5 automáticamente */
INSERT INTO EMPLEADOS (DNI, NOMBRE, APELLIDO1, APELLIDO2)
VALUES (999888, "Prueba", "Pruebines", "Pronzales");

/* También se le ha colocado el 5. */

/* 6.- Elimine la restriccción de que el atributo Nombre de la tabla empleado no puede ser nulo. */
ALTER TABLE EMPLEADOS MODIFY NOMBRE VARCHAR(10);

/* 7.-  Modificar el tipo de datos de Direcc1 de la tabla Empleados a cadena de caracteres de 40 como máximo. ¿Podría modificar el tipo de datos del atributo Código de empleado a VARCHAR(40)? 
¿Y la fecha de nacimiento convertirla a tipo cadena? */
ALTER TABLE EMPLEADOS MODIFY DIRECC1 VARCHAR(40);

/* Para modificar el DNI hay que eliminar las FK que hagan referencia al campo que queremos cambiar*/
ALTER TABLE DEPARTAMENTOS DROP FOREIGN KEY FK_DEPARTAMENTOS_JEFE;
ALTER TABLE HISTORIAL_LABORAL DROP FOREIGN KEY FK_HISTORIAL_LABORAL_EMPLEADO;
ALTER TABLE HISTORIAL_SALARIAL DROP FOREIGN KEY FK_HISTORIAL_SALARIAL_EMPLEADO;
ALTER TABLE ESTUDIOS DROP FOREIGN KEY FK_ESTUDIOS_EMPLEADOS;

/* Cambiamos el campo que queremos y todos los que se referencial a el*/
ALTER TABLE EMPLEADOS MODIFY DNI VARCHAR(40);
ALTER TABLE DEPARTAMENTOS MODIFY JEFE VARCHAR(40);
ALTER TABLE HISTORIAL_LABORAL MODIFY EMPLEADO_DNI VARCHAR(40);
ALTER TABLE HISTORIAL_SALARIAL MODIFY EMPLEADO_DNI VARCHAR(40);
ALTER TABLE ESTUDIOS MODIFY EMPLEADO_DNI VARCHAR(40);

/* Volvemos a añadir las FK */
ALTER TABLE DEPARTAMENTOS ADD CONSTRAINT FK_DEPARTAMENTOS_JEFE FOREIGN KEY (JEFE) REFERENCES EMPLEADOS(DNI);
ALTER TABLE HISTORIAL_LABORAL ADD CONSTRAINT FK_HISTORIAL_LABORAL_EMPLEADO FOREIGN KEY (EMPLEADO_DNI) REFERENCES EMPLEADOS(DNI);
ALTER TABLE HISTORIAL_SALARIAL ADD CONSTRAINT FK_HISTORIAL_SALARIAL_EMPLEADO FOREIGN KEY (EMPLEADO_DNI) REFERENCES EMPLEADOS(DNI);
ALTER TABLE ESTUDIOS ADD CONSTRAINT FK_ESTUDIOS_EMPLEADO FOREIGN KEY (EMPLEADO_DNI) REFERENCES EMPLEADOS(DNI);

ALTER TABLE EMPLEADOS MODIFY FECHA_NAC VARCHAR(10);

/* 8.- Cambiar la clave primaria de Empleados al nombre y los dos apellidos. */
/* Nos esta dando problemas al cambiarla porque esta referenciada en las FK, vamos a eliminar todas las FK antes de cambiar la PK */
ALTER TABLE DEPARTAMENTOS DROP FOREIGN KEY FK_DEPARTAMENTOS_JEFE;
ALTER TABLE HISTORIAL_LABORAL DROP FOREIGN KEY FK_HISTORIAL_LABORAL_EMPLEADO;
ALTER TABLE HISTORIAL_SALARIAL DROP FOREIGN KEY FK_HISTORIAL_SALARIAL_EMPLEADO;
ALTER TABLE ESTUDIOS DROP FOREIGN KEY FK_ESTUDIOS_EMPLEADO;

/* Eliminamos la primera PK y hacemos que la nueva sea la suma de los campos */
ALTER TABLE EMPLEADOS DROP PRIMARY KEY;
ALTER TABLE EMPLEADOS ADD CONSTRAINT PK_EMPLEADOS PRIMARY KEY (NOMBRE, APELLIDO1, APELLIDO2);

/*Añadimos un índice para que puedan seguir existiendo las FK como teniamos hasta ahora y volvemos a generar las FK */
CREATE INDEX DNI_EMPLEADOS ON EMPLEADOS(DNI);
ALTER TABLE DEPARTAMENTOS ADD CONSTRAINT FK_DEPARTAMENTOS_JEFE FOREIGN KEY (JEFE) REFERENCES EMPLEADOS(DNI);
ALTER TABLE HISTORIAL_LABORAL ADD CONSTRAINT FK_HISTORIAL_LABORAL_EMPLEADO FOREIGN KEY (EMPLEADO_DNI) REFERENCES EMPLEADOS(DNI);
ALTER TABLE HISTORIAL_SALARIAL ADD CONSTRAINT FK_HISTORIAL_SALARIAL_EMPLEADO FOREIGN KEY (EMPLEADO_DNI) REFERENCES EMPLEADOS(DNI);
ALTER TABLE ESTUDIOS ADD CONSTRAINT FK_ESTUDIOS_EMPLEADO FOREIGN KEY (EMPLEADO_DNI) REFERENCES EMPLEADOS(DNI);

/* 9.- Eliminar un empleado. ¿Qué ocurre con sus tuplas en Historial Salarial? ¿Y en Historial Laboral? */
/* DELETE FROM EMPLEADOS WHERE DNI = 12345678; */

/* No nos permite borrar las tablas por el hecho que hemos hecho FK sin borrado en cascada. Si las hacemos con borrado en cascada elimina los registros en las demas tablas */
ALTER TABLE DEPARTAMENTOS DROP CONSTRAINT FK_DEPARTAMENTOS_JEFE;
ALTER TABLE HISTORIAL_LABORAL DROP CONSTRAINT FK_HISTORIAL_LABORAL_EMPLEADO;
ALTER TABLE HISTORIAL_SALARIAL DROP CONSTRAINT FK_HISTORIAL_SALARIAL_EMPLEADO;
ALTER TABLE ESTUDIOS DROP CONSTRAINT FK_ESTUDIOS_EMPLEADO;

ALTER TABLE DEPARTAMENTOS ADD CONSTRAINT FK_DEPARTAMENTOS_JEFE FOREIGN KEY (JEFE) REFERENCES EMPLEADOS(DNI) ON DELETE CASCADE;
ALTER TABLE HISTORIAL_LABORAL ADD CONSTRAINT FK_HISTORIAL_LABORAL_EMPLEADO FOREIGN KEY (EMPLEADO_DNI) REFERENCES EMPLEADOS(DNI) ON DELETE CASCADE;
ALTER TABLE HISTORIAL_SALARIAL ADD CONSTRAINT FK_HISTORIAL_SALARIAL_EMPLEADO FOREIGN KEY (EMPLEADO_DNI) REFERENCES EMPLEADOS(DNI) ON DELETE CASCADE;
ALTER TABLE ESTUDIOS ADD CONSTRAINT FK_ESTUDIOS_EMPLEADO FOREIGN KEY (EMPLEADO_DNI) REFERENCES EMPLEADOS(DNI) ON DELETE CASCADE;

/* Además no podremos borrar el DNI si el DNI equivale al de un jefe, para ello primero hay que sacarlo de jefe del departamento */
UPDATE DEPARTAMENTOS SET JEFE = NULL WHERE JEFE = 12345678;

/* Una vez cambiado el jefe del departamento si podremos borrarlo sin problemas */
DELETE FROM EMPLEADOS WHERE DNI = 12345678;

/* 10.- Crear una nueva tabla llamada Información Universitaria que tenga el nombre y apellidos (en un solo atributo) de todos los empleados junto con la Universidad donde estudiaron. */
/* Primero vamos a introducir un registro válido para poder trabajar */
INSERT INTO ESTUDIOS
VALUES(87654321, 2, "2000", "DTA", "Superioridad moral");

CREATE TABLE INFORMACION_UNIVERSITARIA
SELECT CONCAT(EMPLEADOS.NOMBRE, " ", EMPLEADOS.APELLIDO1, " ", EMPLEADOS.APELLIDO2) AS "Nombre y apellidos", UNIVERSIDADES.NOMBRE_UNIV 
FROM EMPLEADOS
INNER JOIN ESTUDIOS ON EMPLEADOS.DNI = ESTUDIOS.EMPLEADO_DNI
INNER JOIN UNIVERSIDADES ON ESTUDIOS.UNIVERSIDAD = UNIVERSIDADES.UNIV_COD;

/* 11.- Cree una vista llamada Nombre_Empleados con el nombre y apellidos (en un solo campo nombre) de todos los empleados que son de Barcelona. */
/* Introducimos un valor que concuerde con lo que se pide en el ejercicio */
INSERT INTO EMPLEADOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, CIUDAD, MUNICIPIO)
VALUES (11223344, "Pruebarin", "Macarrón", "Kebab", "Barcelona", "Barcelona");

CREATE VIEW Nombre_Empleados AS
SELECT CONCAT(NOMBRE, " ", APELLIDO1, " ", APELLIDO2) AS "Nombre_apellidos" FROM EMPLEADOS WHERE CIUDAD = "Barcelona";

/* 12.- Cree otra vista llamada Información_Empleados que contenga el nombre y apellidos (en un solo campo nombre) y edad (no fecha de nacimiento) de cada empleado */
CREATE VIEW Informacion_Empleados AS
SELECT CONCAT(NOMBRE, " ", APELLIDO1, " ", APELLIDO2) AS "Nombre_apellidos", FORMAT(DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), FECHA_NAC)), "%Y"), 0) AS "Edad" FROM EMPLEADOS;

/* 13.- Cree otra vista sobre la anterior llamada Información_Actual que dispone de toda la información de Información_Empleados junto con el salario que está cobrando en este momento. */
CREATE VIEW Informacion_Actual AS
SELECT Informacion_empleados.*, HISTORIAL_SALARIAL.SALARIO FROM Informacion_empleados, EMPLEADOS
INNER JOIN HISTORIAL_SALARIAL ON EMPLEADOS.DNI = HISTORIAL_SALARIAL.EMPLEADO_DNI
WHERE Informacion_empleados.Nombre_apellidos = CONCAT(EMPLEADOS.NOMBRE, " ", EMPLEADOS.APELLIDO1, " ", EMPLEADOS.APELLIDO2) AND HISTORIAL_SALARIAL.FECHA_FIN IS NULL;

/* 14.-  Inserte una tupla sobre cada una de estas vistas. ¿Qué sucede? */
 /*INSERT INTO Nombre_Empleados (Nombre_apellidos)
VALUES ("Cansado Poner Nombres");

INSERT INTO Informacion_Empleados (Nombre_apellidos, Edad)
VALUES ("Lego Mister Man", 12);

INSERT INTO Informacion_Actual (Nombre_apellidos, Edad, SALARIO)
VALUES ("Juan Garcia Linares", 56, 1387.65); */

/* Nos informa que las columnas no son actualizables */

/* 15.- Borrar todas las tablas. ¿Hay que tener en cuenta las claves foráneas a la hora de borrar las tablas? */
DROP TABLE HISTORIAL_LABORAL;
DROP TABLE HISTORIAL_SALARIAL;
DROP TABLE ESTUDIOS;
DROP TABLE TRABAJOS;
DROP TABLE DEPARTAMENTOS;
DROP TABLE EMPLEADOS;
DROP TABLE UNIVERSIDADES;
DROP TABLE INFORMACION_UNIVERSITARIA;

/* Si, hay que tener en cuenta las FK al borrar la tabla, o borramos las tablas que dependen de otras primero o nos cargamos las FK*/
