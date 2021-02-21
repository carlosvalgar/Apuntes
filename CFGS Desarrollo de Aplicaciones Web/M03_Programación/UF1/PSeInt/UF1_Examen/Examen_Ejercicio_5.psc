Algoritmo La_Llagosta_Fumada
	Escribir 'Introduce el número de comensales:'
	Leer com
	Si com>200 Entonces
		Si com>=300 Entonces
			cost <- 75
		SiNo
			cost <- 85
		FinSi
	SiNo
		cost <- 95
	FinSi
	Escribir 'Como querrá pagar?'
	Repetir
		Escribir 'Introduce 1 para pagar en efectivo.'
		Escribir 'Introduce 2 para pagar con tarjeta.'
		Leer eftar
	Hasta Que eftar=1 O eftar=2
	Si eftar=1 Entonces
		cost <- cost-(cost*0.03)
	SiNo
		cost <- cost+(cost*0.02)
	FinSi
	tot <- cost*com
	Escribir 'Cada comensal tendrá que pagar: ',cost,' euros.'
	Escribir 'El coste total de la comida será: ',tot,' euros.'
FinAlgoritmo

