SET SERVEROUTPUT ON;

/*

-- 1.- PLSQL

DECLARE
    departamentPatFay departments.department_name%TYPE;

BEGIN
    SELECT department_name INTO departamentPatFay
        FROM departments WHERE department_id = (
        SELECT department_id FROM employees WHERE first_name = 'Pat' AND last_name = 'Fay');
    DBMS_OUTPUT.PUT_LINE(departamentPatFay);
END;

*/
/*

-- 1.- No PLSQL

VARIABLE departamentPatFay VARCHAR2(25);

BEGIN
    SELECT department_name INTO :departamentPatFay
        FROM departments WHERE department_id = (
        SELECT department_id FROM employees WHERE first_name = 'Pat' AND last_name = 'Fay');
END;
/
PRINT departamentPatFay

*/
/*

-- 2.- PLSQL

DECLARE
    usuariId employees.first_name%TYPE := &Introdueix_la_id;
    regionUsuari regions.region_name%TYPE;

BEGIN
    SELECT regions.region_name INTO regionUsuari FROM employees 
        INNER JOIN departments ON departments.department_id =  employees.department_id
        INNER JOIN locations ON locations.location_id = departments.location_id
        INNER JOIN countries ON countries.country_id = locations.country_id
        INNER JOIN regions ON regions.region_id = countries.region_id
        WHERE employees.employee_id = usuariId;
    DBMS_OUTPUT.PUT_LINE(regionUsuari);
END;

*/
/*

-- 2.- No PLSQL

ACCEPT usuariId PROMPT 'Introdueix la ID de l''usuari: ';
VARIABLE regionUsuari VARCHAR2(25);

BEGIN
    SELECT regions.region_name INTO :regionUsuari FROM employees 
        INNER JOIN departments ON departments.department_id =  employees.department_id
        INNER JOIN locations ON locations.location_id = departments.location_id
        INNER JOIN countries ON countries.country_id = locations.country_id
        INNER JOIN regions ON regions.region_id = countries.region_id
        WHERE employees.employee_id = &usuariId;
END;
/
PRINT regionUsuari

*/
/*

-- 3.-

DECLARE
    holaMundo VARCHAR2(50):= 'HOLA MUNDO
FIN DEL PROGRAMA';

BEGIN
    DBMS_OUTPUT.PUT_LINE(holaMundo);
END;

*/
/*

-- 4.-

DECLARE
    num1 NUMBER(3, 1):= 10.2;
    num2 NUMBER(3, 1):= 20.1;

BEGIN
    DBMS_OUTPUT.PUT_LINE('LA SUMA TOTAL ÉS: '||(num1 + num2));
END;

*/
/*

-- 5.-

DECLARE
    nomEmpleats employees.first_name%TYPE;
    CURSOR C_firstName IS
        SELECT first_name FROM employees;

BEGIN
    OPEN C_firstName;
        LOOP
            FETCH C_firstName INTO nomEmpleats;
            EXIT WHEN C_firstName%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(UPPER(nomEmpleats));
        END LOOP;
    CLOSE C_firstName;
END;

*/
/*

-- 6.-

DECLARE
    Percentatge CONSTANT INT:= 10;
    empleado employees%ROWTYPE;
    departamento departments%ROWTYPE;
    idEmpleado INT := &Introduce_la_id_del_empleado;

BEGIN
    SELECT employees.employee_id, employees.first_name, employees.last_name, employees.salary, departments.department_name
        INTO empleado.employee_id, empleado.first_name, empleado.last_name, empleado.salary, departamento.department_name FROM employees 
        INNER JOIN departments ON departments.department_id = employees.department_id
        WHERE employee_id = idEmpleado;
    DBMS_OUTPUT.PUT_LINE('L''usuari amb id: '||empleado.employee_id||'
L''usuari amb Nom: '||empleado.first_name||' i cognom '||empleado.last_name||' que pertany al departament '||departamento.department_name||'
El salari inicial era: '||empleado.salary||' i ara el nou salari és '||(empleado.salary *((100 + Percentatge)/100))
);
END;

*/