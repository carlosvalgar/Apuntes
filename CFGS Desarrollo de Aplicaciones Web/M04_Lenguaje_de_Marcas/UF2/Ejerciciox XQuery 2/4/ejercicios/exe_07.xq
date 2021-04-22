(: 7.- Obtenir el «title» i el «price» dels «book». Mostrar aquestes dades en frases del tipus «"«title»" «price»€» i «OFERTA: "«title»" «price»€».
Pels llibres amb un «price» inferior o igual a 30 la frase estarà prefixada per
«OFERTA: ».
Mostrar aquestes frases dintre d’un element «etiqueta», i dintre d’un element arrel «etiquetes».
Ordenar de forma descendent per «price» i ascendent per «title».
Ajuda: Fer servir el constructor if-then-else al let o al return per diferenciar els llibres per preu, i la funció concat() o l’operador «||» per construir el text.:)
<etiquetes>
{for $books in /bookstore/book
order by $books/price descending, $books/title ascending 
return if ($books/price <= 30)
then <etiqueta>OFERTA: "{data($books/title)}" {data($books/price)}€</etiqueta>
else <etiqueta>"{data($books/title)}" {data($books/price)}€</etiqueta>}
</etiquetes>