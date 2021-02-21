import random

listaNumeros = []

while len(listaNumeros) < 9:
    x = random.randint(100, 500)
    if x not in listaNumeros:
        listaNumeros.append(x)

for i in range(len(listaNumeros) - 1):
        for j in range(i + 1, len(listaNumeros)):
            if listaNumeros[i] > listaNumeros[j]:
                temp = listaNumeros[i]
                listaNumeros[i] = listaNumeros[j]
                listaNumeros[j] = temp
        
print(listaNumeros)

introducirDatos = "Si"

while introducirDatos == "Si":

    numeroUsuario = int(input("Introduce un número para ver si esta en la lista: "))

    minimo = 0
    maximo = len(listaNumeros) - 1
    flagRespuesta = False

    while flagRespuesta == False:
        media = (minimo + maximo) // 2

        if numeroUsuario == listaNumeros[media]:
            print("Tu numero esta en la lista en la posición: ", media)
            flagRespuesta = True
        
        elif maximo < minimo:
            print("Tu numero no esta en la lista.")
            flagRespuesta = True

        else:
            if numeroUsuario < listaNumeros[media]:
                maximo = media - 1
            
            elif numeroUsuario > listaNumeros[media]:
                minimo = media + 1
    
    introducirDatos = input("Quieres seguir introduciendo datos? (Si/No) ").capitalize()




