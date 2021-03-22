SET SERVEROUTPUT ON;
CREATE SEQUENCE sec_num_venedor
START WITH 32
INCREMENT BY 1
MAXVALUE 99999
MINVALUE 1;

CREATE OR REPLACE FUNCTION validar_dni(nif vendedor.dni%TYPE) RETURN NUMBER AS
varBool NUMBER;

BEGIN
    IF LENGTH(nif) != 9 THEN
        RETURN -1;
    END IF;
    SELECT VALIDATE_CONVERSION(SUBSTR(nif, 1, 1) AS NUMBER) test1 INTO varBool FROM dual;
    IF varBool = 1 THEN
        IF SUBSTR(nif, 9, 1) = SUBSTR('TRWAGMYFPDXBNJZSQVHLCKE', MOD(TO_NUMBER(SUBSTR(nif, 1, 8)), 23) + 1, 1 ) THEN
            RETURN 1;
        ELSE
             RETURN -1;
        END IF;
    ELSE
        IF SUBSTR(nif, 1, 1) = SUBSTR('XYZAGMYFPDXBNJZSQVHLCKE', MOD(TO_NUMBER(SUBSTR(nif, 2, 9)), 23) + 1, 1 ) THEN
            RETURN 1;
        ELSE
             RETURN -1;
        END IF;
    END IF;
END;
/


DECLARE
var_num_venedor NUMBER;
var_DNI VARCHAR(10);
var_bool_dni NUMBER;
var_nombre VARCHAR2(50);
var_cod_oficina NUMBER;
var_bool_cod_oficina NUMBER;
var_director NUMBER;
var_bool_director NUMBER;
var_objetivos NUMBER;
var_ventas NUMBER;


BEGIN
var_num_venedor := sec_num_venedor.NEXTVAL;
var_DNI := '&Introduce_DNI';
var_bool_dni := validar_dni(var_DNI);
var_nombre := '&Introduce_el_nombre';
var_cod_oficina := &Introduce_codigo_oficina;
SELECT COUNT(*) INTO var_bool_cod_oficina FROM OFICINA WHERE cod_oficina = var_cod_oficina;
var_director := &Introduce_el_codigo_del_director;
SELECT COUNT(*) INTO var_bool_director FROM vendedor WHERE num_vendedor = var_director;
var_objetivos := &Introduce_objetivos;
var_ventas := &Introduce_ventas;

IF var_num_venedor <= 0 THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: El número de vendedor no puede ser 0 o negativo.');
ELSIF var_bool_dni = -1 THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: El DNI no tiene el formato correcto.');
ELSIF var_cod_oficina IS NULL THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: El codigo de oficina no puede ser nulo.');
ELSIF var_bool_cod_oficina = 0 THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: El codigo de oficina no existe.');
ELSIF var_bool_director = 0 THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: Ese empleado no existe y por lo tanto no puede ser director.');
ELSIF var_objetivos <= 0 THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: El valor de objetivos tiene que ser mayor que 0.');
ELSIF var_ventas <= 0 THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: El valor de ventas tiene que ser mayor que 0.');
ELSE
    DBMS_OUTPUT.PUT_LINE('Introduciendo nuevo empleado.');
    INSERT INTO vendedor
    VALUES(var_num_venedor, var_DNI, var_nombre, var_cod_oficina, SYSDATE, var_director, var_objetivos, var_ventas);

END IF;
END;
/
