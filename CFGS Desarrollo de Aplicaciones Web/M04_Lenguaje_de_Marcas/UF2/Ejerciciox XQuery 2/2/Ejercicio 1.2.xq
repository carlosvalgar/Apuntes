(: 2.- Tabla con los el país cuyo precio (total) de todos los Cds sea el más elevado.:)
<html>
<body>
<table border = "1">
<tr>
<th colspan = "2">TOP VENTAS</th>
</tr>
<tr>
<th>PAIS</th>
<th>TOTAL</th>
</tr>
{for $cd in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejerciciox XQuery 2\2\cds_en_oferta.xml")/CD_OFERTA, $paises in distinct-values(for $listado_paises in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejerciciox XQuery 2\2\cds_en_oferta.xml")/CD_OFERTA/CD/pais
return $listado_paises)
order by sum($cd/CD[pais = $paises]/precio) descending
count $position
where $position eq 1
return
<tr>
<td>{$paises}</td>
<td>{sum($cd/CD[pais = $paises]/precio)}</td>
</tr>
}
</table>
</body>
</html>