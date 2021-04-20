declare function local:calculoIva($precio as xs:decimal?, $iva as xs:decimal?) as xs:decimal?{
  let $iva_bueno := $iva div 100, $res := round($precio + ($precio * $iva_bueno), 2)
  return $res
};

for $book in doc("C:\Users\Jutox\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book
return local:calculoIva($book/price, 21)