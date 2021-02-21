#  Pt. 18 Mastermind
import random

digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
mastermind = []

for i in range(4):
    x = random.choice(digits)

    for j in digits:
        if j == x:
            digits.remove(j)

    mastermind.append(x)

flagJuego = False
intentos = 1

while not flagJuego:
    aciertos = 0
    coincidencias = 0
    intento = []
    repetidos = 0

    while len(intento) != 4 or repetidos != 1:
        jugador = (input("Introduce un número de 4 dígitos: "))
        intento = [i for i in jugador]

        if len(intento) != 4:
            print("ERROR: No has introducido un número de 4 dígitos.")  
            print() 

        elif len(intento) == 4:
            for i in intento:
                repetidos = 0

                for j in range(4):
                    if i == intento[j]:
                        repetidos += 1

                if repetidos > 1:
                    print("ERROR: Tu número tiene valores repetidos.")
                    print()
                    break

    for i in range(len(intento)):

        if intento == mastermind:
            print("Has ganado", intento, "era el número pensado!")
            print("Has tardado", intentos, "intentos.")
            flagJuego = True
            break

        elif intento[i] in mastermind:
            if intento[i] == mastermind[i]:
                aciertos += 1

            else:
                coincidencias += 1

    print("Tu numero", jugador, "tiene", aciertos, "aciertos y ", coincidencias, "coincidencias.")
    print()
    intentos += 1
