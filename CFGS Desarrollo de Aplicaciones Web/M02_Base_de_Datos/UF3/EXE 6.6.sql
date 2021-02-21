SET SERVEROUTPUT ON;

/*
-- 6.6.- Metodo For

BEGIN
FOR i IN 1..100
LOOP
    DBMS_OUTPUT.PUT_LINE(i);
END LOOP;
END;
*/

/*
-- 6.6.- Metodo While

DECLARE
i INT:= 1;

BEGIN
WHILE (i <= 100)
LOOP
    DBMS_OUTPUT.PUT_LINE(i);
    i:= i+1;
END LOOP;
END;
*/

-- 6.6.- Metodo Loop

DECLARE
i INT:= 1;

BEGIN
LOOP
    DBMS_OUTPUT.PUT_LINE(i);
    EXIT WHEN (i = 100);
    i:= i+1;
END LOOP;
END;