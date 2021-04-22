(: 6.- Obtenir el «year», el «title» i la quantitat d’elements «author» dels
«book» ordenats per «year» i «title». Mostrar aquestes dades dintre d’elements «year», «titol» i «num_autors», dintre d’elements «llibre», i dintre d’un element arrel «llibres».:)
<llibres>
{for $books in /bookstore/book
order by $books/year, $books/title
return 
<llibre>
<any>{data($books/year)}</any>
<titol>{data($books/title)}</titol>
<num_autors>{data(count($books/author))}</num_autors>
</llibre>}
</llibres>