(:15.- Mostrar en la misma etiqueta el título y entre guiones el número de
autores que tiene ese título.:)
for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book
return <titulo_cantidad_autores>{data($book/title)} -{count($book/author)}- </titulo_cantidad_autores>