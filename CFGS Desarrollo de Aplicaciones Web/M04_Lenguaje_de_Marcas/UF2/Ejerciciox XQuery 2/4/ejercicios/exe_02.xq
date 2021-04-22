(: 2.- Obtenir el «title» i el «price» dels «book» de «price» inferior a 35, mostrar aquestes dades dintre d’elements «titol» i «preu», i dintre d’un element arrel «llibres» y mostrar aquestes dades dintre d’elements «titol» i «preu», dintre d’elements «llibre», i dintre d’un element arrel «llibres» :)
<llibres> {
for $books in /bookstore/book
where $books/price < 35
return
<llibre>
<titol>{data($books/title)}</titol>
<preu>{data($books/price)}</preu>
</llibre>
}</llibres>