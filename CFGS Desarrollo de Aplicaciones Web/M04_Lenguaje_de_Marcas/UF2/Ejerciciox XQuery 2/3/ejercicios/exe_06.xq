(: 6.- Quants diners ha facturat el Porquet de xocolata amb llet?:)
let $ventas_totales_porquet := for $ventas_porquet in /facturacio/factura/rebut/linies/producte[descripcio = "Porquet de xocolata amb llet"]
return $ventas_porquet/preuunitari * $ventas_porquet/quantitat
return <porquetxocolataambllet>{sum($ventas_totales_porquet)}</porquetxocolataambllet>