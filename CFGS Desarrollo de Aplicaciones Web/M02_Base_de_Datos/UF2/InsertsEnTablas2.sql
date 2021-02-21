START TRANSACTION;

/*1.- Asegúrese de haber desactivado la confirmación automática. (commit). */
SET autocommit = 0;

/* 2.- Introduzca en los departamentos de la tabla un nuevo departamento con ID 300 con el nombre Finance, id de administrador 110 y el código de ubicación es 1800. Compruebe que la fila se ha insertado correctamente en la tabla, si es así, confirme la operación. */
/* INSERT INTO departments
	VALUES ("300", "Finance", "110", "1800");
    
SELECT * FROM departments;

COMMIT;

/* 3.- Introduzca en los departamentos de la tabla un nuevo departamento con ID 400, y el nombre 'Finances2' su jefe tiene el código 389 y su código de ubicación es 1800. ¿Qué respuesta recibes? ¿porque? */
/* INSERT INTO departments
	VALUES ("400", "Finances2", "389", "1800");
    
/* Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`hr`.`departments`, CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`)) */
/* Deduzco que sale este mensaje de error porque el manager_id (Foreign Key) que intentamos añadir no existe en la tabla de employees

/* 4.- Introduzca en la tabla empleados el empleado Jose Company con ID 401, su correo electrónico es prova@prova.com, --la fecha del contrato es la actual, su salario será de 1600 funcionará como Jefe de Ventas, SA_MAN. No confirme los cambios. */ 
/* INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
	VALUES ("401", "Jose", "Company", "prova@prova.com", "2021-01-11", "SA_MAN", 1600);

/* 5.- Anule la operación anterior y compruebe que la fila ha desaparecido de la tabla. */
/* ROLLBACK;

SELECT * FROM employees;

/* 6.- Cree una nueva tabla llamada test de acuerdo con la siguiente sintaxis: */
/* CREATE TABLE prova (
id INTEGER(6) PRIMARY KEY,
name VARCHAR(20),
hire_date DATE,
salary FLOAT(8, 2));

/* 7.- Introduzca en la tabla los datos correspondientes de todos los empleados del departamento 50. */
/* INSERT INTO prova
SELECT employee_id, first_name, hire_date, salary FROM employees WHERE department_id = 50;

SELECT * FROM prova;

/* 8.- Introduzca en la prueba de tabla un nuevo empleado con el identificador 390, el nombre Julio y el resto de datos son los mismos que los del empleado con ID 119. */
/*INSERT INTO prova
VALUES (390, "Julio", (SELECT hire_date FROM employees WHERE employee_id = 119), (SELECT salary FROM employees WHERE employee_id = 119));

/* 9.- Introduzca en la tabla los datos de los empleados del departamento 90. */
/*INSERT INTO prova
SELECT employee_id, first_name, hire_date, salary FROM employees WHERE department_id = 90;

SELECT * FROM prova;

/* 10.- Borre todas las filas de la tabla de prueba. Confirme la operación. */
/*DELETE FROM prova;

COMMIT;

SELECT * FROM prova;

/*11.- Introduzca en la tabla los datos de los empleados con el salario más bajo de cada uno de sus departamentos. */
/*INSERT INTO prova
SELECT employee_id, first_name, hire_date, salary from employees WHERE (department_id, salary) IN 
	(SELECT department_id, MIN(salary) FROM employees GROUP BY department_id);
    
SELECT * FROM prova;

/* 12.- Modificar el salario del empleado 200 de la tabla de pruebas a 5000. */
/* UPDATE prova
SET salary = 5000
WHERE id = 200;

SELECT * FROM prova;

/* 13.- Modificar los salarios de la tabla de pruebas y aumentarlos en un 3%. */
/* UPDATE prova
SET salary = salary * 1.03;

SELECT * FROM prova;

/* 14.- Modificar la fecha de contratación de los empleados de la tabla de pruebas y aumentarla 1 año (Utilice la función ADD_MONTHS(date,n)). */
/*UPDATE prova
SET hire_date = ADDDATE(hire_date, INTERVAL 1 YEAR);
SELECT * FROM prova;

/* 15.- El empleado de los empleados de la tabla 105 ha sido transferido al departamento 100. */
/* UPDATE employees
SET department_id = 100
WHERE employee_id = 105;

SELECT * FROM employees;

/* 16.- El empleado 107 de la tabla de pruebas cambia su nombre y salario por el nombre y el salario del empleado 100. */
/* UPDATE prova
SET name = (SELECT first_name FROM employees WHERE employee_id = 100), salary = (SELECT salary FROM employees WHERE employee_id = 100)
WHERE id = 107;
SELECT * FROM prova;

/* 17.- El empleado 107 ha cambiado en el departamento de Daniel Faviet(109) y su salario ha cambiado al salario máximo correspondiente a sus puestos de trabajo. */
/* UPDATE employees
SET department_id = (SELECT department_id FROM (SELECT * FROM employees) p1 WHERE employee_id = 109), salary = (SELECT MAX(salary) FROM (SELECT * FROM employees) p2 WHERE job_id = (SELECT job_id FROM (SELECT * FROM employees) p3 WHERE employee_id = 107))
WHERE employee_id = 107;
SELECT * FROM employees;

/* 18.- Ejecute la siguiente declaración ¿Qué respuesta da? ¿porque? */
/* insert into employees (employee_id, last_name, email, job_id) values (800, 'Lopez','lopez@hotmail.com', 'SA_PAT');

/* Nos da error porque no tenemos el campo de hire_date no puede ser nulo, no aparece en los datos que añadimos y además en la tabla employees, no tiene un valor predefinido. */ 

/* 19.-  Ejecute la siguiente declaración ¿Qué respuesta da? ¿porque? */
/* insert into employees (employee_id, last_name, email, hire_date,job_id) values (800,'Lopez', 'lopez@hotmail.com', sysdate(), 'SA_PAT');

/* Nos da el mismo error que antes pero esta vez con el campo salary */

/* 20.- Ejecute el siguiente comando ¿Qué respuesta da ? ¿Cómo se define la columna commissio_pct? Compruebe la estructura de la tabla. */
/* Update employees set commission_pct = 300 where employee_id = 100;

/* El campo commission_pct podemos tener valores entre 0 y 99.99 por el hecho que en la tabla admite un numero con 2 numeros en la parte entera y 2 numeros en la parte decimal, por lo que da error */

/*21 .- Cree la tabla jobs2 con la sintaxis siguiente. */
/* Create table jobs2 as select * from jobs;

/* 22.- Comprova la seva estructura mitjançant l’ordre Desc jobs2. */
/* DESC jobs2;

/* 23.- Comprova ara quines dades té la taula jobs2. */
/* SELECT * FROM jobs2;

/* 24.- Actualizar el salario mínimo de la tabla de trabajos para que sea igual al salario máximo multiplicado por 0,75 para todos aquellos trabajos cuyo nombre comience por A. */
/* UPDATE jobs2
SET min_salary = max_salary * 0.75
WHERE job_title LIKE "A%";
SELECT * FROM jobs2;

/* 25.- Borre la fila del trabajo correspondiente de Job Table Sales Manager. */
/* DELETE FROM jobs2
WHERE job_title = "Job Table Sales Manager";

/* 26.- Borra los puestos de trabajo de la tabla jobs2 en el que el salario máximo superior a 1,7 veces el salario mínimo. */
/* DELETE FROM jobs2
WHERE max_salary > min_salary * 1.7;
SELECT * FROM jobs2;

/* 27.- Crear la tabla de países para que sea una copia de la tabla de países y luego borre todos los países que se encuentran en el mismo continente que Australia. (ver año 21) */
/*CREATE TABLE countries2 AS SELECT * FROM countries;
DELETE FROM countries2
WHERE region_id = (SELECT region_id FROM (SELECT * FROM countries2) p1 WHERE country_name = "Australia");
SELECT * FROM countries2;

/* 28.- Despejar de las regiones de tabla del continente 3, region_id 3. ¿Qué pasa? ¿porque? */
/* No se puede borrar un elemento de una tabla haciendo referencia a la misma tabla */

/* 29.- ¿Cómo eliminaría los datos de una tabla de forma diferente? */
/* Como el apartado 27, se genera una tabla temporal identica a la tabla que tenemos para hacer referencia a esos datos y se ejecuta el comando */

/* 30.- Confirme las operaciones. */
/* COMMIT;