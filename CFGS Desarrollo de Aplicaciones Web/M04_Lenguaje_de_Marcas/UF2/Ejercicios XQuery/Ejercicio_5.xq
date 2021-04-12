(:5.- Mostrar el título y el autor de los libros del año 2005, y etiquetar cada uno de ellos con "libro2003":)
for $book in doc("C:\Users\Jutox\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book
where number($book/year) = 2005
return
<libro2003>
  {$book/title}
  {$book/author}
</libro2003>