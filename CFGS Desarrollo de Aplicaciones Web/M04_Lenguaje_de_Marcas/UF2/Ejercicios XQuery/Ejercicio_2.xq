(:2.- Mostrar los libros cuyo precio sea mayor a 30. Primero incluyendo la condición en la cláusula "where" y luego en la ruta del XPath.:)

for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book
where number($book/price) > 30
return $book

for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book[number(price) > 30]
return $book
