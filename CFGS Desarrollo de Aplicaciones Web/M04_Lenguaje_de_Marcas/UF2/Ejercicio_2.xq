(:2.- Mostra títol, preu de Xbox One i el primer genere dels jocs d'EA:)
for $juego in doc("C:\Users\Jutox\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\games.xml")/Catalog/Game
where $juego/Publisher = "EA"
return 
<Game>
  <Title>{data($juego/Title)}</Title>
  <PriceXboxOne>{data($juego/Prices/XboxOne)}</PriceXboxOne>
  <FirstGenre>{data(($juego/Genres/Genre)[1])}</FirstGenre>
</Game>