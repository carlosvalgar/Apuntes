(: 8.- Contingut d’un element «tema», i dintre d’un element arrel «temes». Ordenar per «category».:)
<temes>
{for $temes in distinct-values(for $tema in /bookstore/book/@category
return $tema)
return <tema>{$temes}</tema>}
</temes>