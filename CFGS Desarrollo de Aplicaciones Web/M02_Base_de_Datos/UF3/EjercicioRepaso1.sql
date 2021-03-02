SET SERVEROUTPUT ON;

-- 1.-
/*

CREATE OR REPLACE PROCEDURE aumento(editorialAumento IN libros.editorial%TYPE) AS
BEGIN
UPDATE LIBROS SET PRECIO = PRECIO + PRECIO*0.1 WHERE EDITORIAL = editorialAumento;
END;
/

BEGIN
aumento('&editorial');
END;
/

*/
-- 2.-
/*

CREATE OR REPLACE PROCEDURE aumentoConPrecio(editorialAumento IN libros.editorial%TYPE, aumentoPrecio IN NUMBER DEFAULT 10) AS -- En vez de default también se puede usar :=
BEGIN
UPDATE LIBROS SET PRECIO = PRECIO + PRECIO*aumentoPrecio/100 WHERE EDITORIAL = editorialAumento;
END;
/

*/
/*

BEGIN
aumentoConPrecio('Planeta', 30);
aumentoConPrecio('Paidos');
END;
/
SELECT * from libros where editorial = 'Paidos' OR editorial = 'Planeta';

*/
-- 3.-
/*

CREATE OR REPLACE PROCEDURE insertarLibros(titulo IN libros.titulo%TYPE := NULL, autor IN libros.autor%TYPE := NULL, editorial libros.editorial%TYPE := NULL, precio libros.precio%TYPE := NULL) AS
BEGIN
INSERT INTO LIBROS
VALUES (titulo, autor, editorial, precio);
END;
/

*/
/*

BEGIN
insertarLibros(titulo => 'nose', precio => 69 );
END;
/

select * from libros;
*/