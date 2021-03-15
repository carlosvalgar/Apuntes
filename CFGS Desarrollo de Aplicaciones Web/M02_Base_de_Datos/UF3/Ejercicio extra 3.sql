SET SERVEROUTPUT ON;

-- 3 Funcion manager_job_history que a partir de un codigo de departamento como dato de entrada, permita saber cuantos manager de cada departamento aparecen en la tabla job_history.

CREATE OR REPLACE FUNCTION manager_job_history(codigo_departamento job_history.department_id%TYPE) RETURN NUMBER AS
varCount NUMBER;
BEGIN
    SELECT COUNT(*) INTO varCount FROM job_history WHERE department_id = codigo_departamento AND employee_id IN (SELECT DISTINCT employees.manager_id  FROM employees INNER JOIN job_history ON job_history.employee_id = employees.manager_id);
    RETURN varCount;
END;
/

SELECT department_name, manager_job_history(department_id)
FROM departments;