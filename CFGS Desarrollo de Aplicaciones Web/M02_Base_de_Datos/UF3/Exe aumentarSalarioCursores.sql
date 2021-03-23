SET SERVEROUTPUT ON;
-- Ejercicio cursores: Incrementar el salario de los trabajadores un 15% si tienes un antigüedad en la empresa entre 10 y 15 años o un 20% si tienen más de 15 años de antigüedad.
DECLARE
CURSOR c_antiguedad IS
SELECT employee_id, FLOOR((SYSDATE - HIRE_DATE)/365) AS Antiguedad FROM employees;
var_antiguedad c_antiguedad%ROWTYPE;
var_aumento NUMBER;

BEGIN
OPEN c_antiguedad;
    LOOP
    FETCH c_antiguedad INTO var_antiguedad;
    EXIT WHEN c_antiguedad%NOTFOUND;
    IF var_antiguedad.Antiguedad >= 10 AND var_antiguedad.Antiguedad <= 15 THEN
        UPDATE EMPLOYEES
        SET salary = salary * 1.15
        WHERE employee_id = var_antiguedad.employee_id;
    ELSIF var_antiguedad.Antiguedad > 15 THEN
        UPDATE EMPLOYEES
        SET salary = salary * 1.20
        WHERE employee_id = var_antiguedad.employee_id;
    END IF;
    END LOOP;
CLOSE c_antiguedad;
END;
/