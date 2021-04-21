(: 8.- Quants punts ha fet el jugador Toby Flood en tot el torneig?:)
let $punts_toby_flood := sum(for $toby_flood in /competition/round/match/summary/team/scorecard/name[. = "Toby Flood"]
return $toby_flood/@points)
return <TobyFlood>{$punts_toby_flood}</TobyFlood>
