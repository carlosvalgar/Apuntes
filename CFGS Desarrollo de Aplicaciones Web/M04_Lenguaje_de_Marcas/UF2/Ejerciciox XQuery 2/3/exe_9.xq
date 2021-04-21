(: 9.- La mitjana de punts que ha fet Italia en tot el torneig. Per fer-ho, has d'esbrinar quants punts ha fet en total i dividir-ho entre el nombre total de partits.:)

let $var_italia := for $italia in /competition/round/match/summary/team[@name = "Italy"]/@score return $italia, 
$sum_italia := sum($var_italia), 
$count_italia := count($var_italia)
return <Italy>{$sum_italia div $count_italia}</Italy>