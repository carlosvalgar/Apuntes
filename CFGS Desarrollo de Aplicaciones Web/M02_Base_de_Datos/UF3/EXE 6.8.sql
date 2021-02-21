SET SERVEROUTPUT ON;

/*
-- 6.8.- Metodo FOR
BEGIN
FOR i IN 1..10
LOOP
    FOR j IN 1..10
    LOOP
        DBMS_OUTPUT.PUT_LINE(i||' * '||j||' = '||(i*j));
    END LOOP;
END LOOP;
END;
*/
/*
-- 6.8.- Metodo WHILE
DECLARE
i INT:= 1;
j INT;

BEGIN
WHILE (i <= 10)
LOOP
    j:=1;
    
    WHILE (j <= 10)
    LOOP
        DBMS_OUTPUT.PUT_LINE(i||' * '||j||' = '||(i*j));
        j:= j + 1;
    END LOOP;
    
    i:= i  + 1;
END LOOP;
END;
*/
-- 6.8.- Metodo LOOP
DECLARE
i INT:= 1;
j INT;

BEGIN
LOOP
    j:=1;
    
    LOOP
        DBMS_OUTPUT.PUT_LINE(i||' * '||j||' = '||(i*j));
        EXIT WHEN j = 10;
        j:= j + 1;
    END LOOP;
    EXIT WHEN i = 10;
    i:= i  + 1;
END LOOP;
END;