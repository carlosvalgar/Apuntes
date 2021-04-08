CREATE OR REPLACE PROCEDURE empleados_letra(letra VARCHAR2) AS
CURSOR c_empleados IS
SELECT last_name, salary FROM employees WHERE SUBSTR(last_name, 1, 1) = UPPER(letra) AND salary < (SELECT AVG(salary) FROM employees);
v_count NUMBER := 0;
BEGIN
FOR i IN c_empleados
    LOOP
        DBMS_OUTPUT.PUT_LINE('Apellido: '||i.last_name);
        DBMS_OUTPUT.PUT_LINE('Salario: '||i.salary);
        DBMS_OUTPUT.PUT_LINE('--------------------');
        v_count := v_count + 1;
    END LOOP;
    
IF v_count = 0 THEN
    RAISE NO_DATA_FOUND;
END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: No se encontraron datos.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado.');
END;
/

BEGIN
empleados_letra('a');
END;
/