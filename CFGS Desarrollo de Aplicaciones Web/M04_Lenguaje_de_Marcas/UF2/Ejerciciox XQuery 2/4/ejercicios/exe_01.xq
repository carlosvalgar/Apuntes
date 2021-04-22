(:1.- Obtenir els elements «book» de «price» inferior o igual a 40 i «category» igual a «WEB». Mostrar tots els elements «book» dintre d’un element arrel
«sales»:)
<sales>
{for $books in /bookstore/book[@category = "WEB"]
where $books/price <= 40
return $books}
</sales>