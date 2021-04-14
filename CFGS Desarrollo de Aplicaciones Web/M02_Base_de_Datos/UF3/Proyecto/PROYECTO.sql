-- El nom del client ha de ser d’entrada obligatòria. La data de naixement no pot ser més gran a l’actual.
/*
CREATE OR REPLACE TRIGGER tr_alta_clients
BEFORE INSERT on customer
FOR EACH ROW
    BEGIN
        IF :new.customer_name is NULL THEN
            RAISE_APPLICATION_ERROR(-20001, 'ERROR: El campo de nombre de cliente no puede estar vacío.');
        ELSIF :new.born_date > SYSDATE THEN
            RAISE_APPLICATION_ERROR(-20002, 'ERROR: La fecha de nacimiento no puede ser superior a la fecha de hoy.');
        END IF;
END tr_alta_clients;
/
*/

-- Consulta que mostri els clients que siguin d’un codi postal que introdueixi l’usuari per teclat (CONSULTA CLIENTS CP)(Carlos).
CREATE OR REPLACE PROCEDURE consulta_clients_cp(codigo_postal NUMBER) AS
    CURSOR c_clientes IS
    SELECT * FROM customer WHERE customer_cp = codigo_postal;
    v_client customer%ROWTYPE;
    v_cantidad_clientes NUMBER;
    exception_longitud_cp EXCEPTION;
    exception_sin_clientes EXCEPTION;
    BEGIN
    SELECT COUNT(*) INTO v_cantidad_clientes FROM customer WHERE customer_cp = codigo_postal;
    IF LENGTH(codigo_postal) != 5 THEN
        RAISE exception_longitud_cp;
    ELSIF v_cantidad_clientes = 0 THEN
        RAISE exception_sin_clientes;
    END IF;
            DBMS_OUTPUT.PUT_LINE('============================================
  Clientes con Codigo Postal '||codigo_postal||'
============================================');
        FOR i IN c_clientes
        LOOP
        DBMS_OUTPUT.PUT_LINE('    Código del cliente: '||i.customer_code||'
    Nombre del cliente: '||i.customer_name||'
    Dirección: '||i.customer_address||'
    Código postal: '||i.customer_cp||'
    Fecha de nacimiento: '||i.born_date||'
    Email: '||i.email||'
============================================');
        END LOOP;
    EXCEPTION
        WHEN exception_longitud_cp THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: El código postal tiene que ser de 5 cifras.');
        WHEN exception_sin_clientes THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: No hay ningún cliente con ese Código Postal.');
END consulta_clients_cp;
/

BEGIN
    consulta_clients_cp(43221);
END;
/
