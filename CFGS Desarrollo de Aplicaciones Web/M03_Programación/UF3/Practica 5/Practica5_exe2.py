import os

# Ponemos la ruta de trabajo donde se encuentra el fichero

os.chdir(os.path.dirname(os.path.realpath(__file__)))

def cargar_menu(numeroMenu):
    try:
        with open("menus.txt", "r") as fichero:
            # Recorremos la lista de posibles menus y si alguno tiene el menu lo printamos por pantalla con el formato
            for menu in fichero.readlines():
                if numeroMenu in menu:
                    varMenu = menu.split("-")
                    varMenu.remove(numeroMenu)
                    varMenu[0] = varMenu[0].split("*")
                    varMenu[1] = varMenu[1].split("\n")[0]
                    
                    # Printamos el menu y elegimos la opcion, si es una opcion válida retornara ese numero sino seguira pidiendo numero mostrando el menu otra vez
                    while True:
                        try:
                            print(varMenu[1] + "\n")
                            
                            for option in varMenu[0]:
                                print(str(varMenu[0].index(option) + 1) + ") " + str(option))
                        
                            chooseOption = int(input("\nOpcion: "))
                            
                            if chooseOption < 1 or chooseOption > len(varMenu[0]):
                                raise ValueError
                            
                            return chooseOption
                        
                        except ValueError:
                            print("\nERROR: Selecciona un valor entre 1 y " + str(len(varMenu[0])) + ".\n")
                            
            raise ValueError
        
    except ValueError:
        print("ERROR: El menú no se encuentra en la lista.")
    
    except FileNotFoundError:
        print("ERROR: El fichero menus.txt no existe.")

cargar_menu("menu00")