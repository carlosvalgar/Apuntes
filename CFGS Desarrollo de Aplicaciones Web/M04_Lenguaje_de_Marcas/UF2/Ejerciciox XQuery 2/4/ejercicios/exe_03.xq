(: 3.- Obtenir els «title» dels «book» que incloguin la cadena «ar» i  siguin de
«year» 2004 o 2010. Mostrar cada «title» com a contingut d’un element
«llibre», i tots els «llibre» dintre d’un element arrel «llibres».:)
<llibres>
{for $books in /bookstore/book[number(year) = 2004 or number(year) = 2010 ]
where contains($books/title, "ar")
return <llibre>{data($books/title)}</llibre>}
</llibres>