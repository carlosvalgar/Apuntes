DECLARE
varPago pago%ROWTYPE;

CURSOR cursorPago IS 
    SELECT * FROM pago ORDER BY id_transaccion;

BEGIN
OPEN cursorPago;
LOOP
FETCH cursorPago INTO varPago;
    DBMS_OUTPUT.PUT_LINE('Codigo de cliente: '||varPago.codigo_cliente||' Forma de pago: '||varPago.forma_pago||' ID de la transacción: '||varPago.id_transaccion);
    EXIT WHEN varPago.total = 1849;
END LOOP;
CLOSE cursorPago;
END;