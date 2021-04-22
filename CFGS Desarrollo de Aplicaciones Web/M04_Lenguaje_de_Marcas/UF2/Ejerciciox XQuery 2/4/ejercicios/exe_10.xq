(: 10.- Obtenir les «category» sense repetits i, dintre de cada «category», els
«title» dels «book» i la mitjana de «price».:)
<temes>
{for $categories in distinct-values(for $categories in /bookstore/book/@category
return $categories)
return 
<tema nom="{$categories}">
<llibres>
{for $books in /bookstore/book[@category = $categories]/title return <llibre>{data($books)}</llibre>}
</llibres>
<mitjana_preu>
{avg(for $books in /bookstore/book[@category = $categories]/price return $books)}
</mitjana_preu>
</tema>}
</temes>