(:10.- Quants punts s'ha aconseguit coma màxim en un partit? :)
let $max := max(for $partit in /competition/round/match
return sum($partit/summary/team/@score))
return <maxPoints>{$max}</maxPoints>