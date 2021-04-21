(:2.- Crea una consulta XQuery per tal que amb dues variables (a=”hello” i b =”world”) retorni una concatenació de caràcters.:)
let $a := "hello", $b := "world"
return <message>{concat($a," ", $b)}</message>