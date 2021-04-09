(:1.- Mostra el títol dels jocs ordenats per distribuïdora:)
for $juego in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\games.xml")/Catalog/Game
order by $juego/Publisher
return $juego/Title