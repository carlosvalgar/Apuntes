(:1.- Obtener los títulos de los libros prestados con sus autores y la fecha de inicio y devolución del préstamo, ordenados por la fecha de inicio del prestamos. Todo esto mostrarlo en un listado HTML. :)
<html>
<body>
<ol>{
for $libros_prestados in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejerciciox XQuery 2\1\prestamos.xml")/prestamos/entrada, $libros_biblioteca in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejerciciox XQuery 2\1\libros2.xml")/biblioteca/libros/libro
let $nombre_autor := $libros_biblioteca/autor/nombre
order by $libros_prestados/prestamo/inicio
where $libros_prestados/titulo = $libros_biblioteca/titulo

return <li>Libro: {data($libros_prestados/titulo)}
<ol>
<li>Autor/es: {for $autores in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejerciciox XQuery 2\1\libros2.xml")/biblioteca/libros/libro/autor
where $autores/../titulo = $libros_prestados/titulo
return (data($autores/nombre) ||' '|| data($autores/apellido))}</li>
<li>Fecha inicio prestamo: {data($libros_prestados/prestamo/inicio)}</li>
<li>Fecha fin prestamo: {data($libros_prestados/prestamo/devolucion)}</li>
</ol>
</li>}
</ol>
</body>
</html>