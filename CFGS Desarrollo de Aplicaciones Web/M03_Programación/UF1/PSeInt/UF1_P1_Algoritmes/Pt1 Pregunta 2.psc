Algoritmo Qualificaci�_num�rica_a_alfab�tica
	Escribir "Introdueix la nota"
	Leer nota
	Mientras nota<0 o nota>10 Hacer
		Escribir "Introduix un n�mero entre 0 y 10"
		Leer nota
	FinMientras
	Si nota<3 Entonces
		Escribir "La teva nota �s Molt Deficient"
	SiNo
		Si nota<5 Entonces
			Escribir "La teva nota �s Insuficient"
		SiNo
			Si nota<6 Entonces
				Escribir "La teva nota �s B�"
			SiNo
				Si nota<9 Entonces
					Escribir "La teva nota es Notable"
				SiNo
					Escribir "La teva nota es Excel�lent"
				FinSi
			FinSi
		FinSi
	FinSi
FinAlgoritmo

