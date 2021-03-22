SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE rang_anys(edat_min NUMBER, edat_max NUMBER) AS
var_count NUMBER;
BEGIN
    IF edat_min < 0 OR edat_min > edat_max THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: No puedes poner una edad negativa o una edad máxima menor que la mínima.');
    ELSE
        FOR i IN edat_min..edat_max
            LOOP
                SELECT COUNT(*) INTO var_count FROM cliente WHERE TRUNC((SYSDATE - FECHANAC)/365) = i;
                DBMS_OUTPUT.PUT_LINE('Clients de '||i||' anys: '||var_count);
            END LOOP;
    END IF;
END;
/

BEGIN
rang_anys(&edat_minima, &edat_maxima);
END;
/