SET SERVEROUTPUT ON;

DECLARE
CURSOR cursorEmpleados IS
    SELECT * FROM employees ORDER BY department_id, last_name;

varEmpleado cursorEmpleados%ROWTYPE;
varDepartamento employees.job_id%TYPE := '**';

totalEmpleadosDepartamento NUMBER := 0;
totalSalariosDepartamento employees.salary%TYPE := 0;

totalEmpleados NUMBER := 0;
totalSalarios employees.salary%TYPE := 0;

BEGIN

OPEN cursorEmpleados;
    LOOP
        FETCH cursorEmpleados INTO varEmpleado;
            EXIT WHEN cursorEmpleados%NOTFOUND;
            IF varDepartamento != varEmpleado.job_id THEN
                IF varDepartamento != '**' THEN
                DBMS_OUTPUT.PUT_LINE('
***********************************
'||'Personas en el departamento: '||totalEmpleadosDepartamento||' 
Gasto en salarios: '||totalSalariosDepartamento||'
***********************************
');
                END IF;
                varDepartamento := varEmpleado.job_id;
                totalEmpleados := totalEmpleados + totalEmpleadosDepartamento;
                totalSalarios := totalSalarios + totalSalariosDepartamento;
                totalEmpleadosDepartamento := 0;
                totalSalariosDepartamento := 0;
                DBMS_OUTPUT.PUT_LINE('===================================
                '||varDepartamento||'
===================================');
            END IF;
            totalEmpleadosDepartamento := totalEmpleadosDepartamento + 1;
            totalSalariosDepartamento := totalSalariosDepartamento + varEmpleado.salary;
            DBMS_OUTPUT.PUT_LINE('Apellido: '||varEmpleado.last_name||' || Salario: '||varEmpleado.salary);
    END LOOP;
CLOSE cursorEmpleados;
                DBMS_OUTPUT.PUT_LINE('
***********************************
'||'Personas en el departamento: '||totalEmpleadosDepartamento||' 
Gasto en salarios: '||totalSalariosDepartamento||'
***********************************

===================================
Total de personas: '||totalEmpleados||'
Gasto total en salarios: '||totalSalarios||'
===================================');
END;