(:1.- Tabla con los CDs ordenados de más antiguo a más moderno.:)
<html>
<body>
<table border = "1">
<tr>
<th colspan = "6">CDs EN OFERTA</th>
</tr>
<tr>
<th>Titulo</th>
<th>Artista</th>
<th>Pais</th>
<th>Compañia discografica</th>
<th>Precio</th>
<th>Año de publicacion</th>
</tr>
{for $cd in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejerciciox XQuery 2\2\cds_en_oferta.xml")/CD_OFERTA/CD
order by $cd/Año
return
<tr>
<td>{data($cd/titulo)}</td>
<td>{data($cd/artista)}</td>
<td>{data($cd/pais)}</td>
<td>{data($cd/discografica)}</td>
<td>{data($cd/precio)}</td>
<td>{data($cd/Año)}</td>
</tr>}
</table>
</body>
</html>