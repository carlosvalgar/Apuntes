SET SERVEROUTPUT ON;

-- 1.-
/*

CREATE OR REPLACE PROCEDURE rango(numero1 IN NUMBER) AS
numeroAux NUMBER := 1;
BEGIN
    IF numero1 <= 0 THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: No funciona con numeros negativos o con cero.');
    ELSE
        WHILE numeroAux <= numero1
        LOOP
            DBMS_OUTPUT.PUT_LINE(numeroAux);
            numeroAux := numeroAux + 1;
        END LOOP;
    END IF;
END;
/

BEGIN
    rango(4);
    rango(-4);
    rango(16);
    rango(0);
END;
/

*/
-- 2.-
/*

CREATE OR REPLACE PROCEDURE DUPLICAR_CANTIDAD(numero IN OUT NUMBER) AS
BEGIN
    numero := numero * 2;
END;
/

DECLARE
numero NUMBER := &numero;

BEGIN
    DUPLICAR_CANTIDAD(numero);
    DBMS_OUTPUT.PUT_LINE(numero);
END;
/

*/
-- 3.-
/*

CREATE OR REPLACE PROCEDURE nuevoOficio(job_id jobs.job_id%TYPE, job_title jobs.job_title%TYPE, min_salary jobs.min_salary%TYPE, max_salary jobs.max_salary%TYPE) AS
BEGIN
    IF min_salary > max_salary THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: El salari minim no pot ser mes gran que el salari maxim.');
    ELSIF min_salary < 0 THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: El salari no pot ser negatiu.');
    ELSE
        INSERT INTO JOBS
        VALUES(job_id, job_title, min_salary, max_salary);
    END IF;
END;
/

BEGIN
    nuevoOficio('INV_FI', 'Invitada de fiestas profesional', 50000, 999999);
END;
/

*/
-- 4 .-
/*

CREATE OR REPLACE PROCEDURE eliminar_oficio(var_job_id jobs.job_id%TYPE) AS
BEGIN
    DELETE FROM JOBS WHERE JOB_ID = var_job_id;
END;
/

BEGIN
    eliminar_oficio('&Oficio_Eliminar');
END;
/

*/
-- 5.-
/*

CREATE OR REPLACE FUNCTION contar(departamento IN employees.department_id%TYPE) RETURN NUMBER AS
empleados NUMBER;
BEGIN
    SELECT COUNT(*) INTO empleados FROM EMPLOYEES WHERE DEPARTMENT_ID = departamento;
    RETURN empleados;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(contar(&departament_id));
END;
/

*/