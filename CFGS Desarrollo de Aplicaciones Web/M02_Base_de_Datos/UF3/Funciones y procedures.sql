SET SERVEROUTPUT ON;
/*
-- Hacer un procedimiento almacenado que inserte una region, que compruebe que el id de region a insertar sea el siguiente al ultimo insertado

CREATE OR REPLACE PROCEDURE insert_region(varRegion_ID regions.region_id%TYPE, varRegion_name regions.region_name%TYPE) AS
varMax_id NUMBER;

BEGIN
    SELECT MAX(region_id)INTO varMax_id FROM regions;
    IF varRegion_ID != (varMax_id + 1) THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: El valor de Region_ID tiene que ser '||(varMax_id + 1));
    ELSE
        INSERT INTO REGIONS
        VALUES(varRegion_ID, varRegion_name);
    END IF;
END;
/

BEGIN
insert_region(5, 'asia');
END;
/
*/
-- Hacer un procedimiento para insertar un trabajador y que compruebe que el trabajo exista y el departamento este en tokyo
CREATE OR REPLACE PROCEDURE insert_employee(varEmployee_ID employees.employee_ID%TYPE, varFirst_name employees.first_name%TYPE := NULL, varLastName employees.last_name%TYPE := 'cognomprueba', varEmail employees.email%TYPE := 'emailprueba', 
varPhone_number employees.phone_number%TYPE := NULL, varHire_date employees.hire_date%TYPE := '01/01/01', varJob_id employees.job_id%TYPE, varSalary employees.salary%TYPE := NULL, varCommission employees.commission_pct%TYPE := NULL,
varManager_ID employees.manager_id%TYPE := NULL, varDepartment_ID employees.department_ID%TYPE) AS

varAuxDepartment departments.department_ID%TYPE;
varAuxJobs NUMBER;

BEGIN
    SELECT departments.DEPARTMENT_ID INTO varAuxDepartment FROM locations INNER JOIN departments ON departments.location_id = locations.location_id WHERE locations.city = 'Oxford';
    SELECT count(*)INTO varAuxJobs FROM JOBS WHERE job_id = varJob_id;
    
    IF varDepartment_ID != varAuxDepartment THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: El departamento que intentas introducir no esta en Oxford.');
        
    ELSIF varAuxJobs < 1 THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: El trabajo que intentas introducir no existe');
        
    ELSE
        INSERT INTO EMPLOYEES
        VALUES(varEmployee_ID, varFirst_name, varLastName, varEmail, varPhone_number, varHire_date, varJob_id, varSalary, varCommission, varManager_ID, varDepartment_ID);
    END IF;

END;
/

BEGIN
    insert_employee(varEmployee_ID => 540, varJob_id => 'PU_CLERK', varDepartment_ID => 80);
END;
/

-- Creamos una función que recibe como parámetro, el numero de departamento, el código de empleo y una variable que especifica el tipo de salario que se quiere retornar; Según se especifique en el tercer parámetro, la función retornaría el salario mayor, menor o ambos(string concatenado) de dicho empleo en el departamento indicado.
CREATE OR REPLACE FUNCTION max_min_salary(varNumDepartamento employees.department_ID%TYPE, varCodigoEmpleo employees.job_ID%TYPE, varReturn VARCHAR2 := 'minmax') RETURN VARCHAR2 AS
minSalary VARCHAR2(25);
maxSalary VARCHAR2(25);
BEGIN
    IF varReturn = 'min' THEN
        SELECT MIN(salary) INTO minSalary FROM employees WHERE department_ID = varNumDepartamento AND job_ID = varCodigoEmpleo;
        RETURN ('Salario Mínimo: '||minSalary);
        
    ELSIF varReturn = 'max' THEN
        SELECT MAX(salary) INTO maxSalary FROM employees WHERE department_ID = varNumDepartamento AND job_ID = varCodigoEmpleo;
        RETURN ('Salario Máximo: '||maxSalary);
        
    ELSIF varReturn = 'minmax' THEN
        SELECT MIN(salary), MAX(salary) INTO minSalary, maxSalary FROM employees WHERE department_ID = varNumDepartamento AND job_ID = varCodigoEmpleo;
        RETURN ('Salario Mínimo: '||minSalary||' Salario Máximo: '||maxSalary);
        
    ELSE
        RETURN 'Valor no válido.';
        
    END IF;
END;
/

BEGIN
DBMS_OUTPUT.PUT_LINE(max_min_salary(50, 'SH_CLERK', 'min'));
DBMS_OUTPUT.PUT_LINE(max_min_salary(50, 'SH_CLERK', 'max'));
DBMS_OUTPUT.PUT_LINE(max_min_salary(50, 'SH_CLERK', 'minmax'));
END;
/

-- 


