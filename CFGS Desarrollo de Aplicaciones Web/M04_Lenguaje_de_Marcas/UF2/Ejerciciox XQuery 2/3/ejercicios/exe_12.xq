(:12.- Mostra una llista de tots els equips que juguen el torneig, només mostrant els 3 primers caràcters.:)
<teams>
{for $equips in distinct-values(for $equip_tres_lletres in /competition/round/match/summary/team/@name
return substring($equip_tres_lletres, 1, 3))
return <team>{$equips}</team>}
</teams>