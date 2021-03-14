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
VARIABLE employee_id_user NUMBER;

DECLARE
nombre_empleado employees.first_name%TYPE;
apellido_empleado employees.last_name%TYPE;
salario_empleado employees.salary%TYPE;

BEGIN
    :employee_id_user := &introduce_id_employee_a_buscar;
    SELECT first_name, last_name, salary INTO nombre_empleado, apellido_empleado, salario_empleado FROM employees WHERE employee_id = :employee_id_user;
    DBMS_OUTPUT.PUT_LINE('nom---------------- '||'cognoms------------ '||'salari----------');
    DBMS_OUTPUT.PUT_LINE(rpad(nombre_empleado, 20)||rpad(apellido_empleado, 20)||to_char(salario_empleado, 'fm999g999d00'));
END;
/

-- Exe 3.-
VARIABLE employee_id_user NUMBER;
DECLARE
datos_empleado employees%ROWTYPE;
BEGIN
    :employee_id_user := &introduce_id_employee_a_buscar;
    SELECT first_name, last_name, salary INTO datos_empleado.first_name, datos_empleado.last_name, datos_empleado.salary FROM employees WHERE employee_id = :employee_id_user;
    DBMS_OUTPUT.PUT_LINE('nom---------------- '||'cognoms------------ '||'salari----------');
    DBMS_OUTPUT.PUT_LINE(rpad(datos_empleado.first_name, 20)||rpad(datos_empleado.last_name, 20)||to_char(datos_empleado.salary, 'fm999g999d00'));
END;
/

-- Exe 4.-
DECLARE
var_departments departments%ROWTYPE;
var_employees employees%ROWTYPE;

BEGIN
var_departments.department_name := '&nom_departament';
SELECT manager_id INTO var_departments.manager_id FROM departments WHERE department_name = var_departments.department_name;
SELECT first_name, last_name INTO var_employees.first_name, var_employees.last_name FROM employees WHERE employee_id = var_departments.manager_id;
    DBMS_OUTPUT.PUT_LINE('nom_departament-----'||'nom---------------- '||'cognoms------------ ');
    DBMS_OUTPUT.PUT_LINE(rpad(var_departments.department_name, 20)||rpad(var_employees.first_name, 20)||var_employees.last_name);
END;
/

-- 5.-

VARIABLE var_job_id VARCHAR2(50);
VARIABLE var_job_title VARCHAR2(50);
VARIABLE var_min_salary NUMBER;
VARIABLE var_max_salary NUMBER;

BEGIN
:var_job_id := '&job_id';
:var_job_title := '&job_title';
:var_min_salary := &min_salary;
:var_max_salary := &max_salary;
IF LENGTH(:var_job_id) < 5 OR LENGTH(:var_job_id) > 10 THEN
    DBMS_OUTPUT.PUT_LINE('Job_id Demasiado corto o demasiado largo.');
ELSIF LENGTH(:var_job_title) < 5 OR LENGTH(:var_job_title) > 35 THEN
    DBMS_OUTPUT.PUT_LINE('Job_title Demasiado largo.');
ELSIF :var_min_salary < 0 THEN
    DBMS_OUTPUT.PUT_LINE('Min_salary debe ser positivo.');
ELSIF :var_max_salary < :var_min_salary THEN
    DBMS_OUTPUT.PUT_LINE('Max_salary debe ser igual o mayor que min_salary.');
ELSE
    INSERT INTO jobs
    VALUES(:var_job_id, :var_job_title, :var_min_salary, :var_max_salary);
END IF;
END;
/

-- 6.-
DECLARE
var_job_id jobs.job_id%TYPE;

BEGIN
var_job_id := '&job_id_eliminar';
DELETE FROM jobs
WHERE job_id = var_job_id;
IF SQL%FOUND = TRUE THEN
    DBMS_OUTPUT.PUT_LINE('Se han eliminado '||SQL%ROWCOUNT||' registros.');
ELSE
    DBMS_OUTPUT.PUT_LINE('No se ha eliminado ningún registro.');
END IF;
END;
/

-- 7.-
CREATE OR REPLACE FUNCTION quant_emp_dep(nom_departament departments.department_name%TYPE) RETURN NUMBER AS
var_count NUMBER;
BEGIN
SELECT COUNT(*) INTO var_count FROM departments INNER JOIN employees ON employees.department_id = departments.department_id WHERE departments.department_name = nom_departament;
RETURN var_count;
END;
/

VARIABLE var_nom_departament VARCHAR2(50);
BEGIN
:var_nom_departament := '&Nom_departament';
DBMS_OUTPUT.PUT_LINE('Quantitat de empleats en el departament '||:var_nom_departament||': '||quant_emp_dep(:var_nom_departament));
END;
/

-- 8.-
CREATE OR REPLACE FUNCTION salari_total_dep(nom_departament departments.department_name%TYPE) RETURN NUMBER AS
var_salari NUMBER;
BEGIN
SELECT SUM(employees.salary) INTO var_salari FROM departments INNER JOIN employees ON employees.department_id = departments.department_id WHERE departments.department_name = nom_departament;
RETURN var_salari;
END;
/

VARIABLE var_nom_departament VARCHAR2(50);
BEGIN
:var_nom_departament := '&Nom_departament';
DBMS_OUTPUT.PUT_LINE('La suma total de salari en el departament '||:var_nom_departament||' és: '||salari_total_dep(:var_nom_departament));
END;
/

-- 9.-
DECLARE
var_employee_id employees.employee_id%TYPE;
var_bool NUMBER;
var_commission_pct employees.commission_pct%TYPE;

BEGIN
var_employee_id := &employee_id;
SELECT COUNT(*) INTO var_bool FROM employees WHERE employee_id = var_employee_id AND (job_id = 'SA_REP' OR job_id = 'SA_MAN');
SELECT commission_pct INTO var_commission_pct FROM employees WHERE employee_id = var_employee_id;
IF var_bool > 0 THEN
    IF var_commission_pct <= 0.1 THEN
        UPDATE employees
        SET commission_pct = commission_pct + 0.03
        WHERE employee_id = var_employee_id;
    ELSIF var_commission_pct <= 0.2 THEN
        UPDATE employees
        SET commission_pct = commission_pct + 0.02
        WHERE employee_id = var_employee_id;
    ELSIF var_commission_pct <= 0.3 THEN
        UPDATE employees
        SET commission_pct = commission_pct + 0.01
        WHERE employee_id = var_employee_id;
    END IF;
ELSE
DBMS_OUTPUT.PUT_LINE('No existe un trabajador con id '||var_employee_id||' que pertenezca al departamento SA_REP o SA_MAN.');
END IF;
END;
/