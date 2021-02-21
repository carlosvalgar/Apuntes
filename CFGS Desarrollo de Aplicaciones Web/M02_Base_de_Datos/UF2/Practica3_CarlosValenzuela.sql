SET SERVEROUTPUT ON;

/*

-- 1.-

DECLARE
varString VARCHAR2(15);
reverseString VARCHAR2(15) := '';
len NUMBER;

CURSOR cursorProducto IS
    SELECT codigo_producto FROM producto;

BEGIN

FOR i in cursorProducto
    LOOP
        len := LENGTH(i.codigo_producto);
        FOR j in REVERSE 1..len
            LOOP
                reverseString := reverseString||SUBSTR(i.codigo_producto, j, 1);
            END LOOP;
        DBMS_OUTPUT.PUT_LINE(i.codigo_producto||' | '||reverseString);
        reverseString := '';
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error inesperado.');
END;

*/
/*

-- 2.-

DECLARE
noEntregado EXCEPTION;
rechazado EXCEPTION;
pedidoUsuario pedido.codigo_pedido%TYPE := &pedidoUsuario;
dias NUMBER;
varEstado pedido.estado%TYPE;

BEGIN
SELECT fecha_entrega - fecha_pedido, estado INTO dias, varEstado FROM pedido WHERE codigo_pedido = pedidoUsuario;
IF varEstado = 'Pendiente' THEN
    RAISE noEntregado;
ELSIF varEstado = 'Rechazado' THEN
    RAISE rechazado;
END IF;
DBMS_OUTPUT.PUT_LINE('El pedido con código '||pedidoUsuario||' ha tardado '||dias||' días en entregarse.');
EXCEPTION
    WHEN noEntregado THEN DBMS_OUTPUT.PUT_LINE('El pedido que buscas aún no ha sido entregado.');
    WHEN rechazado THEN DBMS_OUTPUT.PUT_LINE('El pedido que buscas ha sido rechazado.');
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('El pedido que buscas no existe.');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error inesperado.');
END;

*/
/*

-- 3.-

DECLARE
CURSOR cursorCincoProductos IS
    SELECT detalle_pedido.codigo_pedido,pedido.codigo_cliente FROM detalle_pedido INNER JOIN pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido WHERE numero_linea = 5;
CURSOR cursorCliente IS
    SELECT * FROM cliente;

BEGIN
FOR i IN cursorCliente
LOOP
DBMS_OUTPUT.PUT_LINE('Cliente:'||'
    Codigo del cliente: '||i.codigo_cliente||'
    Nombre del Cliente: '||i.nombre_cliente||'
    
Pedidos con más de cinco productos:');
    
    FOR j IN cursorCincoProductos
        LOOP
            IF i.codigo_cliente = j.codigo_cliente THEN
                DBMS_OUTPUT.PUT_LINE('    Código de pedido: '||j.codigo_pedido);
            END IF;
        END LOOP;
    DBMS_OUTPUT.PUT_LINE('
    ');
END LOOP;
END;

*/
/*

-- 4.-

DECLARE
CURSOR cursorClientesMayorGasto IS
    SELECT pedido.codigo_cliente, SUM(total_pedido.precio_pedido) AS total_cliente FROM pedido 
    INNER JOIN (SELECT precio_unidad * cantidad AS precio_pedido, codigo_pedido FROM detalle_pedido) total_pedido ON total_pedido.codigo_pedido = pedido.codigo_pedido
    GROUP BY pedido.codigo_cliente ORDER BY total_cliente DESC FETCH FIRST 5 ROWS ONLY;
    
varDatosCliente cliente%ROWTYPE;

BEGIN
FOR i IN cursorClientesMayorGasto
    LOOP
    SELECT apellido_contacto, limite_credito INTO varDatosCliente.apellido_contacto, varDatosCliente.limite_credito FROM cliente WHERE codigo_cliente = i.codigo_cliente;
    DBMS_OUTPUT.PUT_LINE('Apellido: '||varDatosCliente.apellido_contacto||' Límite de crédito: '||varDatosCliente.limite_credito);    
    END LOOP;
END;

*/
/*

-- 5.-

DECLARE
varCodigoCliente cliente.codigo_cliente%TYPE := &varCodigoCliente;
varCliente cliente%ROWTYPE;
totalPagos NUMBER:= 0;
CURSOR cursorPago IS
    SELECT * FROM pago WHERE codigo_cliente = varCodigoCliente ORDER BY fecha_pago;

BEGIN
SELECT * INTO varCliente FROM cliente  WHERE codigo_cliente = varCodigoCliente;
DBMS_OUTPUT.PUT_LINE('CODIGO CLIENTE: '||varCliente.codigo_cliente||'
NOMBRE CLIENTE: '||varCliente.nombre_cliente||'
CIUDAD CLIENTE: '||varCliente.ciudad||'
PAIS   CLIENTE: '||varCliente.pais||'
=============================================
ID-TRANSACCION  FECHA      FORMA  CANTIDAD
=============================================');
FOR i IN cursorPago
LOOP
    totalPagos := totalPagos + i.total;
    DBMS_OUTPUT.PUT_LINE(i.id_transaccion||'   '||i.fecha_pago||'   '||i.forma_pago||' '||i.total);
END LOOP;
DBMS_OUTPUT.PUT_LINE('=============================================
TOTAL PAGOS EFECTUADOS: '||totalPagos);
EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('No hay registros con el código que has introducido.');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error inesperado.');
END;

*/