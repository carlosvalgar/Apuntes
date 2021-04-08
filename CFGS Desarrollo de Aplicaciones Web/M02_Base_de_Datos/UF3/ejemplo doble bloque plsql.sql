CREATE TABLE t_liquidacion ( 
APELLIDO VARCHAR2(20), 
DEPARTAMENTO NUMBER(2), 
OFICIO VARCHAR2(10), 
SALARIO NUMBER(10), 
TRIENIOS NUMBER(10), 
COMP_RESPONSABILIDAD NUMBER(10), 
COMISION NUMBER(10), 
TOTAL NUMBER(10) 
);



CREATE OR REPLACE PROCEDURE liquidar2 
AS
CURSOR c_emp IS
SELECT last_name, EMPLOYEE_ID, JOB_ID, SALARY,
NVL(COMMISSION_PCT,0) COMMISSION_PCT, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
ORDER BY LAST_NAME;
vr_emp c_emp%ROWTYPE;
v_trien NUMBER(9) DEFAULT 0;
v_comp_r NUMBER(9);
v_total NUMBER(10);
BEGIN
COMMIT;-- CON ESTE BEGIN CONTROLAMOS EL ROLLBACK
FOR vr_emp in c_emp LOOP
/* Calcular trienios. Llama a la función trienios 
creada en el ejercicio 11.8 */ 
v_trien := trienios(vr_emp.HIRE_DATE,SYSDATE)*5000;
/* Calcular complemento de responsabilidad. Se 
encierra en un bloque pues levantará NO_DATA_FOUND*/
BEGIN
SELECT COUNT(*) INTO v_comp_r
FROM EMPLOYEES WHERE MANAGER_ID = vr_emp.EMPLOYEE_ID;
v_comp_r := v_comp_r *10000;
EXCEPTION
WHEN NO_DATA_FOUND THEN
v_comp_r:=0;
END;
/* Calcular el total del empleado */ 
v_total := vr_emp.SALARY + vr_emp. COMMISSION_PCT +
v_trien + v_comp_r;
/* Insertar los datos en la tabla T_liquidacion */ 
DBMS_OUTPUT.PUT_LINE(vr_emp.LAST_NAME);
INSERT INTO t_liquidacion 
(APELLIDO, OFICIO, SALARIO, TRIENIOS, 
COMP_RESPONSABILIDAD, COMISION, TOTAL)
VALUES
(vr_emp.LAST_NAME, vr_emp.JOB_ID, vr_emp.SALARY,
v_trien, v_comp_r, vr_emp.COMMISSION_PCT, v_total);
END LOOP;
EXCEPTION
WHEN OTHERS THEN
ROLLBACK;

END liquidar2;