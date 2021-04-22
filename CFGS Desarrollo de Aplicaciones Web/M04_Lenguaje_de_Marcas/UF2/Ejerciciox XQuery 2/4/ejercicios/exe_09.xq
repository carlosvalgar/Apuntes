(: 9.- Obtenir el «title» dels «book» que continguin la subcadena «XML» o
«XQuery». Mostrar cada «title» com a contingut d’un element «llibre» i tots els
«llibre» dintre d’un element arrel «llibres».
Ajuda: Fer servir la funció matches() i una expressió regular amb l’operador d’alternança «|».:)

<llibres>
{for $books in /bookstore/book/title
where matches($books, "XML|XQuery")
return <llibre>{data($books)}</llibre>}
</llibres>