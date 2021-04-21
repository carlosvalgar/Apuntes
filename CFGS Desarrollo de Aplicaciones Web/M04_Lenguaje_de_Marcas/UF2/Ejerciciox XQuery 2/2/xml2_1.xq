(: 1.- Mostrar la tabla anterior.:)
<html>
<body>
  <table border = "1">
    <tr>
      <th>Nombre</th>
      <th>Precio (en euros)</th>
      <th>Descripción</th>
      <th>Calorías</th>
    </tr>
    {for $desayuno in doc("C:\Users\Jutox\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\Ejerciciox XQuery 2\2\desayunos.xml")/Carta_desayunos/desayuno
    return
    <tr>
      <td>{data($desayuno/nombre)}</td>
      <td>{data($desayuno/precio)}</td>
      <td>{data($desayuno/descripcion)}</td>
      <td>{data($desayuno/calorias)}</td>
    </tr>}
  </table>
</body>
</html>