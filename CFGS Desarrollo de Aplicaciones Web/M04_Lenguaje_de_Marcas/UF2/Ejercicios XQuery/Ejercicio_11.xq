(:11.- Mostrar el título del libro y su precio con el IVA incluido, cada uno con su propia etiqueta. Ordénalos por precio con IVA.:)
for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book
order by round(data($book/price) * 1.04, 2)
return
<libro>
<titulo>{$book/title}</titulo>
<precio_con_IVA>{round(data($book/price) * 1.04, 2)}</precio_con_IVA>
</libro>