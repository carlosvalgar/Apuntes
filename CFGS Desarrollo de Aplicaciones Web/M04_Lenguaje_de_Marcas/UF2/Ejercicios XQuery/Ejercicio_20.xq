(:20.- Mostrar todos los años en los que se ha publicado un libro eliminando los repetidos. Etiquétalos con "año":)
for $distinct_year in distinct-values(for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book
return $book/year)
return <año>{$distinct_year}</año>