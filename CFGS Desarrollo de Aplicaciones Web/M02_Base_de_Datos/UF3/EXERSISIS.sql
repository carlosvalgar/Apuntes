SET SERVEROUTPUT ON;

-- 1.-
/*

CREATE OR REPLACE PROCEDURE RANGO (rangoSuperior IN NUMBER) AS
i NUMBER := 1;
BEGIN
IF rangoSuperior <= 0 THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: Has introducido un número negativo.');
ELSE
    WHILE i <= rangoSuperior
    LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        i := i +1;
    END LOOP;
END IF;
END;
/

*/
/*

DECLARE
numero NUMBER := &numero;

BEGIN
    RANGO(numero);
END;
/

*/
-- 2.-
/*

CREATE OR REPLACE PROCEDURE duplicar_cantidad (cantidad IN OUT NUMBER) AS
BEGIN
cantidad := cantidad * 2;
END;
/

*/
/*

DECLARE
numero NUMBER := &numero;

BEGIN
duplicar_cantidad(numero);
DBMS_OUTPUT.PUT_LINE(numero);
END;
/

*/
-- 3.-
/*

CREATE OR REPLACE PROCEDURE nuevoOficio(job_id IN jobs.job_id%TYPE, job_title IN jobs.job_title%TYPE, min_salary IN jobs.min_salary%TYPE, max_salary IN jobs.max_salary%TYPE) AS
BEGIN
IF min_salary > max_salary THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: El salario minimo es mayor que el maximo.');
    
ELSIF min_salary < 0 THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: El valor de salario no puede ser negativo.');

ELSE
    INSERT INTO JOBS 
        VALUES(job_id, job_title, min_salary, max_salary);
END IF;
END;
/

DECLARE
jobId jobs.job_id%TYPE := '&JOB_ID';
jobTitle jobs.job_title%TYPE := '&JOB_TITLE';
minSalary jobs.min_salary%TYPE := &MIN_SALARY;
maxSalary jobs.max_salary%TYPE := &MAX_SALARY;

BEGIN
nuevoOficio(jobId, JobTitle, minSalary, maxSalary);
END;
/

*/
-- 4.-
/*

CREATE OR REPLACE PROCEDURE bajaOficio(jobId IN VARCHAR2) AS
BEGIN
DELETE FROM JOBS 
WHERE JOB_ID = jobId;
END;
/

DECLARE
jobId jobs.job_id%TYPE := '&jobId';

BEGIN
bajaOficio(jobId);
END;
/

*/
-- 5.-
/*

CREATE OR REPLACE FUNCTION contar(departamento IN employees.department_id%TYPE) RETURN NUMBER AS
cantEmpleados NUMBER;
BEGIN
SELECT COUNT(*) INTO cantEmpleados FROM EMPLOYEES WHERE DEPARTMENT_ID = departamento;
RETURN cantEmpleados;
END;
/

DECLARE
departamento employees.department_id%TYPE := &NumeroDepartamento;

BEGIN
    DBMS_OUTPUT.PUT_LINE(contar(departamento));
END;
/

*/