START TRANSACTION;
SET autocommit = 0;

CREATE TABLE MY_EMPLOYEE (
	ID INTEGER(4),
	LAST_NAME VARCHAR(25),
	FIRST_NAME VARCHAR(25),
	USERID VARCHAR(8),
	SALARY NUMERIC(9,2),
	CONSTRAINT MY_EMPLOYEE_ID_PK PRIMARY KEY(ID));

/* 1.- Cree un script para agregar la primera y la segunda fila de datos a MY_EMPLOYEE teniendo en cuenta los siguientes datos. */
INSERT INTO my_employee
	VALUES ("1", "Patel", "Ralph", "rpatel", "895");
INSERT INTO my_employee
	VALUES ("2", "Dancs", "Betty", "bdancs", "860");

/* 2.- Cree un script para actualizar el campo userid de los usuarios con los id 3 y 4. Tenga en cuenta que el ID de usuario debe ser la primera letra del nombre con los primeros siete caracteres del apellido. */
INSERT INTO my_employee
	VALUES ("3", "Biri", "Ben", NULL, "1100");
INSERT INTO my_employee
	VALUES ("4", "Newman", "Chad", NULL, "750");
UPDATE my_employee
	SET USERID = CONCAT(
		 SUBSTRING(FIRST_NAME, 1, 1),
		 SUBSTRING(LAST_NAME, 1, 7))
    WHERE ID = 3;
UPDATE my_employee
	SET USERID = CONCAT(
		 SUBSTRING(FIRST_NAME, 1, 1),
		 SUBSTRING(LAST_NAME, 1, 7))
    WHERE ID = 4;
    
/* 3.- Forzar que los datos introducidos sean permanentes en la base de datos y comprobar que los cuatro registros de la tabla se han añadido. */
COMMIT;
SELECT * FROM my_employee;

/* 4.- Cambie el apellido del empleado 3 a Drexler. */
UPDATE my_employee
	SET LAST_NAME = "Drexler"
    WHERE ID = 3;
    
/* 5.- Cambie el salario a 1000 para todos los empleados con un salario inferior a 900.*/
UPDATE my_employee
	SET SALARY = 1000
    WHERE SALARY < 900;
    
/* 6.- Retire a Betty Dancs de la tabla. */
DELETE FROM my_employee
WHERE FIRST_NAME = "Betty" AND LAST_NAME = "Dancs";

/* 7.- Verifique los datos modificados en el MY_EMPLOYEE. */
SELECT * FROM my_employee;

/* 8.- Forzar que los datos introducidos sean permanentes en la base de datos. */
COMMIT;

/* 9.- Cree un script para insertar el último registro de la tabla (consulte el ejercicio de tabla 1). */
INSERT INTO my_employee
	VALUES ("5", "Ropeburn", "Audrey", "aropebur", "1550");

/* 10.- Verifique los datos modificados en el MY_EMPLOYEE. */
SELECT * FROM my_employee;

/* 11.- Ponga una marca de la transacción en este momento llamada MARCA14 */
SAVEPOINT MARCA14;

/* 12.- Vacíe la tabla y compruebe que está vacía, consultando los datos de la tabla.*/
DELETE FROM my_employee;
SELECT * FROM my_employee;

/* 13.- Deshacer la operación DELETE que se acaba de realizar en el ejercicio 15 y, por lo tanto, debe mantenerse el INSERT anterior. */
ROLLBACK TO SAVEPOINT MARCA14;

/* 14.- Confirme que la tabla está de vuelta como en el ejercicio 13 y guarde los cambios. */
SELECT * FROM my_employee;
COMMIT;