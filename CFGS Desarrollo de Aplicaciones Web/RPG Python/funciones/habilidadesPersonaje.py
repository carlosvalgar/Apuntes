import random
import math
from termcolor import colored

# Genera un ataque fisico normal para el personaje

def atacarPersonaje(personaje, monstruo):
    golpeCritico = random.randint(1, 100)
    damage = math.trunc((personaje["phyAtk"] * (random.randint(50, 125)/100)) - monstruo["phyDef"])
    
    if damage <= 0:
        damage = 0
        golpeCritico = 100
    
    if golpeCritico > personaje["crit"]:
        if damage == 1:
            print(colored("\n    >>>> ", "green") + "Tu ataque infige " + colored(str(damage), "red") + " punto de daño." + colored(" <<<<\n", "green"))
            
        else:
            print(colored("\n    >>>> ", "green") + "Tu ataque infige " + colored(str(damage), "red") + " puntos de daño." + colored(" <<<<\n", "green"))
            
        return damage
    
    else:
        print("\n" + (colored(">>>>", "yellow") + colored("¡Impacto crítico!", "red") + colored(" <<<<", "yellow")).rjust(66))
        print(colored("    >>>> ", "green") + "Tu ataque infige " + colored(str(damage * 2), "red") + " puntos de daño." + colored(" <<<<\n", "green"))
        return damage * 2

def corteRapido(personaje, monstruo):
    golpeCritico = random.randint(1, 100) + 5
    damage = math.trunc((personaje["phyAtk"] * (random.randint(25, 75)/100)) - monstruo["phyDef"])
    personaje["prio"] += personaje["ini"] * personaje["lvl"]
    personaje["pmAct"] -= 2
    print("\n" + (colored(">>>>", "magenta") + colored("Habilidad: ¡Corte Rápido!", "cyan") + colored(" <<<<", "magenta")).rjust(70))
    
    if damage <= 0:
        damage = 0
        golpeCritico = 100
    
    if golpeCritico > personaje["crit"]:
        if damage == 1:
            print(colored("\n    >>>> ", "green") + "Tu ataque infige " + colored(str(damage), "red") + " punto de daño." + colored(" <<<<\n", "green"))
            
        else:
            print(colored("\n    >>>> ", "green") + "Tu ataque infige " + colored(str(damage), "red") + " puntos de daño." + colored(" <<<<\n", "green"))
            
        return damage
    
    else:
        print("\n" + (colored(">>>>", "yellow") + colored("¡Impacto crítico!", "red") + colored(" <<<<", "yellow")).rjust(66))
        print(colored("    >>>> ", "green") + "Tu ataque infige " + colored(str(damage * 2), "red") + " puntos de daño." + colored(" <<<<\n", "green"))
        return damage * 2


def defensaPersonaje(personaje):
    personaje["phyDef"] = personaje["phyDef"] * 2
    print(colored("\n    >>>> ", "green") + "¡Adoptas una posición " + colored("defensiva", "blue") + " y duplicas tu defensa física durante este turno!" + colored(" <<<<\n", "green"))