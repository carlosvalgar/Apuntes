(:8.- Mostrar cuántos libros hay, y etiquetarlo con "total".:)
for $books in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore
return <total>{count($books/book)}</total>