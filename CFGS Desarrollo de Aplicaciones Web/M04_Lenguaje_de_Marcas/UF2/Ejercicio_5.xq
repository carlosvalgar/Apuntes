(:5.- Mostra el titol dels jocs amb el tag "multiplataforma" si estan disponibles per PC, PS4, Xbox One i Switch, i amb el tag ExcepteSwitch els que nomès estan disponibles per PC, PS4 i Xbox One:)
for $juego in doc("C:\Users\Carlos\Desktop\Apuntes\CFGS Desarrollo de Aplicaciones Web\M04_Lenguaje_de_Marcas\UF2\games.xml")/Catalog/Game
return if(count($juego/Prices/(Pc|Ps4|XboxOne|Switch)) = 4)
then <Multiplataforma>{data($juego/Title)}</Multiplataforma>
else if(count($juego/Prices/(Pc|Ps4|XboxOne)) = 3)
then <ExcepteSwitch>{data($juego/Title)}</ExcepteSwitch>