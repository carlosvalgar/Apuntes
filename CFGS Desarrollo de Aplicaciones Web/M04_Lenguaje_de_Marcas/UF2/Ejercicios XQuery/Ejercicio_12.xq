(:12.- Mostrar la suma total de los precios de los libros con la etiqueta "total":)
<total>
{sum(for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book/price
return $book)}
</total>