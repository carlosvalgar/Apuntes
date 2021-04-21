(: 7.- Retorna el codi i data d'aquelles factures que hagin venut més de 4 productes.:)
<factures>
{for $factura in /facturacio/factura
where sum($factura/rebut/linies/producte/quantitat) > 4
return <factura>{concat($factura/@numero, " ",$factura/data)}</factura>}
</factures>