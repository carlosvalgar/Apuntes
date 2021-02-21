# P21 Exercici 2:
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

aux = 0
cj = 0
ci = 0

for k in range((len(matriz) * len(matriz[0])) - 1):
    for i in range(len(matriz)):
        for j in range(len(matriz[0])):

            if not i > 2 - ci:
                if not (i >= 2 - ci and j >= 2 - cj):
                    
                    if j == 2:
                        if matriz[i][j] > matriz[i + 1][j + -2]:
                            aux = matriz[i][j]
                            matriz[i][j] = matriz[i + 1][j + -2]
                            matriz[i + 1][j + -2] = aux

                    else:    
                        if matriz[i][j] > matriz[i][j + 1]:
                            aux = matriz[i][j]
                            matriz[i][j] = matriz[i][j + 1]
                            matriz[i][j + 1] = aux
    cj += 1
    if cj == 3:
        ci += 1
        cj = 0

print("Matriz ordenada con el método burbuja: \n", matriz, "\n")
