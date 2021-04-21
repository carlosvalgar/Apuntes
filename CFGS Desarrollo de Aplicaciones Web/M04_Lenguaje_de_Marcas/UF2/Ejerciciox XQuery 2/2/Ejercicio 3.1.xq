<html>
<body>
{for $autores in distinct-values(for $autor in doc ("C:\Users\Jutox\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejerciciox XQuery 2\2\libros.xml")/bib/libro/autor/apellido
return $autor)
return 
<table border = "1">
<tr>
<td>
Libros de {data($autores)}
<table border = "1">
{for $libros in doc("C:\Users\Jutox\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejerciciox XQuery 2\2\libros.xml")/bib/libro
where $autores = $libros/autor/apellido return <tr><td>{data($libros/titulo)}</td><td>{data($libros/precio)}</td></tr>}
</table>
</td>
</tr>
</table>}
</body>
</html>