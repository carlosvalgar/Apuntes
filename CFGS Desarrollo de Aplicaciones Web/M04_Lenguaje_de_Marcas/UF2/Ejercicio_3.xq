(:3.- Mostra el títol i el número de desenvolupadors dels jocs que tinguin més d'un desenvolupador:)
for $juego in doc("C:\Users\Jutox\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\games.xml")/Catalog/Game
where data(count($juego/Developers/Developer)) > 1
return
<Game>
  <Title>{data($juego/Title)}</Title>
  <DeveloperNumber>{data(count($juego/Developers/Developer))}</DeveloperNumber>
</Game>