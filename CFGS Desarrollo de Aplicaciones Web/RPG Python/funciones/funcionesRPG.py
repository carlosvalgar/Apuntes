import random
import math
import os

argus = {"nombre": "argus", "clase":"guerrero", "nivel": 1, "expAct": 0, "expNext": 20, "pgAct":20, "pgMax": 20, "pmAct": 5, "pmMax": 5, "fuerza": 4, "destreza": 2, "inteligencia": 1, "armaEquipada": {"gladius":{"ataque": 5, "critico": 5}}}

slime = {"nombre": "slime", "clase": "limo", "nivel": 1, "pgAct":10, "pgMax": 10, "pmAct": 1, "pmMax": 1, "fuerza": 1, "destreza": 1, "inteligencia": 1, "Experiencia": 20}

goblin = {"nombre": "goblin", "clase": "humanoide", "nivel": 2, "pgAct":25, "pgMax": 20, "pmAct": 5, "pmMax": 5, "fuerza": 2, "destreza": 2, "inteligencia": 1, "Experiencia": 20}

def turnoPersonaje(argus, monstruo):
    print("1.- Atacar\n2.- Pasar")
    opcion = int(input("Introduce tu acción:\n    > "))
    if opcion == 1:
        monstruo["pgAct"] = monstruo["pgAct"] - atacarPersonaje(argus)
        
    elif opcion == 2:
        return

def atacarPersonaje(personaje):
    for x in personaje["armaEquipada"].keys():
        arma = x
        
    golpeCritico = random.randint(1, 100)
    
    if golpeCritico > personaje["armaEquipada"][arma]["critico"]:
        return math.trunc(personaje["fuerza"] + personaje["armaEquipada"][arma]["ataque"] * (random.randint(75, 100)/100))
    
    else:
        print("¡GOLPE CRÍTCO!")
        return math.trunc(personaje["fuerza"] + personaje["armaEquipada"][arma]["ataque"] * (random.randint(75, 100)/100)) * 2

def atacarMonstruo(monstruo):
    if monstruo["nombre"] == "slime":
        ataque = random.randint(1, 10)
        if ataque <= 1 and monstruo["pmAct"] >= 1:
            print("Slime crash!")
            monstruo["pmAct"] = monstruo["pmAct"] - 1
            return monstruo["fuerza"] + monstruo["inteligencia"] * 3
        else:
            return monstruo["fuerza"]
        
    elif monstruo["nombre"] == "goblin":
        ataque = random.randint(2, 10)
        if ataque <= 2 and monstruo["pmAct"] >= 2:
            print("Goblin punch!")
            monstruo["pmAct"] = monstruo["pmAct"] -2
            return monstruo["fuerza"] + monstruo["destreza"]
        else:
            return monstruo["fuerza"]

def estadisticasPersonaje(personaje):
    atributos = personaje.keys()
    print("-" * 25)
    for atributo in atributos:
        if atributo == "nombre":
            print("|" + personaje[atributo].capitalize().center(23) + "|")
            print("-" * 25)

        elif atributo == "clase":
            print("|" + personaje[atributo].capitalize().center(10) + "|", end = "")

        elif atributo == "nivel":
            print(str(atributo).capitalize().center(9) + "|" + str(personaje[atributo]).rjust(2) + "|" )
            print("-" * 25)

        elif atributo == "expAct":
            print("| " + "Exp: ".center(10) + str(personaje[atributo]).rjust(5) + "/", end = "")

        elif atributo == "expNext":
            print(str(personaje[atributo]).ljust(5) + " |")
            print("-" * 25)

        elif atributo == "pgAct":
            print("| PG: " + str(personaje[atributo]).rjust(3) + "/", end = "")

        elif atributo == "pgMax":
            print(str(personaje[atributo]).ljust(3), end = "")

        elif atributo == "pmAct":
            print(" PM: " + str(personaje[atributo]).rjust(2) + "/", end = "")

        elif atributo == "pmMax":
            print(str(personaje[atributo]).ljust(2) + " |")
            print("-" * 25)

        elif atributo == "fuerza" or atributo == "destreza" or atributo == "inteligencia":
            print("|" + str(atributo).capitalize().center(15)+ "|" +  str(personaje[atributo]).center(7) + "|")
            print("-" * 25)
        
        elif atributo == "armaEquipada":
            for armas in personaje[atributo].keys():
                print("|"+ " Arma: " + str(armas).capitalize().ljust(16) + "|")
                for atributoArma in personaje[atributo][armas].keys():
                    if atributoArma == "ataque":
                        print("| ATQ: " + str(personaje[atributo][armas][atributoArma]).rjust(3), end= "")
                    elif atributoArma == "critico":
                        print("   Crit: " + str(personaje[atributo][armas][atributoArma]).rjust(3) + "% |")
                        print("-" * 25)

def finCombate(argus, monstruo):
    if argus["pgAct"] <= 0:
        print("Game over")
        return True
    
    elif monstruo["pgAct"] <= 0:
        print("Has vencido al " + str(monstruo["nombre"]))
        argus["expAct"] = argus["expAct"] + monstruo["Experiencia"]
        estadisticasPersonaje(argus)
        return True
    
def combate(argus, monstruo):
    while True:
        if finCombate(argus, monstruo) == True:
            return
        turnoPersonaje(argus, monstruo)
        if finCombate(argus,monstruo) == True:
            return
        argus["pgAct"] = argus["pgAct"] - atacarMonstruo(monstruo)
    

with open("slimeArt.txt", "r") as art:
    artList = art.readlines()
    for i in artList:
        print(i, end="")