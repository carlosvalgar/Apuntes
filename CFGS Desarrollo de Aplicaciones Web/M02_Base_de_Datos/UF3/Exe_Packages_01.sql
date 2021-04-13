-- Escribir un paquete completo para gestionar las localizaciones. El paquete se llamar� gest_loc y deber� incluir, al menos, los siguientes subprogramas:
CREATE OR REPLACE PACKAGE gest_loc AS
-- 1.- insertar_nueva_loc: permite insertar una localizacon nueva. El procedimiento recibe como calle, ciudad, postal_code, provincia y country_id . Crear� la nueva localizacoin comprobando que no exista ya una en la misma ciudad.
    PROCEDURE insertar_nueva_loc(calle VARCHAR2, postal_code VARCHAR2, ciudad VARCHAR2, provincia VARCHAR2, country_id CHAR);
-- 2.- modificar_loc_calle: Recibir� el loc_id. Modificar� la calle.
    PROCEDURE modificar_loc_calle(loc_id NUMBER, calle VARCHAR2);
-- 3.- modificar_loc_cod_pos: Recibir� el loc_id. Modificar� el codigo postal
    PROCEDURE modificar_loc_cod_pos(loc_id NUMBER, codigo_postal VARCHAR2);
-- 4.- modificar_loc_city: Recibir� el loc_id. Modificar� la ciudad.
    PROCEDURE modificar_loc_city(loc_id NUMBER, ciudad VARCHAR2);
-- 5.- modificar_loc_prov: Recibir� el loc_id. Modificar� la provincia.
    PROCEDURE modificar_loc_prov(loc_id NUMBER, provincia VARCHAR2);
-- 6.- modificar_loc_country: Recibir� el loc_id. Modificar� el pais.
    PROCEDURE modificar_loc_country(loc_id NUMBER, pais CHAR);
-- 7.- visualizar_datos_loc: visualizar� los datos de una localizaci�n cuyo n�mero se pasar� en la llamada. Adem�s de los datos relativos de una localizaci�n, se visualizar� el n�mero de empleados trabajan en esa localidad.
    PROCEDURE visualizar_datos_loc(loc_id NUMBER);
-- 8.- borrar_loc: permite eliminar una localizaci�n. El procedimiento recibe el loc_id.
    PROCEDURE borrar_loc(loc_id NUMBER);
END gest_loc;
/

CREATE OR REPLACE PACKAGE BODY gest_loc AS
-- 1.- insertar_nueva_loc: permite insertar una localizacon nueva. El procedimiento recibe como calle, ciudad, postal_code, provincia y country_id . Crear� la nueva localizacoin comprobando que no exista ya una en la misma ciudad.
    PROCEDURE insertar_nueva_loc(calle VARCHAR2, postal_code VARCHAR2, ciudad VARCHAR2, provincia VARCHAR2, country_id CHAR) AS
        v_location_id NUMBER;
        BEGIN
            SELECT MAX(location_id) INTO v_location_id FROM locations;
            INSERT INTO locations VALUES (v_location_id + 100, calle, postal_code, ciudad, provincia, country_id);
    END insertar_nueva_loc;
-- 2.- modificar_loc_calle: Recibir� el loc_id. Modificar� la calle.
    PROCEDURE modificar_loc_calle(loc_id NUMBER, calle VARCHAR2) AS
        BEGIN
            UPDATE locations SET street_address = calle WHERE location_id = loc_id;
    END modificar_loc_calle;
-- 3.- modificar_loc_cod_pos: Recibir� el loc_id. Modificar� el codigo postal
    PROCEDURE modificar_loc_cod_pos(loc_id NUMBER, codigo_postal VARCHAR2) AS
        BEGIN
            UPDATE locations SET postal_code = codigo_postal WHERE location_id = loc_id;
    END modificar_loc_cod_pos;
-- 4.- modificar_loc_city: Recibir� el loc_id. Modificar� la ciudad.
    PROCEDURE modificar_loc_city(loc_id NUMBER, ciudad VARCHAR2) AS
        BEGIN
            UPDATE locations SET city = ciudad WHERE location_id = loc_id;
    END modificar_loc_city;
-- 5.- modificar_loc_prov: Recibir� el loc_id. Modificar� la provincia.
    PROCEDURE modificar_loc_prov(loc_id NUMBER, provincia VARCHAR2) AS
        BEGIN
            UPDATE locations SET state_province = provincia WHERE location_id = loc_id;
    END modificar_loc_prov;
-- 6.- modificar_loc_country: Recibir� el loc_id. Modificar� el pais.
    PROCEDURE modificar_loc_country(loc_id NUMBER, pais CHAR) AS
        BEGIN
            UPDATE locations SET country_id = pais WHERE location_id = loc_id;
    END modificar_loc_country;
-- 7.- visualizar_datos_loc: visualizar� los datos de una localizaci�n cuyo n�mero se pasar� en la llamada. Adem�s de los datos relativos de una localizaci�n, se visualizar� el n�mero de empleados trabajan en esa localidad.
    PROCEDURE visualizar_datos_loc(loc_id NUMBER) AS
        v_location locations%ROWTYPE;
        v_cantidad_empleados NUMBER;
        BEGIN
            SELECT * INTO v_location FROM locations WHERE location_id = loc_id;
            SELECT COUNT(*) INTO v_cantidad_empleados FROM employees INNER JOIN departments ON departments.department_id = employees.department_id WHERE departments.location_id = loc_id;
            DBMS_OUTPUT.PUT_LINE('ID de la localizaci�n: '||v_location.location_id||'
Calle: '||v_location.street_address||'
C�digo Postal: '||v_location.postal_code||'
Ciudad: '||v_location.city||'
Provincia: '||v_location.state_province||'
Pais: '||v_location.country_id||'
Cantidad de Empleados: '||v_cantidad_empleados);
    END visualizar_datos_loc;
-- 8.- borrar_loc: permite eliminar una localizaci�n. El procedimiento recibe el loc_id.
    PROCEDURE borrar_loc(loc_id NUMBER) AS
        BEGIN
            DELETE FROM locations WHERE location_id = loc_id;
    END borrar_loc;
END gest_loc;
/

BEGIN
gest_loc.insertar_nueva_loc('Calle Rubio i Ors, 294, 3� 1�', '08940', 'Cornell� del Llobregat', 'Barcelona', 'MX');
gest_loc.visualizar_datos_loc(1700);
END;
/





