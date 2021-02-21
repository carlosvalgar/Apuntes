# P21 Exercici 3:
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