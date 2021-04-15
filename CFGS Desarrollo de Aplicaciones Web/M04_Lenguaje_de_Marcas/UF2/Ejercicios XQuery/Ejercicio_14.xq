(:14.- Mostrar el título y el número de autores que tiene cada título en etiquetas diferentes.:)
for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book

return (<libro>{$book/title, <numero_autores>{count($book/author)}</numero_autores>}</libro>)