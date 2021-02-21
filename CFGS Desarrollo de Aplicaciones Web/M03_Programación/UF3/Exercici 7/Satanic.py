import os
import random

# Creamos una variable que va a ser nuestro archivo para leer
documento = "text.txt"
try:
    # Si no existe haremos que salte un error, porque sino nos va a crear ese archivo y no es lo que queremos
    if os.path.isfile(documento) == False:
        raise FileNotFoundError

    print(os.path.exists(documento))
    # Abrimos el documento con a+ para que nos coloque al final de este y podamos leerlo
    with open(documento, "a+") as satanic:
        # Le movemos 1 byte para cuando hagamos la primera lectura lea algo
        satanic.seek(satanic.tell() -1)

        # Hacemos un bucle
        flagSatanic = False
        while not flagSatanic:
            # Leemos 1 caracter y lo guardamos en una variable, para printarlo y ver que caracter es
            caracter = satanic.read(1)
            print(caracter, end = "")
            # Para que parezca más satanico añadimos que pueda escribir espacios y saltos de linea aleatoriamente
            if random.randint(1, 100) > 90:
                print(" ", end = "")
            elif random.randint(1, 100) <= 1:
                print()
            # La condicion de salida es que estemos en el byte 2 o inferior, imprimiremos el byte de la posicion 1 y saldremos del bucle
            if satanic.tell() <= 2:
                satanic.seek(0)
                print(satanic.read(1))
                flagSatanic = True
            # Si es un numero o si es un salto de línea haremos que retroceda 3 bytes para evitar que el programa entre en un bucle infinito
            elif caracter.isdigit() == True or caracter == "\n":
                satanic.seek(satanic.tell() -3)
            # Si no lo es haremos que retroceda 2 bytes.
            elif caracter.isdigit() == False:
                satanic.seek(satanic.tell() -2)
except FileNotFoundError:
    print("El archivo que buscas no existe.")

input()