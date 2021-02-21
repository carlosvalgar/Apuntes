DECLARE
CURSOR cursorPago IS 
    SELECT * FROM pago ORDER BY id_transaccion;

BEGIN
FOR i in cursorPago
LOOP
    DBMS_OUTPUT.PUT_LINE('Codigo de cliente: '||i.codigo_cliente||' Forma de pago: '||i.forma_pago||' ID de la transacción: '||i.id_transaccion);
END LOOP;
END;