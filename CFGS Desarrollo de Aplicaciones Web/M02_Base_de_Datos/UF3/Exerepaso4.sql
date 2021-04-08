SET SERVEROUTPUT ON;
-- Realiza un procedimiento que actualice la columna Stock de la tabla Productos a partir de los registros de la tabla Ventas.
-- El citado procedimiento debe informarnos por pantalla si alguna de las tablas est� vac�a o si el stock de un producto pasa a ser negativo, en cuyo caso se parar� la actualizaci�n.



CREATE OR REPLACE PROCEDURE actualizar_stock AS
BEGIN
SELECT * FROM ventas INNER JOIN productos ON productos.codproducto = ventas.codproducto;
END;
/