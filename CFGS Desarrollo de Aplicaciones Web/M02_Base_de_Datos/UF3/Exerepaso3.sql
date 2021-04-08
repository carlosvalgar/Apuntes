SET SERVEROUTPUT ON;

-- Diseña una función llamada nota_media que reciba un nombre de un módulo y devuelva la nota media obtenida por los alumnos matriculados en el mismo.

CREATE OR REPLACE FUNCTION nota_media(nombre_modulo asignaturas.nombre%TYPE) RETURN NUMBER AS
media NUMBER := -1;
flagAsignatura asignaturas.nombre%TYPE;

countMatriculados NUMBER;
sinAlumnos EXCEPTION;
BEGIN
SELECT nombre INTO flagAsignatura FROM asignaturas WHERE nombre = nombre_modulo;
SELECT AVG(notas.nota), COUNT(*) INTO media, countMatriculados FROM notas INNER JOIN asignaturas ON asignaturas.cod = notas.cod WHERE asignaturas.nombre = nombre_modulo;
IF countMatriculados = 0 THEN
    RAISE sinAlumnos;
END IF;
RETURN media;
EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('No existe el modulo');
        RETURN -1;
    WHEN sinAlumnos THEN
        DBMS_OUTPUT.PUT_LINE('No hay alumnos matriculados en el modulo');
        RETURN -1;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado');
        RETURN -1;
END;
/   

BEGIN
DBMS_OUTPUT.PUT_LINE(nota_media('Prog. Leng. Estr.'));
END;
/

-- Diseña un procedimiento al que pasemos como parámetro de entrada el nombre de uno de los módulos existentes en la BD y visualice el nombre de los alumnos que lo han cursado junto a su nota.
-- Al final del listado debe aparecer el nº de suspensos, aprobados, notables y sobresalientes.
-- Asimismo, deben aparecer al final los nombres y notas de los alumnos que tengan la nota más alta y la más baja.
-- Debes comprobar que las tablas tengan almacenada información y que exista el módulo cuyo nombre pasamos como parámetro al procedimiento.

CREATE OR REPLACE PROCEDURE listado_notas(nombre_modulo asignaturas.nombre%TYPE) AS
CURSOR c_alumnos IS
SELECT SUBSTR(alumnos.apenom, INSTR(apenom, ',') + 2) AS NOMBRE, notas.nota FROM asignaturas
INNER JOIN notas ON asignaturas.cod = notas.cod 
INNER JOIN alumnos ON alumnos.DNI = notas.dni WHERE asignaturas.nombre = nombre_modulo;
var_c_alumnos c_alumnos%ROWTYPE;
nota_mas_alta NUMBER := -1;
alumno_nota_alta VARCHAR2(25);
nota_mas_baja NUMBER := 11;
alumno_nota_baja VARCHAR2(25);
var_suspensos NUMBER := 0;
var_aprovados NUMBER := 0;
var_notables NUMBER := 0;
var_sobresalientes NUMBER := 0;

bool_nombre_modulo NUMBER;
except_nombre_modulo EXCEPTION;

bool_contenido_alumnos NUMBER;
except_contenido_alumnos EXCEPTION;

bool_contenido_asignaturas NUMBER;
except_contenido_asignaturas EXCEPTION;

bool_contenido_notas NUMBER;
except_contenido_notas EXCEPTION;

BEGIN
SELECT COUNT(*) INTO bool_nombre_modulo FROM asignaturas WHERE nombre = nombre_modulo;
SELECT COUNT(*) INTO bool_contenido_alumnos FROM alumnos;
SELECT COUNT(*) INTO bool_contenido_asignaturas FROM asignaturas;
SELECT COUNT(*) INTO bool_contenido_notas FROM notas;

IF bool_nombre_modulo = 0 THEN
    RAISE except_nombre_modulo;
ELSIF bool_contenido_alumnos = 0 THEN
    RAISE except_contenido_alumnos;
ELSIF bool_contenido_asignaturas = 0 THEN
    RAISE except_contenido_asignaturas;
ELSIF bool_contenido_notas = 0 THEN
    RAISE except_contenido_notas;
END IF;

DBMS_OUTPUT.PUT_LINE('Notas de '||nombre_modulo||'
==============================');
OPEN c_alumnos;
    LOOP
        FETCH c_alumnos INTO var_c_alumnos;
        EXIT WHEN c_alumnos%NOTFOUND; 
        DBMS_OUTPUT.PUT_LINE('Alumno: '||RPAD(var_c_alumnos.nombre, 10)||'Nota: '||var_c_alumnos.nota);
        
        IF var_c_alumnos.nota >= 9 THEN
            var_sobresalientes := var_sobresalientes +1;
        ELSIF var_c_alumnos.nota >= 7 THEN
            var_notables := var_notables +1;
        ELSIF var_c_alumnos.nota >= 5 THEN
            var_aprovados := var_aprovados +1;
        ELSE
            var_suspensos := var_suspensos +1;
        END IF;
        
        IF nota_mas_alta < var_c_alumnos.nota THEN
            nota_mas_alta := var_c_alumnos.nota;
            alumno_nota_alta := var_c_alumnos.nombre;
        END IF;
        
        IF nota_mas_baja > var_c_alumnos.nota THEN
            nota_mas_baja := var_c_alumnos.nota;
            alumno_nota_baja := var_c_alumnos.nombre;
        END IF;

    END LOOP;
CLOSE c_alumnos;
DBMS_OUTPUT.PUT_LINE('==============================
Sobresalientes: '||var_sobresalientes||'
Notables: '||var_notables||'
Aprovados: '||var_aprovados||'
Suspensos: '||var_suspensos);
DBMS_OUTPUT.PUT_LINE('==============================
Nota más alta: 
Alumno: '||RPAD(alumno_nota_alta, 10)||'Nota: '||nota_mas_alta);
DBMS_OUTPUT.PUT_LINE('==============================
Nota más baja: 
Alumno: '||RPAD(alumno_nota_baja, 10)||'Nota: '||nota_mas_baja||'
==============================');
EXCEPTION
    WHEN except_nombre_modulo THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: La asignatura no existe.');
    WHEN except_contenido_alumnos THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: La tabla alumnos no tiene datos.');
    WHEN except_contenido_asignaturas THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: La tabla asignaturas no tiene datos.');
    WHEN except_contenido_notas THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: La tabla notas no tiene datos.');
END;
/

BEGIN
listado_notas('Aplic. Entornos 4ªGen');
END;
/
