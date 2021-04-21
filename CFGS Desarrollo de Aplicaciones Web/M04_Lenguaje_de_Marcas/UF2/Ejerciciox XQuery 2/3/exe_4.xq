(:4.- Crea una consulta XQuery per tal que retorni cost total de totes les factures. :)
for $facturacio in /facturacio
return <facturacio>{sum($facturacio/factura/rebut/totalrebut)}</facturacio>