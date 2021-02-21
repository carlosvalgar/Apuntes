SET SERVEROUTPUT ON

DECLARE
varCodigoPedido NUMBER := &varPedido;
total NUMBER := 0;
varCliente cliente%ROWTYPE;
varPedido pedido%ROWTYPE;
varDetallePedido detalle_pedido%ROWTYPE;
CURSOR cursorDetallePedido IS
    SELECT * FROM detalle_pedido
    WHERE codigo_pedido = varCodigoPedido;

BEGIN
SELECT cliente.nombre_cliente, cliente.linea_direccion1, cliente.linea_direccion2, cliente.ciudad, cliente.pais, cliente.telefono, pedido.codigo_pedido, pedido.fecha_pedido
    INTO varCliente.nombre_cliente, varCliente.linea_direccion1, varCliente.linea_direccion2, varCliente.ciudad, varCliente.pais, varCliente.telefono, varPedido.codigo_pedido, varPedido.fecha_pedido
    FROM cliente
    INNER JOIN pedido ON pedido.codigo_cliente = cliente.codigo_cliente
    WHERE pedido.codigo_pedido = varCodigoPedido;
DBMS_OUTPUT.PUT_LINE('Datos del cliente:
Nombre: '||varCliente.nombre_cliente||' Dirección: '||varCliente.linea_direccion1||' '||varCliente.linea_direccion2||'
Ciudad: '||varCliente.ciudad||' País: '||varCliente.pais||' Teléfono: '||varCliente.telefono||'

Datos del pedido:
Código: '||varPedido.codigo_pedido||' Fecha: '||varPedido.fecha_pedido||'

Datos de los artículos facturados:');
OPEN cursorDetallePedido;
    LOOP
        FETCH cursorDetallePedido INTO varDetallePedido;  
        EXIT WHEN cursorDetallePedido%NOTFOUND;
        total := total + (varDetallePedido.cantidad * varDetallePedido.precio_unidad);
        DBMS_OUTPUT.PUT_LINE('Codigo Producto: '||varDetallePedido.codigo_producto||' Cantidad: '||varDetallePedido.cantidad||' Precio por Unidad: '||varDetallePedido.precio_unidad||' Total: '||varDetallePedido.cantidad * varDetallePedido.precio_unidad);
    END LOOP;
    CLOSE cursorDetallePedido;
DBMS_OUTPUT.PUT_LINE('
Total: '||total||'
IVA: '||total*0.21||'
Total con IVA: '||total*1.21);
EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('El codigo que intentas buscar no existe.');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('ERROR NO DEFINIDO.');
END;