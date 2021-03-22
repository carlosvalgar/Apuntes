SET SERVEROUTPUT ON;

-- 1.- Crea una función DevolverNombreEquipo que reciba un código de equipo y devuelva el nombre del mismo. Si el equipo no existe devuelve la cadena “Error en código”.

CREATE OR REPLACE FUNCTION DevolverNombreEquipo(var_codigo_equipo equipos1.codequipo%TYPE) RETURN VARCHAR2 AS
var_nombre_equipo equipos1.nombre%TYPE;
BEGIN
    SELECT nombre INTO var_nombre_equipo FROM equipos1 WHERE codequipo = var_codigo_equipo;
    RETURN var_nombre_equipo;
EXCEPTION
    WHEN no_data_found THEN
        RETURN 'Error en código';
    WHEN OTHERS THEN
        RETURN 'Error no controlado';
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(DevolverNombreEquipo(1111));
END;
/


-- 2.- Crea una procedimiento DevolverGolesEquipo que reciba el código de un equipo y devuelva el total de goles a favor y total de goles en contra. Contempla las excepciones oportunas.
CREATE OR REPLACE PROCEDURE DevolverGolesEquipo(var_codigo_equipo equipos1.codequipo%TYPE) AS
CURSOR c_partidos IS
SELECT CODEQUIPOLOCAL, CODEQUIPOVISITANTE, GOL_LOCAL, GOL_VISITANTE FROM partidos1 WHERE CODEQUIPOLOCAL = var_codigo_equipo OR CODEQUIPOVISITANTE = var_codigo_equipo;
var_c_partidos c_partidos%ROWTYPE;
goles_a_favor NUMBER := 0;
goles_en_contra NUMBER := 0;
nombre_equipo equipos1.nombre%TYPE;

BEGIN
SELECT nombre INTO nombre_equipo FROM EQUIPOS1 WHERE CODEQUIPO = var_codigo_equipo;
OPEN c_partidos;
    LOOP
    FETCH c_partidos INTO var_c_partidos;
    EXIT WHEN c_partidos%NOTFOUND;
        IF var_c_partidos.CODEQUIPOLOCAL = var_codigo_equipo THEN
            goles_a_favor := goles_a_favor + var_c_partidos.gol_local;
            goles_en_contra := goles_en_contra + var_c_partidos.gol_visitante;
            
        ELSIF var_c_partidos.CODEQUIPOVISITANTE = var_codigo_equipo THEN
            goles_a_favor := goles_a_favor + var_c_partidos.gol_visitante;
            goles_en_contra := goles_en_contra + var_c_partidos.gol_local;
        END IF;
    END LOOP;
CLOSE c_partidos;
DBMS_OUTPUT.PUT_LINE('Goles del a favor del equipo '||nombre_equipo||' (código: '||var_codigo_equipo||'): '||goles_a_favor||'
Goles en contra del equipo '||nombre_equipo||' (código: '||var_codigo_equipo||'): '||goles_en_contra);
EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: El código de equipo que has introducido no existe');
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: Error inesperado.');
END;
/

BEGIN
DevolverGolesEquipo(1111);
END;
/

-- 3.- Crea un procedimiento DevolverResultadosEquipo que reciba el código de un equipo y devuelva el número de partidos que ha ganado, el número de partidos que ha perdido y el número de partidos que ha empatado. Contempla las excepciones oportunas.
CREATE OR REPLACE PROCEDURE DevolverResultadosEquipo(var_codigo_equipo equipos1.codequipo%TYPE) AS
CURSOR c_partidos IS
SELECT CODEQUIPOLOCAL, CODEQUIPOVISITANTE, GOL_LOCAL, GOL_VISITANTE FROM partidos1 WHERE CODEQUIPOLOCAL = var_codigo_equipo OR CODEQUIPOVISITANTE = var_codigo_equipo;
var_c_partidos c_partidos%ROWTYPE;
partidos_ganados NUMBER := 0;
partidos_perdidos NUMBER := 0;
partidos_empatados NUMBER := 0;
nombre_equipo equipos1.nombre%TYPE;

BEGIN
SELECT nombre INTO nombre_equipo FROM EQUIPOS1 WHERE CODEQUIPO = var_codigo_equipo;
OPEN c_partidos;
    LOOP
    FETCH c_partidos INTO var_c_partidos;
    EXIT WHEN c_partidos%NOTFOUND;
        IF var_c_partidos.CODEQUIPOLOCAL = var_codigo_equipo THEN
            IF var_c_partidos.gol_local > var_c_partidos.gol_visitante THEN
                partidos_ganados := partidos_ganados + 1;
                
            ELSIF var_c_partidos.gol_local < var_c_partidos.gol_visitante THEN
                partidos_perdidos := partidos_perdidos + 1;
                
            ELSIF var_c_partidos.gol_local = var_c_partidos.gol_visitante THEN
                partidos_empatados := partidos_empatados + 1;
                
            END IF;
            
        ELSIF var_c_partidos.CODEQUIPOVISITANTE = var_codigo_equipo THEN
            IF var_c_partidos.gol_local > var_c_partidos.gol_visitante THEN
                partidos_perdidos := partidos_perdidos + 1;
                
            ELSIF var_c_partidos.gol_local < var_c_partidos.gol_visitante THEN
                partidos_ganados := partidos_ganados + 1;
                
            ELSIF var_c_partidos.gol_local = var_c_partidos.gol_visitante THEN
                partidos_empatados := partidos_empatados + 1;
                
            END IF;
            
        END IF;
    END LOOP;
CLOSE c_partidos;
DBMS_OUTPUT.PUT_LINE('Resultados del equipo: '||nombre_equipo||' (código: '||var_codigo_equipo||')
---------------------------------------------
Partidos Ganados: '||partidos_ganados||'
Partidos Perdidos: '||partidos_perdidos||'
Partidos Empatados: '||partidos_empatados);

EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: El código de equipo que has introducido no existe');
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: Error inesperado.');
END;
/

BEGIN
DevolverResultadosEquipo(1111);
END;
/