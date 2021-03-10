SET SERVEROUTPUT ON;

-- EJERCICIO 1 Procedimiento que devuelva el numero de empleados por rango salarial dentro de un departamento. El procedimiento solo aceptará el nombre del departamento.

CREATE OR REPLACE PROCEDURE empleado_rango_salario(nombreDepartamento departments.department_name%TYPE) AS
maxSalary employees.salary%TYPE;
minRange NUMBER := 0;
maxRange NUMBER := 999;
numEmployees NUMBER;

BEGIN
    SELECT MAX(salary) INTO maxSalary FROM employees;
    DBMS_OUTPUT.PUT_LINE('Rango de salario del departamento: '||nombreDepartamento);
    WHILE minRange < maxSalary
    LOOP
        SELECT COUNT(*) INTO numEmployees FROM employees INNER JOIN departments ON departments.department_id = employees.department_id 
        WHERE employees.salary >= minRange AND employees.salary < maxRange AND departments.department_name = nombreDepartamento;
        
        IF numEmployees > 0 THEN
            DBMS_OUTPUT.PUT_LINE(minRange||' - '||maxRange||': '||numEmployees);
        END IF;
        minRange := minRange + 1000;
        maxRange := maxRange + 1000;
        
    END LOOP;
END;
/

BEGIN
empleado_rango_salario('Finance');
END;
