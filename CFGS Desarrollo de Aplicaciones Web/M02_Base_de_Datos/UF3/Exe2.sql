SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION superat_objectius(ciutat oficina.ciudad%TYPE) RETURN VARCHAR2 AS
numero_venedors NUMBER;
mitja_vendes NUMBER;

BEGIN
SELECT COUNT(*), TRUNC(AVG(vendedor.ventas)) INTO numero_venedors, mitja_vendes FROM oficina INNER JOIN vendedor ON vendedor.cod_oficina = oficina.cod_oficina WHERE oficina.ciudad = ciutat AND vendedor.objetivo <= vendedor.ventas;

RETURN (ciutat||' - '||numero_venedors||' - '||mitja_vendes);
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(superat_objectius('&ciutat'));
END;
/
