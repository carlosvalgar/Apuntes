(:1.- Mostrar los títulos de los libros con la etiqueta "novedades".:)
for $book in doc("C:\Users\Jutox\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book/title
return <novedades>{data($book)}</novedades>
