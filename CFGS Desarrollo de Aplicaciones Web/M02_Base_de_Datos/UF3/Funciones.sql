SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION MULTIPLO(A IN NUMBER, B IN NUMBER) RETURN VARCHAR2
AS
MULTIPLO VARCHAR2(25):= 'FALSE';
BEGIN
IF MOD(A, B) = 0 THEN
    MULTIPLO:= 'TRUE';
END IF;
  RETURN (MULTIPLO);
END;
/

CALL DBMS_OUTPUT.PUT_LINE(MULTIPLO(16, 4));
CALL DBMS_OUTPUT.PUT_LINE(MULTIPLO(16, 3));