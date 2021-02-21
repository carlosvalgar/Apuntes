/* Consultas sobre una tabla */

/* 1 */
SELECT apellido1, apellido2, nombre 
FROM persona
WHERE tipo = "alumno"
ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

/* 2 */
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = "alumno" AND telefono IS NULL;

/* 3 */
SELECT nombre, apellido1, apellido2
FROM persona
WHERE YEAR(fecha_nacimiento) = "1999";

/* 4 */
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = "profesor" AND telefono IS NULL AND nif LIKE "%K";

/* 5 */
SELECT nombre
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id = 7;

/* Consultas multitabla (Composición interna INNER JOIN) */

/* 1 */
SELECT DISTINCT persona.*
FROM persona
INNER JOIN alumno_se_matricula_asignatura  ON persona.id = alumno_se_matricula_asignatura.id_alumno
INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id
INNER JOIN grado ON asignatura.id_grado = grado.id
WHERE persona.sexo = "M" AND grado.nombre = "Grado en Ingeniería Informática (Plan 2015)";

/* 2 */
SELECT asignatura.nombre
FROM asignatura
INNER JOIN grado ON asignatura.id_grado = grado.id
WHERE grado.nombre = "Grado en Ingeniería Informática (Plan 2015)";

/* 3 */
SELECT persona.nombre, persona.apellido1, persona.apellido2, departamento.nombre AS "Nombre de departamento"
FROM persona
INNER JOIN profesor ON persona.id = profesor.id_profesor
INNER JOIN departamento ON profesor.id_departamento = departamento.id
ORDER BY persona.apellido1, persona.apellido2, persona.nombre;

/* 4 */
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin
FROM asignatura
INNER JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
INNER JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id
INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
WHERE persona.nif = "26902806M";

/* 5 */
SELECT DISTINCT departamento.nombre
FROM departamento
INNER JOIN profesor ON departamento.id = profesor.id_departamento
INNER JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
INNER JOIN grado ON asignatura.id_grado = grado.id
WHERE grado.nombre = "Grado en Ingeniería Informática (Plan 2015)";

/* 6 */
SELECT DISTINCT persona.nombre, persona.apellido1, persona.apellido2
FROM persona
INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno
INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019;

/* Consultas multitabla (Composición externa) */

/* 1 */
SELECT departamento.nombre AS "Nombre del departamento", persona.apellido1, persona.apellido2, persona.nombre AS "Nombre del profesor"
FROM persona
INNER JOIN profesor ON persona.id = profesor.id_profesor
LEFT JOIN departamento ON profesor.id_departamento = departamento.id
ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

/* 2 */
SELECT persona.apellido1, persona.apellido2, persona.nombre AS "Nombre del profesor"
FROM persona
INNER JOIN profesor ON persona.id = profesor.id_profesor
LEFT JOIN departamento ON profesor.id_departamento = departamento.id
WHERE departamento.nombre IS NULL;

/* 3 */
SELECT departamento.nombre
FROM departamento
LEFT JOIN profesor ON departamento.id = profesor.id_departamento
WHERE profesor.id_profesor IS NULL;

/* 4 */
SELECT persona.nombre, persona.apellido1, persona.apellido2
FROM persona
INNER JOIN profesor ON persona.id = profesor.id_profesor
LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
WHERE asignatura.nombre IS NULL;

/* 5 */
SELECT asignatura.nombre
FROM asignatura
LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor
WHERE profesor.id_profesor IS NULL;

/* 6 */
SELECT DISTINCT departamento.nombre
FROM departamento
LEFT JOIN profesor ON departamento.id = profesor.id_departamento
LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
LEFT JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
LEFT JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
WHERE curso_escolar.id IS NULL;

/* Consultas resumen */

/* 1 */
SELECT COUNT(*) AS "Número total de alumnas"
FROM persona
WHERE tipo = "alumno" AND sexo = "M";

/* 2 */
SELECT COUNT(*) AS "Número de alumnos nacidos en 1999"
FROM persona
WHERE tipo = "alumno" AND YEAR(fecha_nacimiento) = "1999";

/* 3 */
SELECT departamento.nombre AS "Nombre del departamento", COUNT(profesor.id_profesor) AS "Cantidad de profesores por departamento"
FROM departamento
INNER JOIN profesor ON departamento.id = profesor.id_departamento
GROUP BY departamento.nombre
ORDER BY COUNT(profesor.id_profesor) DESC;

/* 4 */
SELECT departamento.nombre AS "Nombre del departamento", COUNT(profesor.id_profesor) AS "Cantidad de profesores por departamento"
FROM departamento
LEFT JOIN profesor ON departamento.id = profesor.id_departamento
GROUP BY departamento.nombre;

/* 5 */
SELECT grado.nombre AS "Nombre del Grado", COUNT(asignatura.id) AS "Cantidad de Asignaturas"
FROM grado
LEFT JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre
ORDER BY COUNT(asignatura.id) DESC;
 
 /* 6 */
SELECT grado.nombre, COUNT(asignatura.id)
FROM grado
INNER JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre
HAVING COUNT(asignatura.nombre) > 40;

/* 7 */
SELECT grado.nombre, asignatura.tipo, COUNT(asignatura.creditos)
FROM grado
LEFT JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre, asignatura.tipo
ORDER BY COUNT(asignatura.creditos) DESC;

/* 8 */
SELECT curso_escolar.anyo_inicio, COUNT(DISTINCT persona.id)
FROM curso_escolar
INNER JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id
INNER JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id
GROUP BY curso_escolar.anyo_inicio;

/* 9 */
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.nombre) AS "Cantidad de asignaturas"
FROM persona
INNER JOIN profesor ON persona.id = profesor.id_profesor
LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
GROUP BY persona.id
ORDER BY COUNT(asignatura.nombre) DESC;

/* SUBCONSULTAS */

/* 1 */
SELECT *
FROM persona
WHERE tipo = "alumno" AND fecha_nacimiento = (
	SELECT MAX(fecha_nacimiento)
    FROM persona);

/* 2 */
SELECT nombre, apellido1, apellido2
FROM persona
INNER JOIN profesor ON persona.id = profesor.id_profesor
WHERE profesor.id_departamento NOT IN (
	SELECT id
    FROM departamento);

/* 3 */
SELECT nombre
FROM departamento
WHERE id NOT IN (
	SELECT id_departamento
	FROM profesor);

/* 4 */
SELECT nombre, apellido1, apellido2
FROM persona
INNER JOIN profesor ON persona.id = profesor.id_profesor
WHERE profesor.id_departamento IN (
	SELECT id
    FROM departamento)
AND profesor.id_profesor NOT IN (
	SELECT DISTINCT id_profesor
    FROM asignatura
    WHERE id_profesor IS NOT NULL);

/* 5 */
SELECT nombre
FROM asignatura
WHERE NOT EXISTS (
	SELECT nombre
    FROM profesor
    WHERE profesor.id_profesor = asignatura.id_profesor);

/* 6 */
SELECT nombre
FROM departamento
WHERE nombre NOT IN (
	SELECT DISTINCT departamento.nombre
	FROM curso_escolar
	INNER JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
	INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id
	INNER JOIN profesor ON asignatura.id_profesor = profesor.id_profesor
	INNER JOIN departamento ON profesor.id_departamento = departamento.id);
 