import os
import operator

# Ponemos la ruta de trabajo donde se encuentra el fichero

os.chdir(os.path.dirname(os.path.realpath(__file__)))

capcelera00 = "Menu Principal"
menu00 = ["Realitzar trucada", "Rebre Trucada", "Filtrar Trucada", "Realitzar estadístiques", "Sortir"]
capcelera01 = "Menu Realitzar estadístiques"
menu01 = ["Ciutat que rep més trucades", "Ciutat que rep menys trucades", "Ciutat que realitza menys trucades", "Ciutat que realita més trucades", "Sortir"]

def menus(menu, capcelera):
    while True:
        try:
            print(capcelera)
            for item in menu:
                print(str(menu.index(item) + 1) + ".- " + str(item))
            
            menuOption = int(input("Escoje tu opción:\n    > "))
            
            if menuOption < 1 or menuOption > len(menu):
                raise ValueError
            
            return menuOption
        
        except ValueError:
            print("ERROR: Escoje una opción entre 1 y " + str(len(menu)) + ".")

def realitzarTrucada(telefono, palabra):
    with open("telefons.txt", "r") as fichero:
        listaTelefono = fichero.readlines()
    
    flagTelefono = False
    for item in range(len(listaTelefono)):
        if telefono in listaTelefono[item] and palabra in listaTelefono[item]:
            flagTelefono = True
            lista = listaTelefono[item].split(" ")
            lista[2] = str(int(lista[2]) + 1)
            listaTelefono[item] = lista[0] + " " + lista[1] + " " + lista[2] + " " + lista[3]
            
    if flagTelefono == False:
        with open("telefons.txt", "a") as fichero:
            fichero.write(str(telefono) + " " + str(palabra) + " 1 0\n")
    
    elif flagTelefono == True:
        with open("telefons.txt", "w") as fichero:
            fichero.writelines(listaTelefono)
    
# realitzarTrucada("977456734", "TARRAGONA")

def rebreTrucada(telefono, palabra):
    with open("telefons.txt", "r") as fichero:
        listaTelefono = fichero.readlines()
    
    flagTelefono = False
    for item in range(len(listaTelefono)):
        if telefono in listaTelefono[item] and palabra in listaTelefono[item]:
            flagTelefono = True
            lista = listaTelefono[item].split(" ")
            lista[3] = str(int(lista[3]) + 1) + "\n"
            listaTelefono[item] = lista[0] + " " + lista[1] + " " + lista[2] + " " + lista[3]
            
    if flagTelefono == False:
        with open("telefons.txt", "a") as fichero:
            fichero.write(str(telefono) + " " + str(palabra) + " 1 0\n")
    
    elif flagTelefono == True:
        with open("telefons.txt", "w") as fichero:
            fichero.writelines(listaTelefono)


def filtrarTrucades(nomFitxer, prefix):
    with open(nomFitxer, "r") as fichero:
        listaTelefono = fichero.readlines()
    
    contadorTrucades = 0
    for item in range(len(listaTelefono)):
        if prefix == listaTelefono[item][0:3]:
            lista = listaTelefono[item].split("\n")
            lista = lista[0].split(" ")
            if int(lista[3]) > int(lista[2]):
                contadorTrucades += 1
        
    return contadorTrucades

def ciutatMesTrucades(nomFitxer):
    with open(nomFitxer, "r") as fichero:
        listaTelefono = fichero.readlines()
    
    dictAuxiliar = {}
    
    for item in range(len(listaTelefono)):
        lista = listaTelefono[item].split("\n")
        lista = lista[0].split(" ")
        if lista[1] not in dictAuxiliar.keys():
            dictAuxiliar[lista[1]] = int(lista[3])
        else:
            dictAuxiliar[lista[1]] += int(lista[3])
    
    return max(dictAuxiliar.items(), key=operator.itemgetter(1))[0]

def ciutatMenysTrucades(nomFitxer):
    with open(nomFitxer, "r") as fichero:
        listaTelefono = fichero.readlines()
    
    dictAuxiliar = {}
    
    for item in range(len(listaTelefono)):
        lista = listaTelefono[item].split("\n")
        lista = lista[0].split(" ")
        if lista[1] not in dictAuxiliar.keys():
            dictAuxiliar[lista[1]] = int(lista[3])
        else:
            dictAuxiliar[lista[1]] += int(lista[3])
    
    return min(dictAuxiliar.items(), key=operator.itemgetter(1))[0]

def ciutatMesTruca(nomFitxer):
    with open(nomFitxer, "r") as fichero:
        listaTelefono = fichero.readlines()
    
    dictAuxiliar = {}
    
    for item in range(len(listaTelefono)):
        lista = listaTelefono[item].split("\n")
        lista = lista[0].split(" ")
        if lista[1] not in dictAuxiliar.keys():
            dictAuxiliar[lista[1]] = int(lista[2])
        else:
            dictAuxiliar[lista[1]] += int(lista[2])
    
    return max(dictAuxiliar.items(), key=operator.itemgetter(1))[0]

def ciutatMenysTruca(nomFitxer):
    with open(nomFitxer, "r") as fichero:
        listaTelefono = fichero.readlines()
    
    dictAuxiliar = {}
    
    for item in range(len(listaTelefono)):
        lista = listaTelefono[item].split("\n")
        lista = lista[0].split(" ")
        if lista[1] not in dictAuxiliar.keys():
            dictAuxiliar[lista[1]] = int(lista[2])
        else:
            dictAuxiliar[lista[1]] += int(lista[2])
    
    return min(dictAuxiliar.items(), key=operator.itemgetter(1))[0]

flagMenu = False

while not flagMenu:
    opcioMenu00 = menus(menu00, capcelera00)
    
    if opcioMenu00 == 1:
        # Introducir los inputs en la funcion
        telefono = int(input("Introduce el número de teléfono:\n    > "))
        localizacion = input("Introduce la localización:\n    > ").upper()
        realitzarTrucada(str(telefono), localizacion)
        
    elif opcioMenu00 == 2:
        telefono = int(input("Introduce el número de teléfono:\n    > "))
        localizacion = input("Introduce la localización:\n    > ").upper()
        rebreTrucada(str(telefono), localizacion)
        
    elif opcioMenu00 == 3:
        arxiu = input("Introduce el archivo:\n    > ")
        prefix = input("Introduce el prefijo:\n   > ")
        print("Hi ha " + str(filtrarTrucades(arxiu, prefix)) + " trucades amb el prefix " + str(prefix) + " que tenen mes trucades rebudes que fetes.")
        
    elif opcioMenu00 == 4:
        opcioMenu01 = menus(menu01, capcelera01)
        
        if opcioMenu01 == 1:
            print(ciutatMesTrucades("telefons.txt"))
            
        elif opcioMenu01 == 2:
            print(ciutatMenysTrucades("telefons.txt"))
            
        elif opcioMenu01 == 3:
            print(ciutatMesTruca("telefons.txt"))
            
        elif opcioMenu01 == 4:
            print(ciutatMenysTruca("telefons.txt"))
            
    elif opcioMenu00 == 5:
        flagMenu = True
