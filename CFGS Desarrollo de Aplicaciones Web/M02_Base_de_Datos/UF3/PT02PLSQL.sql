SET SERVEROUTPUT ON;

/*

-- 1.-

VARIABLE nom VARCHAR2(25);
VARIABLE cognom VARCHAR2(25);
VARIABLE edat NUMBER;

DECLARE
    varNom VARCHAR2(25) := '&varNom';
    varCognom VARCHAR2(25) := '&varCognom';
    varEdat NUMBER := &varEdat;
BEGIN
    :nom := varNom;
    :cognom := varCognom;
    :edat := varEdat;
END;
/
PRINT nom;
PRINT cognom;
PRINT edat;
UNDEFINE nom cognom edat;

*/
/*

-- 2.-

ACCEPT preuUsuari PROMPT 'Introdueix el preu';
VARIABLE preu NUMBER;

DECLARE
    varPreu NUMBER := &preuUsuari * 0.18;

BEGIN
    :preu := ROUND(varPreu);
END;
/
PRINT preu;
UNDEFINE preu preuUsuari;

*/
/*

-- 3.-

DECLARE
    preu NUMBER := &preu;

BEGIN
    preu := preu * 0.18;
    DBMS_OUTPUT.PUT_LINE(ROUND(preu));
END;

*/
/*

-- 4.-

DECLARE
    salari NUMBER(8, 2) := &salari;
    comissio NUMBER(8, 2) := &comissio;

BEGIN
    IF salari < 100 THEN
        comissio := salari * 0.1;
    ELSIF salari >= 100 AND salari <= 500 THEN
        comissio := salari * 0.15;
    ELSIF salari > 1000 THEN
        comissio := salari * 0.2;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Salari: '||salari||' Comissió: '||comissio);
END;

*/
/*

-- 5.-

DECLARE
    edatNegativa EXCEPTION;
    edatUsuari INT := &Introdueix_Edat_Usuari;

BEGIN
    IF edatUsuari < 0 THEN
        RAISE edatNegativa;
    ELSIF edatUsuari < 18 THEN
        DBMS_OUTPUT.PUT_LINE('ets menor de edat!');
    ELSIF edatUsuari = 18 THEN
        DBMS_OUTPUT.PUT_LINE('casi ets major de edat!');
    ELSIF edatUsuari > 40 THEN
        DBMS_OUTPUT.PUT_LINE('Ets viejoven!');
    ELSIF edatUsuari > 18 THEN
        DBMS_OUTPUT.PUT_LINE('ets major de edat!');
    END IF;
    EXCEPTION
        WHEN edatNegativa THEN
            DBMS_OUTPUT.PUT_LINE('error edat no pot ser negativa');
END;

*/
/*

-- 6.-

DECLARE
    numeroUsuari INT := &Introdueix_un_numero;
    suma INT := numeroUsuari + 4;
    resta INT := numeroUsuari - 3;
    multiplicacio INT := numeroUsuari * 8;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Suma: '||suma||' Resta: '||resta||' Multiplicació: '||multiplicacio);
END;

*/
/*

-- 7.-

VARIABLE numeroFora NUMBER;

DECLARE
    numeroNegatiu EXCEPTION;
    num1 NUMBER := &numero_1;
    num2 NUMBER := &numero_2;

BEGIN
    IF num1 < 0 OR num2 < 0 THEN
        RAISE numeroNegatiu;
    END IF;
    :numeroFora := (num1/num2) + num2;
    
    EXCEPTION
        WHEN numeroNegatiu THEN
            DBMS_OUTPUT.PUT_LINE('Els número no poden ser negatius.');
END;
/
print numeroFora

*/
/*

-- 8.-

VARIABLE numeroFora NUMBER;

DECLARE
    numeroNegatiu EXCEPTION;
    num2MesGran EXCEPTION;
    num1 NUMBER := &numero_1;
    num2 NUMBER := &numero_2;

BEGIN
    IF num1 < 0 OR num2 < 0 THEN
        RAISE numeroNegatiu;
    ELSIF num2 > num1 THEN
        RAISE num2MesGran;
    END IF;
    :numeroFora := (num1/num2) + num2;
    
    EXCEPTION
        WHEN numeroNegatiu THEN
            DBMS_OUTPUT.PUT_LINE('Els número no poden ser negatius.');
        WHEN num2MesGran THEN
            DBMS_OUTPUT.PUT_LINE('El segon número no pot ser més gran que el primer');
END;
/
print numeroFora

*/
/*

-- 9.- Método For

DECLARE
    rangMaxim INT := &Introdueix_el_rang_maxim;

BEGIN
    FOR i IN 1..rangMaxim
        LOOP
            DBMS_OUTPUT.PUT_LINE(i);
        END LOOP;
END;

*/
/*

-- 9.- Método While

DECLARE
rangMinim INT := 1;
rangMaxim INT := &Introdueix_el_rang_maxim;

BEGIN
    WHILE rangMinim <= rangMaxim
        LOOP
            DBMS_OUTPUT.PUT_LINE(rangMinim);
            rangMinim := rangMinim + 1;
        END LOOP;
END;

*/
/*

-- 10.-

DECLARE
    rangErroni EXCEPTION;
    saltErroni EXCEPTION;
    rangMinim INT := &rangMinim;
    rangMaxim INT := &rangMaxim;
    step INT := &step;
    repeticio INT:= (rangMaxim - rangMinim)/step;
    
BEGIN
    IF rangMinim > rangMaxim THEN
        RAISE rangErroni;
    ELSIF step <= 0 THEN
        RAISE saltErroni;
    END IF;
    
    FOR i IN 0..repeticio
        LOOP
            DBMS_OUTPUT.PUT_LINE(rangMinim + (step * i));
        END LOOP;
        
    IF rangMinim + (repeticio  * step) != rangMaxim THEN
        DBMS_OUTPUT.PUT_LINE(rangMaxim);
    END IF;
    
    EXCEPTION
        WHEN rangErroni THEN
            DBMS_OUTPUT.PUT_LINE('El rang máxim no pot ser més petit que el mínim.');
        WHEN saltErroni THEN
            DBMS_OUTPUT.PUT_LINE('El salt no pot ser 0 o negatiu.');
            
END;

*/
      

