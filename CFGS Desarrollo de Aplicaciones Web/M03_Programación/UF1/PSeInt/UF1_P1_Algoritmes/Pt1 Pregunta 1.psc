Algoritmo Salario_neto
	Escribir "Introduzca su nombre"
	Leer nombre
	Escribir "Introduzca el número de horas que ha trabajado"
	Leer horas
	Si horas>35 Entonces
		bruto <- 35*20+(horas-35)*30
	SiNo
		bruto <- horas*20
	FinSi
	Si bruto>500 Entonces
		Si bruto>900 Entonces
			tasas <- tasas+(bruto-900)*0.45+400*0.25
		SiNo
			tasas <- (bruto-500)*0.25
		FinSi
	SiNo
		tasas <- 0
	FinSi
	neto <- bruto-tasas
	Escribir "Hola ",nombre," tu sueldo bruto es de: ",bruto
	Escribir "Pagas: ",tasas
	Escribir "Tu sueldo neto es de: ",neto
FinAlgoritmo

