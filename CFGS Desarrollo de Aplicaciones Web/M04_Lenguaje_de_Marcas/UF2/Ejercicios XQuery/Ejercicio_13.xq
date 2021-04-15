(:13.- Mostrar cada uno de los precios de los libros, y al final una nueva etiqueta con la suma de los precios:)
let $precioIndividual := for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book
return $book/price
let $precioTotal :=
<total>
{sum(for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book/price
return $book)}
</total>
return ($precioIndividual, $precioTotal)