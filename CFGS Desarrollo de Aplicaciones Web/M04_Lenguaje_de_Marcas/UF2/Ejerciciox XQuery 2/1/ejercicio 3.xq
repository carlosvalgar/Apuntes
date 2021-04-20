(: 3.- Devolver  todos los autores que ha léido Pepito Grillo.:)
for $libros_prestados in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejerciciox XQuery 2\1\prestamos.xml")/prestamos/entrada, $libros_biblioteca in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejerciciox XQuery 2\1\libros2.xml")/biblioteca/libros/libro
where $libros_prestados/titulo = $libros_biblioteca/titulo and $libros_prestados/prestamo/lector/nombre = "Pepito" and $libros_prestados/prestamo/lector/apellidos = "Grillo"
return $libros_biblioteca/autor
