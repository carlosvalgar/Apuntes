(:5.- Crea una consulta XQuery per tal que retorni cost total de totes les factures, però diferenciades entre les factures a persones i les factures a empreses.:)
let 
$factura_empresa := for $empresa in /facturacio/factura[client/raosocial/@tipus = "empresa"]
return $empresa/rebut/totalrebut,
$factura_persona := for $empresa in /facturacio/factura[client/raosocial/@tipus = "persona"]
return $empresa/rebut/totalrebut
return 
<facturacio>
<persona>{sum($factura_persona)}</persona>
<empresa>{sum($factura_empresa)}</empresa>
</facturacio>