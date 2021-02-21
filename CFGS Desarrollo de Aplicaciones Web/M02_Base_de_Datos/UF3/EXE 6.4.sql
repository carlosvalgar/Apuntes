SET SERVEROUTPUT ON;

-- 2.-

DECLARE
NUM1 INT:= 0;
NUM2 INT:= 1;
SIGNO VARCHAR(1);

BEGIN
IF NUM1 > NUM2 THEN
    SIGNO:= 1;
    
ELSIF NUM1 < NUM2 THEN
    SIGNO:= 2;
    
ELSIF NUM1 = NUM2 THEN
    SIGNO:= 'X';
    
END IF;
DBMS_OUTPUT.PUT_LINE('Goles de casa: '||NUM1||' Goles de fuera: '||NUM2||' Signo de la quiniela '||SIGNO);
END;