(:21.- Mostrar todos los autores eliminando los que se repiten y ordenados por el número de caracteres que tiene cada autor.:)
for $distinct_author in distinct-values(for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book
return $book/author)
order by string-length($distinct_author)
return <autor>{$distinct_author}</autor>