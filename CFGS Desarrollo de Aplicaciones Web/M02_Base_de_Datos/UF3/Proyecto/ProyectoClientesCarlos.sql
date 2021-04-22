-- El nom del client ha de ser d’entrada obligatòria. La data de naixement no pot ser més gran a l’actual.
/*
CREATE OR REPLACE TRIGGER tr_alta_clients
BEFORE INSERT ON customer
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
/*
-- Consulta que mostri els clients que siguin d’un codi postal que introdueixi l’usuari per teclat (CONSULTA CLIENTS CP).
CREATE OR REPLACE PROCEDURE consulta_clients_cp(codigo_postal CUSTOMER.CUSTOMER_CP%TYPE) AS
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
            DBMS_OUTPUT.PUT_LINE('ERROR: El código postal tiene que ser de 5 cifras, has introducido uno de '||LENGTH(codigo_postal)||'.');
        WHEN exception_sin_clientes THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: No hay ningún cliente con el Codigo Postal: '||codigo_postal||'.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inesperado.');
END consulta_clients_cp;
/
*/
/*
-- Baixa client: donar de baixa el client que l’usuari desitgi, tenint en compte si existeix o no. En cas d’existir s’ha d’anar en compte si està relacionat en una altra taula, i per tant, s’ha de donar el missatge corresponent de què no es pot esborrar.
CREATE OR REPLACE PROCEDURE baixa_clients(codigo_cliente CUSTOMER.CUSTOMER_CODE%TYPE) AS 
    v_cliente_existe NUMBER;
    exc_inexistente EXCEPTION;
    exc_foreign_key EXCEPTION;
    PRAGMA EXCEPTION_INIT(exc_foreign_key, -2292);
    BEGIN
        SELECT COUNT(*) INTO v_cliente_existe FROM CUSTOMER WHERE CUSTOMER_CODE = codigo_cliente;
        IF v_cliente_existe = 0 THEN
            RAISE exc_inexistente;
        END IF;
        DELETE FROM CUSTOMER WHERE CUSTOMER_CODE = codigo_cliente;
        DBMS_OUTPUT.PUT_LINE('Cliente con codigo '||codigo_cliente||' borrado con exito.');
        EXCEPTION
            WHEN exc_inexistente THEN
                DBMS_OUTPUT.PUT_LINE('El cliente que intentas eliminar (codigo: '||codigo_cliente||') no existe.');
            WHEN exc_foreign_key THEN
                DBMS_OUTPUT.PUT_LINE('El cliente que intentas eliminar (codigo: '||codigo_cliente||') existe en otra tabla y por lo tanto no se puede eliminar.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error inesperado');
    END baixa_clients;
/
*/