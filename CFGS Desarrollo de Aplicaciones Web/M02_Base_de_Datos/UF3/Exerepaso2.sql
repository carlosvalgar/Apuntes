SET SERVEROUTPUT ON;

/* 
1.- Realiza un procedimiento llamado listadotresmasprestados que nos muestre por pantalla un listado de los tres libros más prestados y los socios a los que han sido prestados con el siguiente formato:

NombreLibro1 NumPrestamosLibro1 GeneroLibro1

DNISocio1 FechaPrestamoalSocio1
...
DNISocion FechaPrestamoal Socion

NombreLibro2 NumPrestamosLibro2 GeneroLibro2

DNISocio1 FechaPrestamoalSocio1
...
DNISocion FechaPrestamoalSocion

NombreLibro3 NumPrestamosLibro3 GeneroLibro3

DNISocio1 FechaPrestamoalSocio1
...
DNISocion FechaPrestamoalSocion

El procedimiento debe gestionar adecuadamente las siguientes excepciones:
La tabla Libros está vacía.
La tabla Socios está vacía.
Hay menos de tres libros que hayan sido prestados.
*/

CREATE OR REPLACE PROCEDURE listadoTresMasPrestados AS
menosDeTresPrestamos EXCEPTION;
libroTop1 libros.reflibro%TYPE;
cantidadLibroTop1 NUMBER := 0;

libroTop2 libros.reflibro%TYPE;
cantidadLibroTop2 NUMBER := 0;

libroTop3 libros.reflibro%TYPE;
cantidadLibroTop3 NUMBER := 0;

referenciaLibro libros.reflibro%TYPE;
cantidadReferenciaLibro NUMBER;

CURSOR c_libros IS
SELECT reflibro FROM libros;

CURSOR c_datos_socios IS
SELECT reflibro, dni, fechaprestamo FROM prestamos ORDER BY reflibro;

datos_socios c_datos_socios%ROWTYPE;

datos_libros libros%ROWTYPE;

numeroSocio NUMBER;

numeroLibrosPrestados NUMBER;

BEGIN
SELECT COUNT(*) INTO numeroLibrosPrestados FROM (SELECT DISTINCT reflibro FROM prestamos);
IF numeroLibrosPrestados < 3 THEN
    RAISE menosDeTresPrestamos;
END IF;

OPEN c_libros;
    LOOP
    FETCH c_libros INTO referenciaLibro;
        EXIT WHEN c_libros%NOTFOUND;
        SELECT COUNT(*) INTO cantidadReferenciaLibro FROM prestamos WHERE reflibro = referenciaLibro;
        IF cantidadReferenciaLibro > cantidadLibroTop1 THEN
            libroTop1 := referenciaLibro;
            cantidadLibroTop1 := cantidadReferenciaLibro;
            
        ELSIF cantidadReferenciaLibro > cantidadLibroTop2 THEN
            libroTop2 := referenciaLibro;
            cantidadLibroTop2 := cantidadReferenciaLibro;
            
        ELSIF cantidadReferenciaLibro > cantidadLibroTop3 THEN
            libroTop3 := referenciaLibro;
            cantidadLibroTop3 := cantidadReferenciaLibro;
        
        END IF;
    END LOOP;
CLOSE c_libros;

FOR i IN 1..3
LOOP
    IF i = 1 THEN
        referenciaLibro := libroTop1;
        cantidadReferenciaLibro := cantidadLibroTop1;
        
    ELSIF i = 2 THEN
        DBMS_OUTPUT.PUT_LINE('');
        referenciaLibro := libroTop2;
        cantidadReferenciaLibro := cantidadLibroTop2;
        
    ELSIF i = 3 THEN
        DBMS_OUTPUT.PUT_LINE('');
        referenciaLibro := libroTop3;
        cantidadReferenciaLibro := cantidadLibroTop3;
    END IF;
    
    SELECT nombre, genero INTO datos_libros.nombre, datos_libros.genero FROM libros WHERE reflibro = referenciaLibro;
DBMS_OUTPUT.PUT_LINE('NombreLibro '||i||': '||datos_libros.nombre||' NumPrestamosLibro '||i||': '||cantidadReferenciaLibro||' GeneroLibro '||i||': '||datos_libros.genero);

numeroSocio := 1;

OPEN c_datos_socios;
LOOP
    FETCH c_datos_socios INTO datos_socios;
    EXIT WHEN c_datos_socios%NOTFOUND; 
    IF datos_socios.reflibro = referenciaLibro THEN
    DBMS_OUTPUT.PUT_LINE('    DNI socio '||numeroSocio||': '||datos_socios.dni||' Fecha de préstamo al socio '||numeroSocio||': '||datos_socios.fechaprestamo);
    numeroSocio := numeroSocio +1;
    END IF;
END LOOP;
CLOSE c_datos_socios;
END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No hay datos en la tabla de socios, la de libros o la de prestamos.');
        
    WHEN menosDeTresPrestamos THEN
        DBMS_OUTPUT.PUT_LINE('Hay menos de tres libros prestados.');
        
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado.');
        
END;
/

BEGIN
listadoTresMasPrestados;
END;
/