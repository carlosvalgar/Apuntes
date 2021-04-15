(:19.- Mostrar el título y el número de caracteres que tiene cada título, cada
uno con su propia etiqueta.:)
for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book
return
<libro>
{$book/title}
<numero_caracteres>{string-length($book/title)}</numero_caracteres>
</libro>