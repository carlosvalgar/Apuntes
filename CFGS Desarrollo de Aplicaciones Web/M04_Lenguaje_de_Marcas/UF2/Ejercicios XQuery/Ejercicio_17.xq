(:17.- Mostrar los libros cuya categoría empiece por "W".:)
for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book
where substring(data($book/@category), 1, 1) = "W"
return $book