-- Triggers de Gestió de Clients
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

CREATE OR REPLACE TRIGGER tr_modificar_clients
BEFORE UPDATE ON customer
FOR EACH ROW
    BEGIN
        IF :new.customer_name != :old.customer_name THEN
            RAISE_APPLICATION_ERROR(-20003, 'ERROR: El nombre del cliente no se puede modificar.');
        ELSIF :new.born_date > :old.born_date then
            RAISE_APPLICATION_ERROR(-20004, 'ERROR: La nueva fecha de nacimiento no puede ser mayor que la fecha existente');
        ELSIF :new.born_date < :old.born_date then
            RAISE_APPLICATION_ERROR(-20005, 'ERROR: La nueva fecha de nacimiento no puede ser menor que la fecha existente');
        ELSIF :old.email is NOT NULL then
            RAISE_APPLICATION_ERROR(-20006, 'ERROR: El email no se puede modificar si no es nulo');
        END IF;
END modificar_cliente;
/

-- Package de Gestió de clients
CREATE OR REPLACE PACKAGE GESTIO_CLIENT AS
    PROCEDURE ALTA_CLI(CODIGO CUSTOMER.CUSTOMER_CODE%TYPE,
        NOMBRE CUSTOMER.CUSTOMER_NAME%TYPE,
        DIRECCION CUSTOMER.CUSTOMER_ADDRESS%TYPE,
        CP CUSTOMER.CUSTOMER_CP%TYPE,
        FECHA_NACIMIENTO CUSTOMER.BORN_DATE%TYPE,
        CORREO CUSTOMER.EMAIL%TYPE);
    PROCEDURE baixa_clients(codigo_cliente CUSTOMER.CUSTOMER_CODE%TYPE);
    PROCEDURE modClients(var_codigo_customer in customer.customer_code%TYPE, opciones in number, mod_ in varchar2);
    PROCEDURE mostrarDades_client;
    PROCEDURE mostrarClients;
    PROCEDURE consulta_cliente_correo(mail customer.email%type);
    PROCEDURE consulta_clients_cp(codigo_postal CUSTOMER.CUSTOMER_CP%TYPE);
END GESTIO_CLIENT;
/

CREATE OR REPLACE PACKAGE BODY GESTIO_CLIENT AS
-- Alta de client
PROCEDURE ALTA_CLI (CODIGO CUSTOMER.CUSTOMER_CODE%TYPE,
    NOMBRE CUSTOMER.CUSTOMER_NAME%TYPE,
    DIRECCION CUSTOMER.CUSTOMER_ADDRESS%TYPE,
    CP CUSTOMER.CUSTOMER_CP%TYPE,
    FECHA_NACIMIENTO CUSTOMER.BORN_DATE%TYPE,
    CORREO CUSTOMER.EMAIL%TYPE) AS
    BEGIN
        insert into customer values (CODIGO, NOMBRE, DIRECCION, CP, FECHA_NACIMIENTO, CORREO);
    EXCEPTION
        when value_error then   
            dbms_output.put_line('Se ha producido un error de valor');
    END ALTA_CLI;
    
-- Baixa de client
PROCEDURE baixa_clients(codigo_cliente CUSTOMER.CUSTOMER_CODE%TYPE) AS 
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

-- Modificacio de client
PROCEDURE modClients(var_codigo_customer in customer.customer_code%TYPE, opciones in number, mod_ in varchar2) AS
    contCode1 number;
    errorC exception;
    errorOp exception;
    errorCodeNull exception;

    direcc customer.customer_address%TYPE;
    CP customer.customer_cp%TYPE;
    datNaix customer.born_date%TYPE;
    email customer.email%TYPE;

    BEGIN
    select count(*) into contCode1 from customer where customer_code = var_codigo_customer;
        if contCode1 = 0 then 
            raise errorC;
    
        else
            if opciones<1 or opciones>4 then
                raise errorOp;
                
            elsif var_codigo_customer is null then
                raise errorCodeNull;
                
            else
                if opciones = 1 then
                direcc := mod_;
                update customer set customer_address = mod_ where customer_code = var_codigo_customer;
                
                elsif opciones = 2  then
                CP := mod_;
                update customer set customer_cp = mod_ where customer_code = var_codigo_customer;
                
                elsif opciones = 3 then
                datNaix := to_date (mod_);
                update customer set born_date = mod_ where customer_code = var_codigo_customer;
                
                elsif opciones = 4 then
                email := mod_;
                update customer set email = mod_ where customer_code = var_codigo_customer;
                end if;
                
            end if;
            
        end if;

        EXCEPTION
            when errorC then
                dbms_output.put_line('El código escogido no existe');
        
            when errorOp then
                dbms_output.put_line('La opción escogida no existe');
                
            when errorCodeNull then
                dbms_output.put_line('El código del vendedor no puede ser nulo');
        END;
        
-- Consulta Client codi
PROCEDURE mostrarDades_client IS
    dadesClient customer.customer_code%TYPE := &Codigo_de_cliente;
    CURSOR C_mostrarDades IS
        SELECT *
        FROM CUSTOMER
        WHERE customer_code = dadesClient;
BEGIN
    DBMS_OUTPUT.PUT_LINE('============================================
    DATOS DEL CLIENTE '||dadesClient||
    '============================================');
    FOR i IN C_mostrarDades LOOP
        DBMS_OUTPUT.PUT_LINE('Codigo de cliente: '||i.customer_code);
        DBMS_OUTPUT.PUT_LINE('Nombre del cliente: '||i.customer_name);
        DBMS_OUTPUT.PUT_LINE('Direccion del cliente: '||i.customer_address);
        DBMS_OUTPUT.PUT_LINE('Codigo postal del cliente: '||i.customer_cp);
        DBMS_OUTPUT.PUT_LINE('Fecha de nacimiento del cliente: '||i.born_date);
        DBMS_OUTPUT.PUT_LINE('Email del cliente: '||i.email);
    END LOOP;
END mostrarDades_client;

-- Consulta Clients
PROCEDURE mostrarClients IS
    CURSOR C_clientsEdat IS
        SELECT CUSTOMER_NAME AS CLIENTS,
        FLOOR((TRUNC(SYSDATE)-TRUNC(BORN_DATE))/365)AS EDAD
        FROM CUSTOMER
        ORDER BY CUSTOMER_NAME ASC;
    BEGIN
    FOR i IN C_clientsEdat LOOP
    DBMS_OUTPUT.PUT_LINE('============================================
    EDAD DE LOS CLIENTES
    ============================================');
        DBMS_OUTPUT.PUT_LINE('Clientes: '||i.CLIENTS);
        DBMS_OUTPUT.PUT_LINE('Edad clientes: '||i.EDAD);
    END LOOP;
END mostrarClients;

-- Consulta Clients Correu
PROCEDURE consulta_cliente_correo(mail customer.email%type) AS
    CURSOR c_cliente IS
        SELECT * FROM customer where email LIKE '%'||mail||'%';
    BEGIN
        FOR i IN c_cliente
            LOOP
                DBMS_OUTPUT.PUT_LINE('Codigo cliente: '||i.customer_code||'
                                      Nombre cliente: '||i.customer_name||'
                                      Dirrección: '||i.customer_address||'
                                      Codigo Postal: '||i.customer_cp||'
                                      Fecha Nacimiento: '||i.born_date||'
                                      Email:'||i.email);
            END LOOP;
    END consulta_cliente_correo;
    
-- Consulta Clients CP
PROCEDURE consulta_clients_cp(codigo_postal CUSTOMER.CUSTOMER_CP%TYPE) AS
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
END GESTIO_CLIENT;
/