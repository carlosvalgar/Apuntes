(: 4.- Obtenir el «title» dels «book». Mostrar cada «title» com a contingut d’un element «llibre», i tots els «llibre» dintre d’un element arrel «llibres».
L’element «llibre» ha de tenir una atribut «num», un número que indica la posició del llibre dintre de la seqüència de llibres.:)
<llibres>
{for $books at $counter in /bookstore/book
return
<llibre num="{$counter}">{data($books/title)}</llibre>}
</llibres>
