import random
import math
from termcolor import colored

# Genera un ataque fisico normal para el monstruo

def atacarMonstruo(monstruo, personaje):
    golpeCritico = random.randint(1, 100)
    damage = math.trunc((monstruo["phyAtk"] * (random.randint(50, 125)/100)) - personaje["phyDef"])
    
    if damage <= 0:
        damage = 0
        golpeCritico = 100
    
    if golpeCritico > monstruo["crit"]:
        if damage == 1:
            print(colored("\n    >>>> ", "green") + "El ataque de " + str(monstruo["nombre"]) + " te infige " + colored(str(damage), "red") + " punto de daño." + colored(" <<<<\n", "green"))
            
        else:
            print(colored("\n    >>>> ", "green") + "El ataque de " + str(monstruo["nombre"]) + " te infige " + colored(str(damage), "red") + " puntos de daño." + colored(" <<<<\n", "green"))
            
        return damage
    
    else:
        print("\n" + (colored(">>>>", "yellow") + colored("¡Impacto crítico!", "red") + colored(" <<<<", "yellow")).rjust(66))
        print(colored("    >>>> ", "green") + "El ataque de " + str(monstruo["nombre"]) + " te infige " + colored(str(damage * 2), "red") + " puntos de daño." + colored(" <<<<\n", "green"))
        return damage * 2