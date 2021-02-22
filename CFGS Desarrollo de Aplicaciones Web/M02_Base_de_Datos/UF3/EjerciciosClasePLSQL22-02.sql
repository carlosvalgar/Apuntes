SET SERVEROUTPUT ON

DECLARE
CURSOR cursorEmpleadosSueldo IS
    /* SELECT FIRST_NAME,JOB_ID, SALARY, ROW_NUMBER() OVER (PARTITION BY job_id ORDER BY salary) AS empleadosDesc FROM employees; */
    SELECT * FROM employees ORDER BY job_id, salary;

varEmpleado employees%ROWTYPE;
varAux employees.job_id%TYPE := '**';
varRow NUMBER := 0;

BEGIN

OPEN cursorEmpleadosSueldo;
    LOOP
    FETCH cursorEmpleadosSueldo INTO varEmpleado;
        EXIT WHEN cursorEmpleadosSueldo%NOTFOUND;
        varRow := varRow +1;
        
        IF varEmpleado.job_id != varAux THEN
            varAux := varEmpleado.job_id;
            varRow := 1;
        END IF;
        
        IF varRow <= 2 THEN
            DBMS_OUTPUT.PUT_LINE(varEmpleado.first_name||' * '||varEmpleado.last_name|| ' * ' ||varEmpleado.job_id);
            
        END IF;
        
    END LOOP;        
CLOSE cursorEmpleadosSueldo;
END;
