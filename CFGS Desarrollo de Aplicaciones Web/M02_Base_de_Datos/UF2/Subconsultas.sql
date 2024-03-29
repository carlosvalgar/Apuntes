-- Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT *
FROM producto
WHERE codigo_fabricante =  (
  SELECT codigo
  FROM fabricante
  WHERE nombre = 'Lenovo');

-- Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT *
FROM producto
WHERE precio = (
	SELECT MAX(precio)
	FROM producto
	WHERE producto.codigo_fabricante = (
		SELECT codigo
		FROM fabricante
		WHERE nombre = 'Lenovo'));

-- Lista el nombre del producto más caro del fabricante Lenovo.
SELECT producto.nombre
FROM fabricante 
INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.nombre = 'Lenovo' AND producto.precio = (
	SELECT MAX(precio)
	FROM fabricante INNER JOIN producto
	ON fabricante.codigo = producto.codigo_fabricante
	WHERE fabricante.nombre = 'Lenovo');
  
-- Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT producto.nombre
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.nombre = 'Hewlett-Packard' AND producto.precio = (
  SELECT MIN(precio)
  FROM fabricante INNER JOIN producto
  ON fabricante.codigo = producto.codigo_fabricante
  WHERE fabricante.nombre = 'Hewlett-Packard');

-- Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT *
FROM producto
WHERE precio >= (
  SELECT MAX(precio)
  FROM fabricante INNER JOIN producto
  ON fabricante.codigo = producto.codigo_fabricante
  WHERE fabricante.nombre = 'Lenovo');
-- Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT *
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.nombre = 'Asus' AND producto.precio > (
  SELECT AVG(precio)
  FROM fabricante INNER JOIN producto
  ON fabricante.codigo = producto.codigo_fabricante
  WHERE fabricante.nombre = 'Asus');

-- 1.1.7.2 Subconsultas con ALL y ANY
-- Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT *
FROM producto
WHERE precio >= ALL (
  SELECT precio
    FROM producto);
-- Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT *
FROM producto
WHERE precio <= ALL (
  SELECT precio
    FROM producto);
-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
SELECT nombre
FROM fabricante
WHERE codigo = ANY (
  SELECT codigo_fabricante
  FROM producto);
-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
SELECT nombre
FROM fabricante
WHERE codigo != ALL (
  SELECT codigo_fabricante 
  FROM producto);
SELECT nombre
FROM fabricante
WHERE NOT codigo = ANY (
  SELECT codigo_fabricante
  FROM producto);

-- 1.1.7.3 Subconsultas con IN y NOT IN
-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre
FROM fabricante
WHERE codigo IN (
  SELECT codigo_fabricante
  FROM producto);
  
-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre
FROM fabricante
WHERE codigo NOT IN (
  SELECT codigo_fabricante
  FROM producto);

-- 1.1.7.4 Subconsultas con EXISTS y NOT EXISTS
-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT nombre
FROM fabricante
WHERE  EXISTS (
  SELECT codigo_fabricante 
  FROM producto 
  WHERE producto.codigo_fabricante = fabricante.codigo);
-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT nombre
FROM fabricante
WHERE NOT EXISTS (
  SELECT codigo_fabricante 
  FROM producto 
  WHERE producto.codigo_fabricante = fabricante.codigo);

-- 1.1.7.5 Subconsultas correlacionadas
-- Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
/* Con un SELECT anidado y sin INNER JOIN */
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
AND producto.precio =
(
  SELECT MAX(precio)
  FROM producto
  WHERE codigo_fabricante = fabricante.codigo
);
 
/* Con un SELECT anidado y con INNER JOIN */
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto INNER JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio =
(
  SELECT MAX(precio)
  FROM producto
  WHERE codigo_fabricante = fabricante.codigo
);
-- Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
SELECT *
FROM producto AS p1
WHERE precio >= (SELECT AVG(precio)
      FROM producto AS p2
      WHERE p1.codigo_fabricante = p2.codigo_fabricante);
-- Lista el nombre del producto más caro del fabricante Lenovo.
SELECT producto.nombre
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.nombre = 'Lenovo' AND producto.precio = (
  SELECT MAX(precio)
  FROM producto
  WHERE codigo_fabricante = fabricante.codigo);

-- 1.1.8 Subconsultas (En la cláusula HAVING)
-- Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
SELECT fabricante.nombre, COUNT(producto.codigo)
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.codigo
HAVING COUNT(producto.codigo) >= (
  SELECT COUNT(producto.codigo)
  FROM fabricante INNER JOIN producto
  ON fabricante.codigo = producto.codigo_fabricante
  WHERE fabricante.nombre = 'Lenovo');