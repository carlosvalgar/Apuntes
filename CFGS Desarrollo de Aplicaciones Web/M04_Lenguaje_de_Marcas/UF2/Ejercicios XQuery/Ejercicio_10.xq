(:10.- Mostrar el precio mínimo y máximo de los libros.:)

let $items := doc("C:\Users\Jutox\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book/price
let $min := min($items), $max := max($items)
return 
<precios>
  <precio_minimo>{$min}</precio_minimo>
  <precio_maximo>{$max}</precio_maximo>
</precios>