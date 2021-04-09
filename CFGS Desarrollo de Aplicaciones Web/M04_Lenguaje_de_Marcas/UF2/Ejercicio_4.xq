(:4.- Mostra el títol i la data de sortida dels jocs que al menys un dels seus generes que sigui "Third Person Shooter":)
<Games>
{for $juego in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\games.xml")/Catalog/Game
where $juego/Genres/Genre = "Third Person Shooter"
return
<Game>
  <Title>{data($juego/Title)}</Title>
  <PublishDate>{data($juego/PublishDate)}</PublishDate>
</Game>}
</Games>