(:1.- Crea una consulta XQuery per tal que amb dues variables (a=10 i b =2) retorni la divisió entera.:)
let $a := 10, $b := 2
return <div>{round($a div $b)}</div>