import personaje as pj
from termcolor import colored

# Printa las barras de vida y mana con formato

def barrasVidaMana(longitud):
    lenBarrasVidaMana = "| PG: " + str(pj.personajeEstadisticas["pgAct"]) + " / " + str(pj.personajeEstadisticas["pgMax"]) + " | " + "PM: " + str(pj.personajeEstadisticas["pmAct"]) + " / " + str(pj.personajeEstadisticas["pmMax"]) + " |"

    if len(lenBarrasVidaMana) > longitud + 8:
        print("-" * len(lenBarrasVidaMana))
        
    else:
        print("-" * (longitud + 8))
            
    if pj.personajeEstadisticas["pgAct"] / pj.personajeEstadisticas["pgMax"] == 1:
        print("|" +  colored(" PG", "green") + ": " + colored(str(pj.personajeEstadisticas["pgAct"]), "green") + " / " + colored(str(pj.personajeEstadisticas["pgMax"]), "green") + " | ", end = "")
        
    elif pj.personajeEstadisticas["pgAct"] / pj.personajeEstadisticas["pgMax"] > 0.5:
        print("|" +  colored(" PG", "green") + ": " + str(pj.personajeEstadisticas["pgAct"]) + " / " + colored(str(pj.personajeEstadisticas["pgMax"]), "green") + " | ", end = "")
        
    elif pj.personajeEstadisticas["pgAct"] / pj.personajeEstadisticas["pgMax"] <= 0.5 and pj.personajeEstadisticas["pgAct"] / pj.personajeEstadisticas["pgMax"] > 0.2:
        print("|" +  colored(" PG", "green") + ": " + colored(str(pj.personajeEstadisticas["pgAct"]), "yellow") + " / " + colored(str(pj.personajeEstadisticas["pgMax"]), "green") + " | ", end = "")
        
    elif pj.personajeEstadisticas["pgAct"] / pj.personajeEstadisticas["pgMax"] <= 0.2:
        print("|" +  colored(" PG", "green") + ": " + colored(str(pj.personajeEstadisticas["pgAct"]), "red") + " / " + colored(str(pj.personajeEstadisticas["pgMax"]), "green") + " | ", end = "")
    
    if pj.personajeEstadisticas["pmAct"] / pj.personajeEstadisticas["pmMax"] == 1:
        print(colored("PM", "blue") + ": " + colored(str(pj.personajeEstadisticas["pmAct"]), "blue") + " / " + colored(str(pj.personajeEstadisticas["pmMax"]), "blue") + " |")
    
    elif pj.personajeEstadisticas["pmAct"] / pj.personajeEstadisticas["pmMax"] > 0.5:
        print(colored("PM", "blue") + ": " + str(pj.personajeEstadisticas["pmAct"]) + " / " + colored(str(pj.personajeEstadisticas["pmMax"]), "blue") + " |")
                
    elif pj.personajeEstadisticas["pmAct"] / pj.personajeEstadisticas["pmMax"] <= 0.5 and pj.personajeEstadisticas["pmAct"] / pj.personajeEstadisticas["pmMax"] > 0.2:
        print(colored("PM", "blue") + ": " + colored(str(pj.personajeEstadisticas["pmAct"]), "yellow") + " / " + colored(str(pj.personajeEstadisticas["pmMax"]), "blue") + " |")
            
    elif pj.personajeEstadisticas["pmAct"] / pj.personajeEstadisticas["pmMax"] <= 0.2:
        print(colored("PM", "blue") + ": " + colored(str(pj.personajeEstadisticas["pmAct"]), "red") + " / " + colored(str(pj.personajeEstadisticas["pmMax"]), "blue") + " |")
            
    print("-" * len(lenBarrasVidaMana))

def prioridad(monstruo):
    lenPrioridad = "| " + pj.personajeEstadisticasExtra["nombre"] + ": " + str(pj.personajeEstadisticas["prio"]) + " +" + str(pj.personajeEstadisticas["ini"]) + " | " + monstruo["nombre"] + ": " + str(monstruo["prio"]) + " +" + str(monstruo["ini"]) + " |"
    print("-" * len(lenPrioridad))
    print("| " + colored("Prioridad".center(len(lenPrioridad) -4), "yellow") + " |")
    print("-" * len(lenPrioridad))
    print("| " + colored(pj.personajeEstadisticasExtra["nombre"], "green") + ": " + str(pj.personajeEstadisticas["prio"]) + " +" + colored(str(pj.personajeEstadisticas["ini"]), "yellow")  +  " | " + colored(monstruo["nombre"], "red") + ": " + str(monstruo["prio"]) + " +" + colored(str(monstruo["ini"]), "yellow") + " |")
    print("-" * len(lenPrioridad))

# Muestra las acciones del turno, se puede usar para diversos menus

def menuPersonaje(lista, monstruo, cabecera = "", longitud = 20):
    while True:
        try:
            if lista[-1] != "Salir":
                prioridad(monstruo)
            
            if cabecera != "":
                print("-" * (len(cabecera) + 4))
                print("| " + colored(cabecera, color = "green") + " |")
                
                if len(cabecera) + 4 > longitud + 8:
                    print("-" * (len(cabecera) + 4))
                    
                else:
                    print("-" * (longitud + 8))
            
            else:
                print("-" * (longitud + 8))

            for item in lista:
                print("| " + colored(str(lista.index(item) + 1) + ".- ", color = "cyan", attrs = ["bold"])  + str(item).ljust(len(item) + (longitud - len(item))) + " |")
            
            barrasVidaMana(longitud)
            
            opcion = int(input("\nElige una acción:\n    > "))
            
            if opcion < 1 or opcion > len(lista):
                raise ValueError
            
            return opcion
        
        except ValueError:
            print(colored("\nERROR: Introduce un numero entero con valor entre 1 y " + str(len(lista)) + "\n", "red"))

# Diccionario del menu principal de combate

def diccionarioHabilidades():
    if pj.personajeBaseStats["lvl"] == 1:
        menu = ["Corte rápido | 2 PM | Golpe débil que aumenta tu prioridad.", "Salir"]
        return menu
    
    elif pj.personajeBaseStats["lvl"] == 2:
        menu = ["Corte rápido | 2 PM", "Corte rápido lvl 2 | PM 2", "Salir"]
        print("Has aprendido la habilidad " + str(menu[-2][0:-6]))
        return menu
    
menuPrincipalCombate = ["Atacar", "Defenderse", "Habilidades", "Objetos"]

menuHabilidadesCombate = diccionarioHabilidades()