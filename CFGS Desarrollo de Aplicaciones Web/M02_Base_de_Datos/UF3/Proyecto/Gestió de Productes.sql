--Triggers de Gestió de Productes

CREATE OR REPLACE TRIGGER disparador_donarAlta BEFORE INSERT ON PRODUCT FOR EACH ROW BEGIN 
IF inserting THEN
    if :new.DESCRIPTION is null then
        RAISE_APPLICATION_ERROR(-20007, 'La descripció ha de ser d entrada obligatória.');
    end if;
    
    if :new.PRIZE<0 then
        RAISE_APPLICATION_ERROR(-20008, 'El preu mai pot ser negatiu.');
    end if;    

    if :new.STOCK > :old.MINIMUM_STOCK then
        RAISE_APPLICATION_ERROR(-20009, 'L’stock mínim sempre ha de ser més petit que l’stock.');
    end if;
    
END IF;
END disparador_donarAlta;
/

CREATE OR REPLACE TRIGGER tr_modificar_productes
BEFORE UPDATE ON product
FOR EACH ROW
    BEGIN
        IF :new.description != :old.description THEN
            RAISE_APPLICATION_ERROR(-20010, 'ERROR: La descripción de un producto no se puede modificar.');
        ELSIF :new.prize < 0 THEN
            RAISE_APPLICATION_ERROR(-20011, 'ERROR: El precio de un producto no puede ser negativo.');
        ELSIF :old.stock != :new.stock AND :old.minimum_stock != :new.minimum_stock THEN
            IF :new.stock < :new.minimum_stock THEN
                RAISE_APPLICATION_ERROR(-20012, 'ERROR: El stock minimo siempre tiene que ser más pequeño que el stock.');
            END IF;
        ELSIF :new.stock < :old.minimum_stock OR :old.stock < :new.minimum_stock THEN
            RAISE_APPLICATION_ERROR(-20013, 'ERROR: El stock minimo siempre tiene que ser más pequeño que el stock.');
        END IF;
        
END tr_modificar_productes;
/

-- Package de Gestió de Productes
CREATE OR REPLACE PACKAGE GESTIO_PRODUCTE AS 
    PROCEDURE altaProd(var_product_code in product.product_code%TYPE, var_descripcion in product.description%TYPE, var_pri in product.prize%TYPE, var_stock in product.stock%TYPE, var_min_stock in product.minimum_stock%TYPE);
    PROCEDURE baja_prod(codigo_producto product.product_code%TYPE);
    PROCEDURE modificacio_productes(var_codigo_producto product.product_code%TYPE, var_precio product.prize%TYPE := -1, var_stock product.stock%TYPE := -1, var_minimum_stock product.minimum_stock%TYPE := -1);
    PROCEDURE consulta_producto_codigo(product_codigo product.product_code%TYPE);
    PROCEDURE consulta_productes;
    PROCEDURE mostrarProductos_descripcio (descripcionLiteral product.description%TYPE);
    PROCEDURE consulta_productes_stock_minim; 
END GESTIO_PRODUCTE;
/

CREATE OR REPLACE PACKAGE BODY GESTIO_PRODUCTE AS 
-- Alta Producte
PROCEDURE altaProd(var_product_code in product.product_code%TYPE, var_descripcion in product.description%TYPE, var_pri in product.prize%TYPE, var_stock in product.stock%TYPE, var_min_stock in product.minimum_stock%TYPE) AS
contCode2 number;
errorC1 exception;
errorCodeNull exception;

BEGIN
select count(*) into contCode2 from product where product_code = var_product_code;
    if contCode2 = 0 then
        raise errorC1;
        
    elsif var_product_code is null then
            raise errorCodeNull;
            
    end if;

insert into product values(var_product_code, var_descripcion, var_pri, var_stock, var_min_stock);
dbms_output.put_line('Producto dado de alta');

EXCEPTION
    when errorC1 then
        dbms_output.put_line('El código escogido no existe');
        
    when errorCodeNull then
        dbms_output.put_line('El código del producto no puede ser nulo');
        
END;

-- Baixa Producte
PROCEDURE baja_prod(codigo_producto product.product_code%TYPE) AS 
    existe_product NUMBER;
    excep_no_existe EXCEPTION;
    exc_foreign_key EXCEPTION;
    PRAGMA EXCEPTION_INIT(exc_foreign_key, -02292);
begin
    SELECT COUNT(*) INTO existe_product FROM product WHERE product_code = upper(codigo_producto);
        IF existe_product = 0 THEN
            RAISE excep_no_existe ;
        END IF;
        DELETE FROM product WHERE product_code = upper(codigo_producto);
        DBMS_OUTPUT.PUT_LINE('El producto '||upper(codigo_producto)||' se a borrado con exito.');
        EXCEPTION
            WHEN excep_no_existe THEN
                DBMS_OUTPUT.PUT_LINE('El producto '||upper(codigo_producto)||' no existe.');
            WHEN exc_foreign_key THEN
                DBMS_OUTPUT.PUT_LINE('El producto que intentas eliminar (codigo: '||upper(codigo_producto)||') existe en otra tabla y por lo tanto no se puede eliminar.');
END baja_prod;

-- Modificacio Producte
PROCEDURE modificacio_productes(var_codigo_producto product.product_code%TYPE, var_precio product.prize%TYPE := -1, var_stock product.stock%TYPE := -1, var_minimum_stock product.minimum_stock%TYPE := -1) AS
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

-- Consulta Producte Codi
PROCEDURE consulta_producto_codigo(product_codigo product.product_code%TYPE) AS
    CURSOR c_product IS
    SELECT * FROM product WHERE product_code = upper(product_codigo);
    v_cantidad_productos NUMBER;
    exception_codigo_longitud EXCEPTION;
    exception_sin_productos EXCEPTION;
    BEGIN
    SELECT COUNT(*) INTO v_cantidad_productos FROM product WHERE product_code = upper(product_codigo);
    IF LENGTH(product_codigo) != 5 THEN
        RAISE exception_codigo_longitud;
    ELSIF v_cantidad_productos = 0 THEN
        RAISE exception_sin_productos;
    END IF;
        FOR i IN c_product
        LOOP
        DBMS_OUTPUT.PUT_LINE('Código produco: '||i.product_code||'
                              Descripcion: '||i.description||'
                              Precio: '||i.prize||'
                              Stock: '||i.stock||'
                              Stock minimo: '||i.minimum_stock);
        END LOOP;
    EXCEPTION
        WHEN exception_codigo_longitud THEN
            DBMS_OUTPUT.PUT_LINE('ERROR!!! El código tiene que tener 5 cifras');
        WHEN exception_sin_productos THEN
            DBMS_OUTPUT.PUT_LINE('ERROR!!! No hay ningún producto con el codigo : '||product_codigo);
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error!!!');
END consulta_producto_codigo;

-- Consulta Productes
PROCEDURE consulta_productes AS
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
    
-- Consulta Productes Descripcio
PROCEDURE mostrarProductos_descripcio (descripcionLiteral product.description%TYPE) AS
    
    CURSOR C_mostrarProductos_descr IS
    SELECT *
    FROM PRODUCT
    WHERE   description LIKE (UPPER(descripcionLiteral)||'%');

BEGIN
    

FOR i IN C_mostrarProductos_descr
    LOOP
        DBMS_OUTPUT.PUT_LINE
            ('============================================
         DESCRIPCIÓN DE ' || upper(descripcionLiteral) ||'
============================================');    
        DBMS_OUTPUT.PUT_LINE('Codigo producto: '||i.PRODUCT_CODE);
        DBMS_OUTPUT.PUT_LINE('Descripción: '||i.DESCRIPTION);
        DBMS_OUTPUT.PUT_LINE('Precio: '||i.PRIZE);
        DBMS_OUTPUT.PUT_LINE('Stock: '||i.STOCK);
        DBMS_OUTPUT.PUT_LINE('Stock mínimo: '||i.MINIMUM_STOCK);
        DBMS_OUTPUT.PUT_LINE(' ');

        
    END LOOP;
END mostrarProductos_descripcio;

-- Consulta Productes Stock minim
PROCEDURE consulta_productes_stock_minim AS
    CURSOR c_productos IS
        SELECT * FROM product where minimum_stock<=stock;
    BEGIN
        FOR i IN c_productos
            LOOP
                DBMS_OUTPUT.PUT_LINE('Codigo de Producto: '||i.product_code||'
                                      Descripcion: '||i.description||'
                                      Precio (Pesetas): '||ROUND(i.prize * 166.39)||'
                                      Stock: '||i.stock||'
                                      Stock minimo: '||i.minimum_stock);
            END LOOP;
    END consulta_productes_stock_minim;
END GESTIO_PRODUCTE;
/