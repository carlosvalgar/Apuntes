(:9.- Mostrar los títulos de los libros y al final una etiqueta con el número total de libros.:)

let $titulos := for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book return <titulo>{data($book/title)}</titulo>

let $cantidadLibros := for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore return <total>{count($book/book)}</total>

return
$titulos | $cantidadLibros





