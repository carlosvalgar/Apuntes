import os

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

flagMenu = False

while not flagMenu:
    opcioMenu00 = menus(menu00, capcelera00)
    
    if opcioMenu00 == 1:
        # Introducir los inputs en la funcion
        telefono = int(input("Introduce el número de teléfono:\n    > "))
        localizacion = input("Introduce la localización:\n    > ").upper()
        realitzarTrucada(str(telefono), localizacion)
        
    elif opcioMenu00 == 2:
        print("WIP")
        
    elif opcioMenu00 == 3:
        print("WIP")
        
    elif opcioMenu00 == 4:
        opcioMenu01 = menus(menu01, capcelera01)
        
        if opcioMenu01 == 1:
            print("WIP")
            
        elif opcioMenu01 == 2:
            print("WIP")
            
        elif opcioMenu01 == 3:
            print("WIP")
            
        elif opcioMenu01 == 4:
            print("WIP")
            
    elif opcioMenu00 == 5:
        flagMenu = True
