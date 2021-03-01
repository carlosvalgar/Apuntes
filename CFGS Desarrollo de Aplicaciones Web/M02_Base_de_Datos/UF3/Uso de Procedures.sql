SET SERVEROUTPUT ON;

/*

-- Ex 1

DECLARE
N1 NUMBER := 7;

BEGIN
listarNumeros(N1);
END;

*/

-- Ex 2

DECLARE
N1 NUMBER := 18;
N2 NUMBER := 4;
N3 NUMBER;
N4 NUMBER;

BEGIN
dividirNumero(N1, N2, N3, N4);
DBMS_OUTPUT.PUT_LINE('Dividendo: '||N1||' Divisor: '||N2||' Cociente: '||N3||' Resto: '||N4);
END;