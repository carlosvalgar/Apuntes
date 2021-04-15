(:10.- Mostrar el precio mínimo y máximo de los libros.:)

for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore 
let $items := $book/book/price
let $min := min($items)
let $max := max($items)
return 
<precios>
  <precio_minimo>{$min}</precio_minimo>
  <precio_maximo>{$max}</precio_maximo>
</precios>