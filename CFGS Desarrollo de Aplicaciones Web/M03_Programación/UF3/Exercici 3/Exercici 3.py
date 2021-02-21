import os

listaMenu = ["Leer Persona", "Escribir Persona a Disco", "Leer personas mayores de 18 años", "Salir"]

def menus(tupla, *cabecera):
    while True:
        try:
            if len(cabecera) > 0:
                print(cabecera[0])
            
            for x in tupla:
                print("".ljust(4) + str(tupla.index(x) + 1) + ") " + str(x))
            
            opcion = int(input("\nElije una opcion:\n    > "))
            
            if opcion < 1 or opcion > len(tupla):
                raise Exception
            
        except ValueError:
            print("\nERROR: La opción debe ser un número entero.\n")
        
        except Exception:
            print("\nERROR: Opción inválida.\n")
        
        else:
            return opcion

def escriureNom():
    while True:
        try:
            nom = input("Escriu el nom de la persona:\n    > ").capitalize()
            
            if nom.isalpha() == False:
                raise ValueError
            
            return nom
        
        except ValueError:
            print("\nIntrodueix un nom només amb lletres.\n")

def escriureCognoms():
    cognom1 = ""
    while True:
        if cognom1 == "" or cognom1.isalpha() == False:
            try:
                cognom1 = input("Escriu el primer cognom de la persona:\n    > ").capitalize()
                
                if cognom1.isalpha() == False:
                    raise ValueError
                
            except ValueError:
                print("\nIntrodueix un nom només amb lletres.\n")
        
        elif cognom1.isalpha() == True:
            try:
                cognom2 = input("Escriu el segon cognom de la persona:\n    > ").capitalize()
                
                if cognom2.isalpha() == False:
                    raise ValueError
                
                return cognom1 + " " + cognom2
                
            except ValueError:
                print("\nIntrodueix un nom només amb lletres.\n")

def escriureNIF():
    while True:
        try:
            nif = input("Introduzca el NIF de la persona (8 números seguidos por 1 letra);\n    > ").upper()
            
            if len(nif) != 9:
                print("\nERROR: El NIF que has introducido no tiene 9 carácteres.\n")
                raise Exception
            
            letraNif = nif[8]
            numerosNif = nif.replace(letraNif, "")
            
            if numerosNif.isnumeric() == False:
                print("\nERROR: Los 8 primeros carácteres no son todos números.\n")
                raise Exception
            
            if letraNif.isalpha() == False:
                print("\nERROR: El último carácter no es una letra.\n")
                raise Exception
            
        except Exception:
            pass
        
        else:
            return nif

def escriureEdat():
    while True:
        try:
            edat = int(input("Introdueix la edat de la persona:\n    > "))

            if edat < 0 or edat > 100:
                raise ValueError
            
            return str(edat)

        except ValueError:
            print("\nERROR: Introdueix un nombre entre 0 i 100.\n")

def escriureAlcada():
    while True:
        try:
            alcada = float(input("Introdueix l'altura de la persona en metres:\n    > "))
            
            if alcada < 0 or alcada > 3:
                raise ValueError
            
            return str(alcada)
        
        except ValueError:
            print("ERROR: Introdueix un valor de alçada entre 0.00 i 3.00")

def escriurePersonaADisc():
    with open(os.path.join("persones.txt"), "a") as fichero:
        flagEscribir = False
        
        while not flagEscribir:
            fichero.writelines("\n" + escriureNom() + "\n" + escriureCognoms() + "\n" + escriureNIF() + "\n" + escriureEdat() + "\n" + escriureAlcada())
            
            flagContinuar = False
            
            while not flagContinuar:
                try:
                    opcio = int(input("Quieres seguir añadiendo personas?\n    1.- Sí\n    2.- No\n\n    > "))
                    
                    if opcio != 1 and opcio != 2:
                        raise ValueError
                        
                    if opcio == 1:
                        flagContinuar = True

                    elif opcio == 2:
                        flagContinuar = True
                        flagEscribir = True
                    
                except ValueError:
                    print("ERROR: Escribe 1 o 2.")

def llegirPersona():
    try:
        with open(os.path.join("persones.txt"), "r") as fichero:
            buscarPersona = input("Introduce el nombre de la persona a buscar:\n    > ").capitalize() + "\n"
            encontrado = False
            fichero.readline()
            while True:
                persona = [fichero.readline(), fichero.readline(), fichero.readline(), fichero.readline(), fichero.readline()]
                
                if persona[0] == buscarPersona:
                    print("Nombre: " + str(persona[0]) + "Apellidos: " + str(persona[1]) + "NIF: " + str(persona[2]) + "Edad: " + str(persona[3]) + "Altura: " + str(persona[4]))
                    encontrado = True
                    
                if persona[0] == "":
                    if encontrado == False:
                        print("No se encontró a la persona que buscas.")
                    return
    except FileNotFoundError:
        print("ERROR: El fichero que intentas abrir no existe, intenta añadir alguna persona primero.")

def llegirEdadPersona():
    try:
        with open(os.path.join("persones.txt"), "r") as fichero:
            fichero.readline()
            while True:
                persona = [fichero.readline(), fichero.readline(), fichero.readline(), fichero.readline(), fichero.readline()]
                
                if persona[3] >= "18\n":
                    print("Nombre: " + str(persona[0]) + "Apellidos: " + str(persona[1]) + "NIF: " + str(persona[2]) + "Edad: " + str(persona[3]) + "Altura: " + str(persona[4]))
                    encontrado = True
                    
                if persona[0] == "":
                    if encontrado == False:
                        print("No se encontró a nadie mayor de 18 años.")
                return
    except FileNotFoundError:
        print("ERROR: El fichero que intentas abrir no existe, intenta añadir alguna persona primero.")

flagMenuPrincipal = False

while not flagMenuPrincipal:
    opcionMenu = menus(listaMenu, "Menu Principal")
    if opcionMenu == 1:
        llegirPersona()
        
    elif opcionMenu == 2:
        escriurePersonaADisc()
        
    elif opcionMenu == 3:
        llegirEdadPersona()
        
    elif opcionMenu == 4:
        flagMenuPrincipal = True