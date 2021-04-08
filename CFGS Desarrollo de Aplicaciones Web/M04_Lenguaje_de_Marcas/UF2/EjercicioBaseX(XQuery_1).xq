(:1.- Haz un html que seleccione los titulos de los tutoriales y lo genere con un tag de muchas_visitas si tiene más de 10.000 visitas, sino sera un tag de pocas_visitas.:)
(:
for $tutorial in doc("C:\Users\Jutox\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\tutoriales.xml")/tutoriales/tutorial
return if ($tutorial/visitas > 10000)
then <muchas_visitas>{data($tutorial/titulo)}</muchas_visitas>
else <pocas_visitas>{data($tutorial/titulo)}</pocas_visitas>
:)
(:2.- Genere una lista ordenada del numero de visitas con los tags del ejercicio anterior.:)
(:
<html>
  <body>
    <ol>
      {
      for $tutorial in doc("C:\Users\Jutox\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\tutoriales.xml")/tutoriales/tutorial
      order by number($tutorial/visitas)
      return if ($tutorial/visitas > 10000)
      then <li><muchas_visitas>{data($tutorial/titulo)}</muchas_visitas></li>
      else <li><pocas_visitas>{data($tutorial/titulo)}</pocas_visitas></li>
      }
    </ol>
  </body>
</html>
:)