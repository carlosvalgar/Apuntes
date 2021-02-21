Algoritmo Cálculo_nota
	Escribir 'Introduce el número de respuestas en blanco'
	Leer blanco
	Escribir 'Introduce el número de respuestas correctas'
	Leer correcto
	Escribir 'Introduce el número de respuestas incorrectas'
	Leer incorrecto
	preguntas <- blanco+correcto+incorrecto
	Mientras preguntas!=50 Hacer
		Escribir 'La suma de tus preguntas es diferente de 50, vuelva a introducir los valores'
		Escribir 'Introduce el número de respuestas en blanco'
		Leer blanco
		Escribir 'Introduce el número de respuestas correctas'
		Leer correcto
		Escribir 'Introduce el número de respuestas incorrectas'
		Leer incorrecto
		preguntas <- blanco+correcto+incorrecto
	FinMientras
	nota <- 4*correcto-incorrecto-0.5*blanco
	notabaremada <- 10*nota/200
	Si notabaremada<0 Entonces
		notabaremada <- 0
	FinSi
	Escribir 'Tu nota es un: ',notabaremada
FinAlgoritmo

