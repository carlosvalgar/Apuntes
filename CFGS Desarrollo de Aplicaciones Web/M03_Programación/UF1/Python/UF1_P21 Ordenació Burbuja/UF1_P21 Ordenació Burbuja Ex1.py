# P21 Exercici 1:
import random

# Generamos la matriz aleatoria

matriz = []
matriz2 = []

for i in range(3):
    matriz2 = []
    for j in range(3):
        num = random.randint(0, 9)
        matriz2.append(num)
    matriz.append(matriz2)

print("Matriz generada aleatoriamente 3x3: \n", matriz, "\n")

# He hecho dos soluciones porque queria hacerlo con bucles for, asi si tenia la suma base me aseguraba que el resultado estaba bien

# Primera Solución: Sumas a mano

matrizHija = [
    [
        matriz[0][1] + matriz[1][0] + matriz[1][1],
        matriz[0][0] + matriz[0][2] + matriz[1][0] + matriz[1][1] + matriz [1][2],
        matriz[0][1] + matriz[1][1] + matriz[1][2]
        ], 
    [
        matriz[0][0] + matriz[0][1] + matriz [1][1] + matriz[2][0] + matriz [2][1], 
        matriz[0][0] + matriz[0][1] + matriz[0][2] + matriz[1][0] + matriz[1][2] +  matriz[2][0] + matriz[2][1] + matriz[2][2],
        matriz[0][1] + matriz[0][2] + matriz [1][1] + matriz[2][1] + matriz [2][2]
        ], 
    [
        matriz[1][0] + matriz[1][1] + matriz[2][1],
        matriz[1][0] + matriz[1][1] + matriz[1][2] + matriz[2][0] + matriz [2][2],
        matriz[1][1] + matriz[1][2] + matriz[2][1]]
    ]

print("Resultado de la primera solución: \n", matrizHija, "\n")

# Segunda solución: Metodo con bucles for

matriz4=[]

for i in range(3):
    matriz3=[]
    for j in range(3): # Con esta i y j vemos que posicion vamos a rellenar de la tabla.
        sum = 0 

        for ci in range(-1, 2):
            for cj in range(-1, 2): # El requisito que cumple lo que quiere el enunciado es que la tabla coje todo sus valores alrededor, es decir o le resta 1, lo deja igual o le suma 1 para el eje i y el eje j

                if i + ci >= 0 and i + ci <= 2:
                    if j + cj >= 0 and j + cj <= 2: # Nos aseguramos que los valores que i + ci y j +cj estén entre 0 y 2 (ambos incluidos)

                        if i + ci != i or j + cj != j: #aseguramos que no se sume la misma celda que queremos rellenar
                            
                            sum += matriz[i + ci][j + cj]

        matriz3.append(sum) # Formamos la lista
    matriz4.append(matriz3) # Cuando esté acabada la lista la metemos dentro de otra lista para hacer la nueva matriz

print("Resultado de la segunda solución: \n", matriz4, "\n")
                  
