SET SERVEROUTPUT ON;

/*

-- 1.3 Crea la funcion validar_import

CREATE OR REPLACE FUNCTION validar_import(txt_import aportacions.txt_import%TYPE) RETURN NUMBER AS
varBool NUMBER;
BEGIN
    IF txt_import IS NULL THEN
        RETURN -1;
    END IF;
    
    SELECT VALIDATE_CONVERSION(txt_import AS NUMBER, '999D99', 'NLS_NUMERIC_CHARACTERS = ''.,''') test1 INTO varBool FROM dual;
    
    IF varBool > 0 THEN
        IF to_number(txt_import, '999D99', 'NLS_NUMERIC_CHARACTERS = ''.,''') < 0 THEN
            RETURN -1;
        ELSE
            RETURN to_number(txt_import, '999D99', 'NLS_NUMERIC_CHARACTERS = ''.,''');
        END IF;

    ELSE
        SELECT VALIDATE_CONVERSION(txt_import AS NUMBER, '999D99', 'NLS_NUMERIC_CHARACTERS = '',.''') test1 INTO varBool FROM dual;
        IF varBool > 0 THEN
            IF to_number(txt_import, '999D99', 'NLS_NUMERIC_CHARACTERS = '',.''') < 0 THEN
                RETURN -1;
            ELSE
                RETURN to_number(txt_import, '999D99', 'NLS_NUMERIC_CHARACTERS = '',.''');
            END IF;
        ELSE
            RETURN -1;
        END IF;      
    END IF;
END;
/

*/
/*

DECLARE
CURSOR c_txt_import IS
    SELECT txt_import FROM APORTACIONS;
txt_aux aportacions.txt_import%TYPE;

BEGIN
OPEN c_txt_import;
        LOOP
        FETCH c_txt_import INTO txt_aux;
            EXIT WHEN c_txt_import%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(validar_import(txt_aux));
        END LOOP;
CLOSE c_txt_import;
END;
/

*/
/*

-- 1.4 Crea la funcion validar_nif

CREATE OR REPLACE FUNCTION validar_nif(nif aportacions.nif%TYPE) RETURN NUMBER AS
varBool NUMBER;

BEGIN
    IF LENGTH(nif) != 9 THEN
        RETURN -1;
    END IF;
    SELECT VALIDATE_CONVERSION(SUBSTR(nif, 1, 1) AS NUMBER) test1 INTO varBool FROM dual;
    IF varBool = 1 THEN
        IF SUBSTR(nif, 9, 1) = SUBSTR('TRWAGMYFPDXBNJZSQVHLCKE', MOD(TO_NUMBER(SUBSTR(nif, 1, 8)), 23) + 1, 1 ) THEN
            RETURN 1;
        ELSE
             RETURN -1;
        END IF;
    ELSE
        IF SUBSTR(nif, 1, 1) = SUBSTR('XYZAGMYFPDXBNJZSQVHLCKE', MOD(TO_NUMBER(SUBSTR(nif, 2, 9)), 23) + 1, 1 ) THEN
            RETURN 1;
        ELSE
             RETURN -1;
        END IF;
    END IF;
END;
/

*/
/*

DECLARE
CURSOR c_nif IS
    SELECT nif FROM APORTACIONS;
nif_aux aportacions.nif%TYPE;

BEGIN
OPEN c_nif;
        LOOP
        FETCH c_nif INTO nif_aux;
            EXIT WHEN c_nif%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(validar_nif(nif_aux)||' '||nif_aux);
        END LOOP;
CLOSE c_nif;
END;
/

*/

-- 1.5.- Crea una consulta osbre la taula aportacions
DECLARE
CURSOR c_aportacions IS
    SELECT * FROM APORTACIONS;
aportacions_aux aportacions%ROWTYPE;
chk_dni NUMBER;
chk_import NUMBER;

BEGIN
OPEN c_aportacions;
    LOOP
        FETCH c_aportacions INTO aportacions_aux;
            EXIT WHEN c_aportacions%NOTFOUND;
            chk_dni := validar_nif(aportacions_aux.nif);
            chk_import := validar_import(aportacions_aux.txt_import);
            IF chk_dni = -1 THEN
                IF chk_import = -1 THEN
                    DBMS_OUTPUT.PUT_LINE('nif: '||aportacions_aux.nif||' Import: '||aportacions_aux.txt_import||' NIF i import incorrectes.');
                ELSE
                    DBMS_OUTPUT.PUT_LINE('nif: '||aportacions_aux.nif||' Import: '||aportacions_aux.txt_import||' NIF incorrecte.');
                END IF;
            ELSIF chk_import = -1 THEN
                DBMS_OUTPUT.PUT_LINE('nif: '||aportacions_aux.nif||' Import: '||aportacions_aux.txt_import||' import incorrecte.');
            END IF;
    END LOOP;
CLOSE c_aportacions;
END;