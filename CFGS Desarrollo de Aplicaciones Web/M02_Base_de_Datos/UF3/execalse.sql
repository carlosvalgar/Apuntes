SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION anios_dif ( 
fecha1 DATE,
fecha2 DATE)
RETURN NUMBER
AS
v_anios_dif NUMBER(6);
BEGIN
v_anios_dif := ABS(TRUNC(MONTHS_BETWEEN(fecha2,fecha1)
/ 12));
RETURN v_anios_dif;
END anios_dif;
/

CREATE OR REPLACE FUNCTION trienios ( 
fecha1 DATE,
fecha2 DATE)
RETURN NUMBER
AS
v_trienios NUMBER(6);
BEGIN
v_trienios := TRUNC(anios_dif(fecha1,fecha2) / 3);
RETURN v_trienios;
END;
/

CREATE OR REPLACE PROCEDURE liquidacion AS
CURSOR c_empleados IS
SELECT employee_id, last_name, department_id, job_id, salary, hire_date, NVL(to_char(commission_pct, 'fm90.99'), 0) AS commission_pct FROM employees ORDER BY last_name;
v_trienios NUMBER;
v_comp_responsabil NUMBER;
v_total NUMBER;

BEGIN
FOR i IN c_empleados
    LOOP
        v_trienios := trienios(i.hire_date, sysdate) * 50;
        SELECT COUNT(*) INTO v_comp_responsabil FROM employees WHERE manager_id = i.employee_id;
        v_comp_responsabil := v_comp_responsabil * 100;
        v_total := i.salary + v_trienios + v_comp_responsabil;
        DBMS_OUTPUT.PUT_LINE('Liquidación del empleado: '||i.last_name);
        DBMS_OUTPUT.PUT_LINE('Dpto: '||i.department_id);
        DBMS_OUTPUT.PUT_LINE('Oficio: '||i.job_id);
        DBMS_OUTPUT.PUT_LINE('Salario: '||i.salary);
        DBMS_OUTPUT.PUT_LINE('Trienios: '||v_trienios);
        DBMS_OUTPUT.PUT_LINE('Comp. Responsabil.: '|| v_comp_responsabil);
        DBMS_OUTPUT.PUT_LINE('Comisión: '||i.commission_pct);
        DBMS_OUTPUT.PUT_LINE('Total: '||v_total);
        DBMS_OUTPUT.PUT_LINE('--------------------');

    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: No se han encontrado datos.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado.');
        ROLLBACK;
        
END;
/
BEGIN
liquidacion();
END;
/

CREATE TABLE h_liquidacion(
empleado VARCHAR2(50),
departamento NUMBER,
oficio VARCHAR2(50),
salario NUMBER,
com_trienios NUMBER,
comp_responsabilidad NUMBER,
comision NUMBER,
total NUMBER
);
/
select * from h_liquidacion;