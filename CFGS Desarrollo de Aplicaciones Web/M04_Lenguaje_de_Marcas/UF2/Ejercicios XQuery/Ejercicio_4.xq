(:4.- Mostrar sólo el título sin atributos de los libros cuyo precio sea igual a 30.:)
for $book in doc("C:\Users\Jutox\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book
where number($book/price) = 30
return $book/title/node()