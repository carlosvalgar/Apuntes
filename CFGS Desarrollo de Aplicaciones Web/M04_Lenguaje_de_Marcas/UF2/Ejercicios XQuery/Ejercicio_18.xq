(:18.- Mostrar los libros que tengan una "E" mayúscula o minúscula en el título ordenados de manera descendente:)
for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book
where contains(upper-case($book/title), "E")
order by $book/title descending
return $book