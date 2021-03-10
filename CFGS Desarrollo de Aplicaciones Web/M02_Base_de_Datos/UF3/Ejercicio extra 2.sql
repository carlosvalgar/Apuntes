SET SERVEROUTPUT ON;

/*

Procedimiento que permita cambiar el manager de un empleado por otro. Hay que controlar que el manager insertado no sea el mismo que ya tiene el empleado, 
y además hay que controlar que el manager pertenezca al mismo departamento del empleado. El procedimiento necesitará como parametros de entrada el id del empleado y el id del manager.

*/
CREATE OR REPLACE PROCEDURE cambio_manager(id_empleado employees.employee_id%TYPE, id_manager employees.manager_id%TYPE) AS
data_empleado employees%ROWTYPE;
departament_manager employees.department_id%TYPE;
BEGIN
    SELECT manager_id, department_id INTO data_empleado.manager_id, data_empleado.department_id FROM employees WHERE employee_id = id_empleado;
    SELECT department_id INTO departament_manager FROM employees WHERE employee_id = id_manager;
    
    IF id_manager != data_empleado.manager_id AND data_empleado.department_id = departament_manager THEN
        UPDATE employees
        SET manager_id = id_manager
        WHERE employee_id = id_empleado;
        DBMS_OUTPUT.PUT_LINE('Cambio de manager realizado con exito.');
        
    ELSIF id_manager = data_empleado.manager_id THEN
        DBMS_OUTPUT.PUT_LINE('El manager que intentas introducir es el que ya tiene el empleado.');
        
    ELSIF data_empleado.department_id != departament_manager THEN
        DBMS_OUTPUT.PUT_LINE('El manager que intentas introducir no esta en el mismo departamento.');
        
    END IF;
END;
/

BEGIN
cambio_manager(102, 100);
END;

select employee_id, manager_id, department_id from employees;