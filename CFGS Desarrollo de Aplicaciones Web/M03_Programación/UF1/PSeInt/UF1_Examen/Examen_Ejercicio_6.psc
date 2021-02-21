Algoritmo liga_futbol
	Escribir 'Introduce el resultado de tu equipo:'
	Escribir 'Introduce G o g para indicar que tu equipo ganó (Incrementa 3 puntos).'
	Escribir 'Introduce E o e para indicar que tu equipo ha empatado (Incrementa 1 punto).'
	Escribir 'Introduce P o p para indicar que tu equipo ha perdido (no incrementa los puntos).'
	Escribir 'Introduce F o f para terminar de introducir valores.'
	punt <- 0
	Repetir
		Leer res
		Segun res  Hacer
			'G':
				punt <- punt+3
			'g':
				punt <- punt+3
			'E':
				punt <- punt+1
			'e':
				punt <- punt+1
		FinSegun
	Hasta Que res='F' O res='f'
	Escribir 'Tu equipo tiene ',punt,' puntos!'
FinAlgoritmo

