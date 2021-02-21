CREATE DATABASE Empresa;
USE Empresa;

/* 1.- Realizar el diseño físico, determinando las claves, restricciones de cardinalidad y de integridad referencial. */

/* Añadiremos columnas de codigo en telefonos y domicilios ya que necesitamos poder registrar mas de una vez ciertos valores, también añadiremos una constraint de unique en telefonos y domicilios porque
una persona no puede tener dos veces el mismo domicilio. Lo hago así para que pueda tomar valores NULL el telefono y la calle porque sino al ser PK no aceptarian valores NULL */

CREATE TABLE empleados (
DNI VARCHAR(9) PRIMARY KEY,
Nombre VARCHAR(50),
Sueldo DECIMAL(10, 2)
);

CREATE TABLE codigosPostales (
CodigoPostal INT PRIMARY KEY,
Poblacion VARCHAR(25),
Provincia VARCHAR(25)
);

CREATE TABLE telefonos (
CodTelefono INT PRIMARY KEY AUTO_INCREMENT,
DNI VARCHAR(9),
Telefono INT,
CONSTRAINT U_telefonos UNIQUE (DNI, Telefono),
CONSTRAINT FK_telefonos_empleados FOREIGN KEY (DNI) REFERENCES empleados(DNI)
);

CREATE TABLE domicilios (
CodDomicilio INT PRIMARY KEY AUTO_INCREMENT,
DNI VARCHAR(9),
Calle VARCHAR (50),
CodigoPostal INT,
CONSTRAINT U_domicilios UNIQUE (DNI, Calle),
CONSTRAINT FK_domicilios_empleados FOREIGN KEY (DNI) REFERENCES empleados(DNI),
CONSTRAINT FK_domicilios_codigosPostales FOREIGN KEY (CodigoPostal) REFERENCES codigosPostales(CodigoPostal)
);

/* 2.- Rellenar las tablas. */
INSERT INTO empleados VALUES ("12345678A", "Antonio Arjona", 5000);
INSERT INTO empleados VALUES ("12345678C", "Carlota Cerezo", 1000);
INSERT INTO empleados VALUES ("12345678L", "Laura López", 1500);
INSERT INTO empleados VALUES ("12345678P", "Pedro Pérez", 2000);

INSERT INTO codigosPostales VALUES (8050, "Parets", "Barcelona");
INSERT INTO codigosPostales VALUES (14200, "Peñarroya", "Córdoba");
INSERT INTO codigosPostales VALUES (14900, "Lucena", "Córdoba");
INSERT INTO codigosPostales VALUES (28040, "Madrid", "Madrid" );
INSERT INTO codigosPostales VALUES (50008, "Zaragoza", "Zaragoza" );
INSERT INTO codigosPostales VALUES (28004, "Arganda", "Madrid");
INSERT INTO codigosPostales VALUES (28000, "Madrid", "Madrid");

INSERT INTO telefonos (DNI, Telefono) VALUES ("12345678C", 611111111);
INSERT INTO telefonos (DNI, Telefono) VALUES ("12345678C", 931111111);
INSERT INTO telefonos (DNI, Telefono) VALUES ("12345678L", 913333333);
INSERT INTO telefonos (DNI, Telefono) VALUES ("12345678P", 913333333);
INSERT INTO telefonos (DNI, Telefono) VALUES ("12345678P", 644444444);

INSERT INTO domicilios (DNI, Calle, CodigoPostal) VALUES ("12345678A", "Avda. Complutense", 28040);
INSERT INTO domicilios (DNI, Calle, CodigoPostal) VALUES ("12345678A", "Cántaro", 28004);
INSERT INTO domicilios (DNI, Calle, CodigoPostal) VALUES ("12345678P", "Diamante", 14200);
INSERT INTO domicilios (DNI, Calle, CodigoPostal) VALUES ("12345678P", "Carbón", 14900);
INSERT INTO domicilios (DNI, Calle, CodigoPostal) VALUES ("12345678L", "Diamante", 14200);

/* 3.- Listado de empleados que muestre Nombre, Calle y Código postal ordenados por Código postal y Nombre de dos formas diferentes: 1. Sin joins. 2. Con joins */
/* Sin INNER JOIN */
SELECT empleados.Nombre, domicilios.Calle, domicilios.CodigoPostal
FROM empleados, domicilios
WHERE empleados.DNI = domicilios.DNI
ORDER BY domicilios.CodigoPostal, empleados.Nombre;

/* Con INNER JOIN */ 
SELECT empleados.Nombre, domicilios.Calle, domicilios.CodigoPostal 
FROM empleados
INNER JOIN domicilios ON empleados.DNI = domicilios.DNI
ORDER BY domicilios.CodigoPostal, empleados.Nombre;

/* 4.- Listado de los empleados ordenados por nombre que muestre Nombre, DNI, Calle, Código postal, Teléfono de dos formas diferentes: 1. Sólo los empleados que tengan teléfono. 
2. Los empleados que tengan teléfono como los que no. */
/* Empleados con teléfono */
SELECT empleados.Nombre, empleados.DNI, domicilios.Calle, domicilios.CodigoPostal, telefonos.Telefono
FROM empleados
INNER JOIN telefonos ON empleados.DNI = telefonos.dni
LEFT JOIN domicilios ON empleados.DNI = domicilios.dni
ORDER BY empleados.Nombre;

/* Todos los empleados */
SELECT empleados.Nombre, empleados.DNI, domicilios.Calle, domicilios.CodigoPostal, telefonos.Telefono
FROM empleados
LEFT JOIN telefonos ON empleados.DNI = telefonos.dni
LEFT JOIN domicilios ON empleados.DNI = domicilios.dni
ORDER BY empleados.Nombre;

/* 5.- . Listado de los empleados que muestre Nombre, DNI, Calle, Población, Provincia y Código postal ordenados por nombre. */
SELECT empleados.Nombre, empleados.DNI, domicilios.Calle, codigosPostales.Poblacion, codigosPostales.Provincia, codigosPostales.CodigoPostal
FROM empleados
LEFT JOIN domicilios ON empleados.DNI = domicilios.dni
LEFT JOIN codigosPostales ON domicilios.CodigoPostal = codigosPostales.CodigoPostal
ORDER BY empleados.Nombre;

/* 6.- . Listado de los empleados que muestre Nombre, DNI, Calle, Población, Provincia, Código postal y Teléfono ordenados por nombre. */
SELECT empleados.Nombre, empleados.DNI, domicilios.Calle, codigosPostales.Poblacion, codigosPostales.Provincia, codigosPostales.CodigoPostal, telefonos.Telefono
FROM empleados
LEFT JOIN domicilios ON empleados.DNI = domicilios.dni
LEFT JOIN codigosPostales ON domicilios.CodigoPostal = codigosPostales.CodigoPostal
LEFT JOIN telefonos ON telefonos.DNI = empleados.DNI
ORDER BY empleados.Nombre;

/* 7.- Incrementar en un 10% el sueldo de todos los empleados, de forma que el sueldo aumentado no supere en ningún caso 1.900 €. */
UPDATE empleados SET sueldo = sueldo * 1.1 WHERE sueldo * 1.1 <= 1900;

/* 8.- Deshacer la operación anterior con una consulta (comprobar que los datos coinciden con los de la tabla original). */
UPDATE empleados SET sueldo = sueldo * (1 / 1.1) WHERE sueldo < 1900;

/* 9.- Repetir los dos pasos anteriores con el límite 1.600 €. */ 
CREATE TEMPORARY TABLE empleadosSueldoSubido SELECT Nombre FROM empleados WHERE sueldo * 1.1 <= 1600;
UPDATE empleados SET sueldo = sueldo*1.1 WHERE sueldo*1.1 <= 1600;
UPDATE empleados SET sueldo = sueldo * (1 / 1.1) WHERE nombre IN (SELECT * FROM empleadosSueldoSubido);

/* 10.- Listado del número total de empleados, el sueldo máximo, el mínimo y el medio. */
SELECT COUNT(Nombre) AS "Número de empleados", MAX(sueldo) AS "Sueldo máximo", MIN(sueldo) AS "Sueldo mínimo", TRUNCATE(AVG(sueldo), 2) AS "Sueldo medio" FROM empleados;

/* 11.- Listado de sueldo medio y número de empleados por población ordenado por población. */

SELECT TRUNCATE(AVG(empleados.sueldo), 2) AS "Sueldo medio por poblacion", count(empleados.DNI) AS "Empleados por poblacion", codigosPostales.Poblacion
FROM empleados
LEFT JOIN domicilios ON empleados.DNI = domicilios.dni
LEFT JOIN codigosPostales ON domicilios.CodigoPostal = codigosPostales.CodigoPostal
GROUP BY codigosPostales.Poblacion
ORDER BY codigosPostales.Poblacion;

/* 12.- Agregar restricciones de integridad de dominio con las reglas de validación (el sueldo debe estar comprendido entre 0 y 120.000 €.) */
ALTER TABLE empleados ADD CONSTRAINT CHK_sueldo CHECK (sueldo >= 0 AND sueldo <= 120000);
