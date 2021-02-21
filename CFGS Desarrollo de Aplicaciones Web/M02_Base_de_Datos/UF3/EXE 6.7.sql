SET SERVEROUTPUT ON;

/*
-- 6.7.- Version WHILE
DECLARE
i INT:= 2;
suma INT:= 0;

BEGIN
WHILE (i < 100)
LOOP
    suma:= suma + i;
    i:= i+2;
END LOOP;
DBMS_OUTPUT.PUT_LINE(suma);
END;
*/
/*
-- 6.7.- Version LOOP
DECLARE
i INT:= 2;
suma INT:= 0;

BEGIN
LOOP
    suma:= suma + i;
    i:= i+2;
    EXIT WHEN (i = 100);
END LOOP;
DBMS_OUTPUT.PUT_LINE(suma);
END;
*/

DECLARE
suma INT:= 0;

BEGIN 
FOR i IN 1..98
LOOP
    IF MOD(i, 2) != 1 THEN 
        suma:= suma + i;
    END IF;
END LOOP;
DBMS_OUTPUT.PUT_LINE(suma);
END;
