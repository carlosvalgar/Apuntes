-- Escribir un paquete completo para gestionar las localizaciones. El paquete se llamará gest_loc y deberá incluir, al menos, los siguientes subprogramas:
CREATE OR REPLACE PACKAGE gest_loc AS
-- 1.- insertar_nueva_loc: permite insertar una localizacon nueva. El procedimiento recibe como calle, ciudad, postal_code, provincia y country_id . Creará la nueva localizacoin comprobando que no exista ya una en la misma ciudad.
    PROCEDURE insertar_nueva_loc(calle VARCHAR2, postal_code VARCHAR2, ciudad VARCHAR2, provincia VARCHAR2, country_id CHAR);
-- 2.- modificar_loc_calle: Recibirá el loc_id. Modificará la calle.
    PROCEDURE modificar_loc_calle(loc_id NUMBER, calle VARCHAR2);
-- 3.- modificar_loc_cod_pos: Recibirá el loc_id. Modificará el codigo postal
    PROCEDURE modificar_loc_cod_pos(loc_id NUMBER, codigo_postal VARCHAR2);
-- 4.- modificar_loc_city: Recibirá el loc_id. Modificará la ciudad.
    PROCEDURE modificar_loc_city(loc_id NUMBER, ciudad VARCHAR2);
-- 5.- modificar_loc_prov: Recibirá el loc_id. Modificará la provincia.
    PROCEDURE modificar_loc_prov(loc_id NUMBER, provincia VARCHAR2);
-- 6.- modificar_loc_country: Recibirá el loc_id. Modificará el pais.
    PROCEDURE modificar_loc_country(loc_id NUMBER, pais CHAR);
-- 7.- visualizar_datos_loc: visualizará los datos de una localización cuyo número se pasará en la llamada. Además de los datos relativos de una localización, se visualizará el número de empleados trabajan en esa localidad.
    PROCEDURE visualizar_datos_loc(loc_id NUMBER);
-- 8.- borrar_loc: permite eliminar una localización. El procedimiento recibe el loc_id.
    PROCEDURE borrar_loc(loc_id NUMBER);
END gest_loc;
/

CREATE OR REPLACE PACKAGE BODY gest_loc AS
-- 1.- insertar_nueva_loc: permite insertar una localizacon nueva. El procedimiento recibe como calle, ciudad, postal_code, provincia y country_id . Creará la nueva localizacoin comprobando que no exista ya una en la misma ciudad.
    PROCEDURE insertar_nueva_loc(calle VARCHAR2, postal_code VARCHAR2, ciudad VARCHAR2, provincia VARCHAR2, country_id CHAR) AS
        v_location_id NUMBER;
        BEGIN
            SELECT MAX(location_id) INTO v_location_id FROM locations;
            INSERT INTO locations VALUES (v_location_id + 100, calle, postal_code, ciudad, provincia, country_id);
    END insertar_nueva_loc;
-- 2.- modificar_loc_calle: Recibirá el loc_id. Modificará la calle.
    PROCEDURE modificar_loc_calle(loc_id NUMBER, calle VARCHAR2) AS
        BEGIN
            UPDATE locations SET street_address = calle WHERE location_id = loc_id;
    END modificar_loc_calle;
-- 3.- modificar_loc_cod_pos: Recibirá el loc_id. Modificará el codigo postal
    PROCEDURE modificar_loc_cod_pos(loc_id NUMBER, codigo_postal VARCHAR2) AS
        BEGIN
            UPDATE locations SET postal_code = codigo_postal WHERE location_id = loc_id;
    END modificar_loc_cod_pos;
-- 4.- modificar_loc_city: Recibirá el loc_id. Modificará la ciudad.
    PROCEDURE modificar_loc_city(loc_id NUMBER, ciudad VARCHAR2) AS
        BEGIN
            UPDATE locations SET city = ciudad WHERE location_id = loc_id;
    END modificar_loc_city;
-- 5.- modificar_loc_prov: Recibirá el loc_id. Modificará la provincia.
    PROCEDURE modificar_loc_prov(loc_id NUMBER, provincia VARCHAR2) AS
        BEGIN
            UPDATE locations SET state_province = provincia WHERE location_id = loc_id;
    END modificar_loc_prov;
-- 6.- modificar_loc_country: Recibirá el loc_id. Modificará el pais.
    PROCEDURE modificar_loc_country(loc_id NUMBER, pais CHAR) AS
        BEGIN
            UPDATE locations SET country_id = pais WHERE location_id = loc_id;
    END modificar_loc_country;
-- 7.- visualizar_datos_loc: visualizará los datos de una localización cuyo número se pasará en la llamada. Además de los datos relativos de una localización, se visualizará el número de empleados trabajan en esa localidad.
    PROCEDURE visualizar_datos_loc(loc_id NUMBER) AS
        v_location locations%ROWTYPE;
        v_cantidad_empleados NUMBER;
        BEGIN
            SELECT * INTO v_location FROM locations WHERE location_id = loc_id;
            SELECT COUNT(*) INTO v_cantidad_empleados FROM employees INNER JOIN departments ON departments.department_id = employees.department_id WHERE departments.location_id = loc_id;
            DBMS_OUTPUT.PUT_LINE('ID de la localización: '||v_location.location_id||'
Calle: '||v_location.street_address||'
Código Postal: '||v_location.postal_code||'
Ciudad: '||v_location.city||'
Provincia: '||v_location.state_province||'
Pais: '||v_location.country_id||'
Cantidad de Empleados: '||v_cantidad_empleados);
    END visualizar_datos_loc;
-- 8.- borrar_loc: permite eliminar una localización. El procedimiento recibe el loc_id.
    PROCEDURE borrar_loc(loc_id NUMBER) AS
        BEGIN
            DELETE FROM locations WHERE location_id = loc_id;
    END borrar_loc;
END gest_loc;
/

BEGIN
gest_loc.insertar_nueva_loc('Calle Rubio i Ors, 294, 3º 1º', '08940', 'Cornellà del Llobregat', 'Barcelona', 'MX');
gest_loc.visualizar_datos_loc(1700);
END;
/





