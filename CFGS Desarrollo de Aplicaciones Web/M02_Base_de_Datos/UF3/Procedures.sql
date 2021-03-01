/*
CREATE OR REPLACE PROCEDURE listarNumeros (A IN NUMBER) AS
BEGIN
FOR i IN 0..A
LOOP
    DBMS_OUTPUT.PUT_LINE(i);
END LOOP;
END;
/

*/
/*

CREATE OR REPLACE PROCEDURE dividirNumero (dividendo IN NUMBER, divisor IN NUMBER, cociente OUT NUMBER, resto OUT NUMBER) AS
BEGIN
cociente := FLOOR(dividendo / divisor);
resto := MOD(dividendo, divisor);
END;
/

*/