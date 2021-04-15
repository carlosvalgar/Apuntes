(:-16. Mostrar los libros escritos en años que terminen en "20".:)
for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book
where substring($book/year, string-length($book/year) -1) = "20"
return $book