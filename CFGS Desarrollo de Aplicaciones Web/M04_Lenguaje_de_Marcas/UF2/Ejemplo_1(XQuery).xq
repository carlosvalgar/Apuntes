(:Ejemplo FLWOR:)
(:
for $tutorial in doc("C:\Users\Jutox\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\tutoriales.xml")/tutoriales/tutorial
where $tutorial/@anio = "2013"
order by $tutorial/titulo
return $tutorial/titulo
:)
(:Ejemplo FLWOR con tags de html:)
(:
<ul>
  {
  for $tutorial in doc("C:\Users\Jutox\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\tutoriales.xml")/tutoriales/tutorial
  where $tutorial/@anio = "2013"
  order by $tutorial/titulo
  return<li> {data($tutorial/titulo)}</li>
  }
</ul>
:)