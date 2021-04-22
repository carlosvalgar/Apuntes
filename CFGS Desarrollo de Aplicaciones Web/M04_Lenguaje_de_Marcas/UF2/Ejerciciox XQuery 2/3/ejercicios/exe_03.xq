(: 3.- Crea una consulta XQuery per tal que retorni el NIF d'aquells clients que siguin de tipus empresa ordenats ascendentment pel codi de client.:)
<empreses>
{for $client in /facturacio/factura/client[raosocial/@tipus = "empresa"]
order by $client/@codi
return $client/raosocial/NIF}
</empreses>