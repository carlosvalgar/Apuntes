Algoritmo ejercicio_n
	Escribir 'Introduce hasta que n�mero quieres que te diga todos los n�meros que siguen la f�rmula n*n+2:'
	Leer nmax
	n <- 0
	Repetir
		calc <- n*n+2
		Si calc<=nmax Entonces
			Escribir calc
		FinSi
		n <- n+1
	Hasta Que calc>nmax
FinAlgoritmo

