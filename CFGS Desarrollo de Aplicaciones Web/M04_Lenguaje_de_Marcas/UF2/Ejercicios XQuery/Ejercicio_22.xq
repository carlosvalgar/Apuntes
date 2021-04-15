(:22.-Mostrar los títulos en una tabla de HTML. :)
<html>
  <body>
    <table border = "1"> {
      for $book in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejercicios XQuery 1.xml")/bookstore/book
      return <tr><td>{data($book/title)}</td></tr>}
    </table>
  </body>
</html>