SET SERVEROUTPUT ON;

-- Exe 1.-

DECLARE
nombre_empleado employees.first_name%TYPE;
apellido_empleado employees.last_name%TYPE;
salario_empleado employees.salary%TYPE;

BEGIN
    SELECT first_name, last_name, salary INTO nombre_empleado, apellido_empleado, salario_empleado FROM employees WHERE employee_id = 100;
    DBMS_OUTPUT.PUT_LINE('nom---------------- '||'cognoms------------ '||'salari----------');
    DBMS_OUTPUT.PUT_LINE(rpad(nombre_empleado, 20)||rpad(apellido_empleado, 20)||to_char(salario_empleado, 'fm999g999d00'));
END;
/

-- Exe 2.-

DECLARE
nombre_empleado employees.first_name%TYPE;
apellido_empleado employees.last_name%TYPE;
salario_empleado employees.salary%TYPE;
employee_id_user employees.employee_ID%TYPE;

BEGIN
    employee_id_user := &introduce_id_employee_a_buscar;
    SELECT first_name, last_name, salary INTO nombre_empleado, apellido_empleado, salario_empleado FROM employees WHERE employee_id = employee_id_user;
    DBMS_OUTPUT.PUT_LINE('nom---------------- '||'cognoms------------ '||'salari----------');
    DBMS_OUTPUT.PUT_LINE(rpad(nombre_empleado, 20)||rpad(apellido_empleado, 20)||to_char(salario_empleado, 'fm999g999d00'));
END;
/

-- Exe 3.-
employee