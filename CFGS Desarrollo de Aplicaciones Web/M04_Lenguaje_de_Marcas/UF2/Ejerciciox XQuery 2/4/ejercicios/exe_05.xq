(: 5.- Mostrar aquestes dades dintre d’elements «min_preu», «max_preu» i
«mitjana_preu», i dintre d’un element arrel «estadistica».:)
<estadistica>
{let $preus := for $price in /bookstore/book/price return $price
return <min_preu>{min($preus)}</min_preu> | <max_preu>{max($preus)}</max_preu> | <mitjana_preu>{avg($preus)}</mitjana_preu>}
</estadistica>