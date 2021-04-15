(:4.- Mostrar sólo el título sin atributos de los libros cuyo precio sea igual a 30.:)
for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book
where number($book/price) = 30
return <title>{$book/title/node()}</title>