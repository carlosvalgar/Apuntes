(:2.- Devolver los títulos de los libros almacenados y su primer autor. En caso de que haya más de un autor para un libro se añade un segundo autor "cia".:)
for $libros_biblioteca in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejerciciox XQuery 2\1\libros2.xml")/biblioteca/libros/libro

return if (count($libros_biblioteca/autor) > 1)
then<libro>{$libros_biblioteca/titulo} {$libros_biblioteca/autor[1]} <autor>cia</autor></libro> 
else<libro>{$libros_biblioteca/titulo} {$libros_biblioteca/autor}</libro> 