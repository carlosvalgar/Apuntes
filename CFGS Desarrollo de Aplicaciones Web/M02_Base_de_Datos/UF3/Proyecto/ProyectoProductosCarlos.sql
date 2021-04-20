-- A l’hora de modificar alguna dada(Carlos), La descripció no es pot modificar mai. El preu mai pot ser negatiu. L’stock mínim sempre ha de ser més petit que l’stock.
/*
CREATE OR REPLACE TRIGGER tr_modificar_productes
BEFORE UPDATE ON product
FOR EACH ROW
    BEGIN
        IF :new.description != :old.description THEN
            RAISE_APPLICATION_ERROR(-20003, 'ERROR: La descripción de un producto no se puede modificar.');
        ELSIF :new.prize < 0 THEN
            RAISE_APPLICATION_ERROR(-20004, 'ERROR: El precio de un producto no puede ser negativo.');
        ELSIF :old.stock != :new.stock AND :old.minimum_stock != :new.minimum_stock THEN
            IF :new.stock < :new.minimum_stock THEN
                RAISE_APPLICATION_ERROR(-20005, 'ERROR: El stock minimo siempre tiene que ser más pequeño que el stock.');
            END IF;
        ELSIF :new.stock < :old.minimum_stock OR :old.stock < :new.minimum_stock THEN
            RAISE_APPLICATION_ERROR(-20005, 'ERROR: El stock minimo siempre tiene que ser más pequeño que el stock.');
        END IF;
        
END tr_modificar_productes;
/
*/
/*
-- Modificació producte: modificar algunes dades dels productes, com poden ser: preu, stock i stock mínim. La resta ha de ser obligatoris i no es poden modificar.
CREATE OR REPLACE PROCEDURE modificacio_productes(var_codigo_producto product.product_code%TYPE, var_precio product.prize%TYPE := -1, var_stock product.stock%TYPE := -1, var_minimum_stock product.minimum_stock%TYPE := -1) AS
BEGIN
    IF var_precio != -1 THEN
        UPDATE product SET prize = var_precio WHERE product_code = var_codigo_producto;
        DBMS_OUTPUT.PUT_LINE('Precio actualizado.');
    ELSIF var_stock != -1 THEN
        UPDATE product SET stock = var_stock WHERE product_code = var_codigo_producto;
        DBMS_OUTPUT.PUT_LINE('Stock actualizado.');
    ELSIF var_minimum_stock != -1 THEN
        UPDATE product SET minimum_stock = var_minimum_stock WHERE product_code = var_codigo_producto;
        DBMS_OUTPUT.PUT_LINE('Stock minimo actualizado.');
    END IF;
END;
/
-- Ejemplo de uso
BEGIN
-- modificacio_productes(var_codigo_producto => 'A0001', var_minimum_stock => 2);
modificacio_productes(var_codigo_producto => 'A0001', var_precio => 500);
END modificacio_productes;
/
*/
/*
-- Consulta que mostri tots els productes (CONSULTA PRODUCTES), ordenats alfabèticament en ordre ascendent per la descripció i que apareguin el preu en pessetes.
CREATE OR REPLACE PROCEDURE consulta_productes AS
    CURSOR c_productos IS
        SELECT * FROM product ORDER BY description ASC;
    BEGIN
        FOR i IN c_productos
            LOOP
                DBMS_OUTPUT.PUT_LINE('===========================================
 Codigo de Producto: '||i.product_code||'
 Descripción: '||i.description||'
 Precio (Pesetas): '||ROUND(i.prize * 166.39)||'
 Stock: '||i.stock||'
 Stock minimo: '||i.minimum_stock||'
===========================================');
            END LOOP;
    END consulta_productes;
/

BEGIN
consulta_productes;
END consulta_productes;
*/
