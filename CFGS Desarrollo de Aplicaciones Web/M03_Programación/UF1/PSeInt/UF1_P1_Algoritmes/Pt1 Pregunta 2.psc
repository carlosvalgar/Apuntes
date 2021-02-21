Algoritmo Qualificació_numérica_a_alfabética
	Escribir "Introdueix la nota"
	Leer nota
	Mientras nota<0 o nota>10 Hacer
		Escribir "Introduix un número entre 0 y 10"
		Leer nota
	FinMientras
	Si nota<3 Entonces
		Escribir "La teva nota és Molt Deficient"
	SiNo
		Si nota<5 Entonces
			Escribir "La teva nota és Insuficient"
		SiNo
			Si nota<6 Entonces
				Escribir "La teva nota és Bé"
			SiNo
				Si nota<9 Entonces
					Escribir "La teva nota es Notable"
				SiNo
					Escribir "La teva nota es Excel·lent"
				FinSi
			FinSi
		FinSi
	FinSi
FinAlgoritmo

