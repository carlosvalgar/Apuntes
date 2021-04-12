/*
CREATE TABLE empleados
(dni char(9) PRIMARY KEY,
nomemp varchar2(50),
jefe char(9),
departamento integer,
salario number(9,2) DEFAULT 1000,
usuario varchar2(50),
fecha date,
FOREIGN KEY (jefe) REFERENCES empleados (dni)
);

CREATE TABLE empleados_baja (
dni char(9) PRIMARY KEY,
nomemp varchar2(50),
jefe char(9),
departamento integer,
salario number(9,2) DEFAULT 1000,
usuario varchar2(50),
fecha date
);

INSERT INTO EMPLEADOS VALUES('47952986X', 'Carlos', NULL, 1, 2000, USER, SYSDATE);
INSERT INTO EMPLEADOS VALUES('12345678A', 'Pepe1', '47952986X', 1, 1000, USER, SYSDATE);
INSERT INTO EMPLEADOS VALUES('12345678B', 'Pepe2', '47952986X', 1, 1000, USER, SYSDATE);
INSERT INTO EMPLEADOS VALUES('12345678C', 'Pepe3', '47952986X', 1, 1000, USER, SYSDATE);
INSERT INTO EMPLEADOS VALUES('12345678D', 'Pepe4', '47952986X', 1, 1000, USER, SYSDATE);
INSERT INTO EMPLEADOS VALUES('12345678E', 'Pepe5', '47952986X', 1, 1000, USER, SYSDATE);
*/

-- 1.- Crear un trigger sobre la tabla EMPLEADOS para que no se permita que un empleado sea jefe de más de cinco empleados.
/*
CREATE OR REPLACE TRIGGER tr_jefe_cinco_empleados
BEFORE INSERT OR UPDATE ON empleados
FOR EACH ROW
DECLARE
v_contador NUMBER;
BEGIN
SELECT COUNT(*) INTO v_contador FROM empleados WHERE UPPER(jefe) = UPPER(:new.jefe);
IF v_contador >= 5 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Un jefe no puede tener más de 5 empleados a su cargo.');
END IF;
END tr_jefe_cinco_empleados;

INSERT INTO EMPLEADOS VALUES('12345678F', 'Pepe6', '47952986X', 1, 1000, USER, SYSDATE);
*/

-- 2.- Crear un trigger para impedir que se aumente el salario de un empleado en más de un 20%. Es necesario comparar los valores :old.salario y :new.salario cada vez que se modifica el atributo salario (BEFORE UPDATE).
/*
CREATE OR REPLACE TRIGGER tr_subida_maxima_sueldo
BEFORE UPDATE ON EMPLEADOS
FOR EACH ROW
BEGIN
IF :new.salario > (:old.salario * 1.2) THEN
    RAISE_APPLICATION_ERROR(-20002, 'No se puede incrementar el salario más del 20%');
END IF;
END tr_subida_maxima_sueldo;

UPDATE EMPLEADOS SET SALARIO = 1500 WHERE DNI = '12345678E';
*/

-- 3.- Crear un trigger que inserte una fila en la tabla empleados_baja cuando se borre una fila en la tabla empleados. Los datos que se insertan son los del empleado que se da de baja en la tabla empleados, salvo en las columnas usuario y fecha se grabarán las variables del sistema USER y SYSDATE que almacenan el usuario y fecha actual.
/*
CREATE OR REPLACE TRIGGER tr_empleados_baja
AFTER DELETE ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO empleados_baja VALUES(:old.dni, :old.nomemp, :old.jefe, :old.departamento, :old.salario, USER, SYSDATE);
END tr_empleados_baja;

DELETE FROM empleados WHERE DNI = '12345678E';

select * from empleados_baja;
*/

-- 4.- Crear un trigger para impedir que, al insertar un empleado, el empleado y su jefe puedan pertenecer a departamentos distintos.
/*
CREATE OR REPLACE TRIGGER tr_mismo_departamento
BEFORE INSERT ON EMPLEADOS
FOR EACH ROW
DECLARE
v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM empleados WHERE departamento = (:new.departamento) AND UPPER(dni) = UPPER(:new.jefe);
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'El jefe y el empleado deben pertenecer al mismo departamento.');
    END IF;
END tr_mismo_departamento;

INSERT INTO EMPLEADOS VALUES('12345678F', 'Pepe6', '47952986X', 2, 1000, USER, SYSDATE);
INSERT INTO EMPLEADOS VALUES('12345678F', 'Pepe6', '47952986X', 1, 1000, USER, SYSDATE);
*/

-- 5.- Crear un trigger para impedir que, al insertar un empleado, la suma de los salarios de los empleados pertenecientes al departamento del empleado insertado supere los 10.000 euros.
/*
CREATE OR REPLACE TRIGGER tr_salario_departamento
BEFORE INSERT ON EMPLEADOS
FOR EACH ROW
DECLARE
v_sum_salario NUMBER;
BEGIN
    SELECT SUM(salario) INTO v_sum_salario FROM EMPLEADOS WHERE departamento = :new.departamento;
    v_sum_salario := v_sum_salario + :new.salario; 
    IF v_sum_salario > 10000 THEN
        RAISE_APPLICATION_ERROR(-20003, 'La suma de salarios de un departamento no puede superar los 10.000.');
    END IF;
END tr_salario_departamento;

INSERT INTO EMPLEADOS VALUES('12345678G', 'Pepe7', '47952986X', 1, 10000, USER, SYSDATE);
*/







