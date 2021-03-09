SET SERVEROUTPUT ON;

-- 2.1. Crea la taula empleats amb les columnes següents:

CREATE TABLE empleats (
    id_emp NUMBER(6) PRIMARY KEY,
    nom VARCHAR2(15),
    cognoms VARCHAR2(40) NOT NULL,
    data_contracte DATE,
    salari NUMBER(8, 2)
);


-- 2.2. Crea la funció de BD paraula_aleat amb paràmetres

CREATE OR REPLACE FUNCTION paraula_aleat(long_min NUMBER, long_max NUMBER) RETURN VARCHAR2 AS
paraula VARCHAR2(100) := '';
alfabet VARCHAR2(50) := 'abcdefghijklmnopqrstuvwxyz';
n_aleat NUMBER := trunc(DBMS_RANDOM.VALUE(long_min, long_max + 1));
lletra_aleat NUMBER;

BEGIN
FOR i IN 1..n_aleat
    LOOP
        lletra_aleat := TRUNC(DBMS_RANDOM.VALUE(1, LENGTH(alfabet)));
        paraula := paraula||SUBSTR(alfabet, lletra_aleat, 1);
    END LOOP;
    RETURN paraula;
END;
/

BEGIN
DBMS_OUTPUT.PUT_LINE(paraula_aleat(9, 52));
END;
/

-- 2.3.- Troba una expressió per obtenir una data aleatòria entre la data 15/1/1990 i la data del SGBD, totes dues incloses.

SELECT TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '1990-01-15','J'), TO_CHAR(SYSDATE,'J'))),'J') FROM DUAL;


-- 2.4.- Troba una expressió per obtenir un salari aleatori entre 13300 i 87458, tots dos inclosos
SELECT TRUNC(DBMS_RANDOM.VALUE(13300, 87459)) FROM DUAL;

-- 2.5.- Crea la seqüència empleats_seq per obtenir els identificadors de la taula empleats.

CREATE SEQUENCE sec_ID_empleados
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
MINVALUE 1;

-- INSERT INTO empleats VALUES(sec_ID_empleados.NEXTVAL, 'pepe', 'garcia', '23-01-1999', 1234);

-- 2.6. Escriu un programa PL/SQL que demani a l’usuari la quantitat d’empleats a inserir i insereixi aquesta quantitat de files a la taula empleats
DECLARE
v_emp empleats%ROWTYPE;

BEGIN
FOR i IN 1..&empleats_a_inserir
    LOOP
        v_emp.id_emp := sec_ID_empleados.NEXTVAL;
        
        v_emp.nom := paraula_aleat(2, 12);
        v_emp.nom := UPPER(SUBSTR(v_emp.nom, 1, 1))||SUBSTR(v_emp.nom, 2, LENGTH(v_emp.nom) -1);
        v_emp.cognoms := paraula_aleat(2, 12);
        v_emp.cognoms := UPPER(SUBSTR(v_emp.cognoms, 1, 1))||SUBSTR(v_emp.cognoms, 2, LENGTH(v_emp.cognoms) -1);
        v_emp.cognoms := v_emp.cognoms||' '||v_emp.nom;
        
        v_emp.nom := paraula_aleat(3, 8);
        v_emp.nom := UPPER(SUBSTR(v_emp.nom, 1, 1))||SUBSTR(v_emp.nom, 2, LENGTH(v_emp.nom) -1);
        
        SELECT TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '1990-01-15','J'), TO_CHAR(SYSDATE,'J'))),'J') INTO v_emp.data_contracte FROM DUAL;
        
        SELECT TRUNC(DBMS_RANDOM.VALUE(13300, 87459)) INTO v_emp.salari FROM DUAL;
        
        INSERT INTO empleats VALUES(v_emp.id_emp, v_emp.nom, v_emp.cognoms, v_emp.data_contracte, v_emp.salari);
        
    END LOOP;
END;
