/* 1 */
SELECT nombre FROM producto;
/* 2 */
SELECT nombre, precio FROM producto;
/* 3 */
SELECT * FROM producto;
/* 4 */
SELECT precio AS "Precio en Euros", FORMAT(precio * 1.19, 2) 
AS "Precio en Dólares" FROM producto;
/* 5 */
SELECT nombre AS "Nombre de producto", precio AS "Euros", FORMAT(precio * 1.19, 2) 
AS "Dólares" FROM producto;
/* 6 */
SELECT UPPER(nombre) AS NOMBRE, UPPER(precio) AS PRECIO FROM producto;
/* 7 */
SELECT LOWER(nombre) AS nombre, LOWER(precio) AS precio FROM producto;
/* 8 */
SELECT nombre, UPPER(SUBSTR(nombre, 1, 2)) AS "Iniciales" FROM fabricante;
/* 9 */
SELECT nombre, ROUND(precio, 0) AS "Precio redondeado" FROM producto;
/* 10 */
SELECT nombre, TRUNCATE(precio, 0) AS "Precio truncado" FROM producto;
/* 11 */
SELECT fabricante.codigo FROM fabricante 
INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
/* 12 */
SELECT DISTINCT fabricante.codigo FROM fabricante 
INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
/* 13 */
SELECT nombre FROM fabricante ORDER BY nombre ASC;
/* 14 */
SELECT nombre FROM fabricante ORDER BY nombre DESC;
/* 15 no entiendo */ 
SELECT nombre, precio FROM producto 
ORDER BY nombre ASC, precio DESC;
/* 16 */
SELECT * FROM fabricante LIMIT 5;
/* 17 */
SELECT * FROM fabricante LIMIT 3, 2;
/* 18 */
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1; 
/* 19 */
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1; 
/* 20 */
SELECT nombre FROM fabricante WHERE codigo = 2;
/* 21 */
SELECT nombre FROM producto WHERE precio <= 120;
/* 22 */
SELECT nombre FROM producto WHERE precio >= 400;
/* 23 */
SELECT nombre FROM producto WHERE NOT precio >= 400;
/* 24 */
SELECT nombre FROM producto WHERE precio >= 80 AND precio <= 300;
/* 25 */
SELECT nombre FROM producto WHERE precio BETWEEN 60 AND 200;
/* 26 */
SELECT nombre FROM producto WHERE precio > 200 AND codigo_fabricante = 6;
/* 27 */
SELECT nombre FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3
OR codigo_fabricante = 5;
/* 28 */
SELECT nombre FROM producto WHERE codigo_fabricante IN (1, 3, 5);
/* 29 */
SELECT nombre, (precio * 100) AS "Céntimos" FROM producto;
/* 30 */
SELECT nombre FROM fabricante WHERE nombre LIKE "S%";
/* 31 */
SELECT nombre FROM fabricante WHERE nombre LIKE "%e";
/* 32 */
SELECT nombre FROM fabricante WHERE nombre LIKE "%w%";
/* 33 */
SELECT nombre FROM fabricante WHERE LENGTH(nombre) = 4;
/* 34 */
SELECT nombre FROM producto WHERE nombre LIKE "%Portátil%";
/* 35 */
SELECT nombre FROM producto WHERE nombre LIKE "%Monitor%" AND precio < 215;
/* 36 no entiendo */
SELECT nombre, precio FROM producto WHERE precio >= 180 
ORDER BY precio DESC, nombre ASC;