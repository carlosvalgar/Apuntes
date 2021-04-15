(:7.- Mostrar los libros ordenados primero por "author" y luego por "category" en una sola consulta.:)
for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book
order by $book/author[1], $book/@category
return $book

(: No se como se ordena el libro que tiene 5 autores :)