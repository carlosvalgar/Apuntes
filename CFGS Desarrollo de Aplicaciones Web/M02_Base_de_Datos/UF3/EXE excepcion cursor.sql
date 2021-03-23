SET SERVEROUTPUT ON;

-- Hacer una funcion que devuelva los nombres de los trabajadores para un id_departamento que meta el usuario y controlar con excepciones que el id del departamento existe sino saltara error
CREATE OR REPLACE FUNCTION empleados_departamento(var_department_id employees.department_id%TYPE) RETURN VARCHAR2 AS
CURSOR c_empleados_departamento IS
SELECT first_name FROM employees WHERE department_id = var_department_id;
var_c_empleados c_empleados_departamento%ROWTYPE;
var_nom_empleados VARCHAR2(1000) := '';
var_exception departments.department_id%TYPE;

BEGIN
SELECT department_id INTO var_exception FROM departments WHERE department_id = var_department_id;

OPEN c_empleados_departamento;
    LOOP
        FETCH c_empleados_departamento INTO var_c_empleados;
        EXIT WHEN c_empleados_departamento%NOTFOUND;
        var_nom_empleados := (var_nom_empleados || ' ' || var_c_empleados.first_name);
    END LOOP;
CLOSE c_empleados_departamento;
RETURN var_nom_empleados;
EXCEPTION 
    WHEN no_data_found THEN
        RETURN 'El departamento no existe.';
END;
/

BEGIN
DBMS_OUTPUT.PUT_LINE(empleados_departamento(&department_id));
END;
