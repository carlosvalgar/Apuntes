(:11.- Fes un resum de tots els partits que ha jugat França:)
<maxPoints>
{for $partit in /competition/round/match[summary/team/@name = "France"]
let
$nom_equip1 := $partit/summary/team[1]/@name,
$nom_equip2 := $partit/summary/team[2]/@name,
$punts_equip1 := $partit/summary/team[1]/@score,
$punts_equip2 := $partit/summary/team[2]/@score
return <match>{concat($nom_equip1, " ", $punts_equip1, " - ", $punts_equip2, " ", $nom_equip2)}</match>}
</maxPoints>