import random
import math
import os

dictArmas = {
    "Nada" : {"phyAtk": 0, "magAtk": 0, "crit": 1},
    "Espada Corta" :{"phyAtk": 1, "magAtk": 0, "crit": 5}
}

dictArmaduras = {
    "Nada" : {"phyDef": 0, "magDef": 0}
}

personajeBaseStats = {
    "lvl": 1,
    "fue": 1, 
    "con": 1, 
    "int": 1, 
    "esp": 1, 
    "des": 1
}

personajeEquipamiento = {
    "arma": "Espada Corta", 
    "armadura": "Nada", 
    "abalorio": "Nada"
}

# Te recalcula las estadisticas del personaje

def personajeCalculoEstadisticas():
    return {
        "maxPg": personajeBaseStats["lvl"] * 10,
        "maxMp": personajeBaseStats["lvl"] * 5,
        "ini": personajeBaseStats["des"] * 5,
        "phyAtk": personajeBaseStats["fue"] + dictArmas[personajeEquipamiento["arma"]]["phyAtk"],
        "phyDef": personajeBaseStats["con"],
        "magAtk": personajeBaseStats["int"] + dictArmas[personajeEquipamiento["arma"]]["magAtk"],
        "magDef": personajeBaseStats["esp"],
        "crit": dictArmas[personajeEquipamiento["arma"]]["crit"]
    }

personajeEstadisticas = personajeCalculoEstadisticas()

personajeEstadisticasExtra = {
    "nombre": "Personaje",
    "clase": "Guerrero",
    "expAct": 0,
    "expNext": 20
}

# Sube un nivel al personaje

def personajeLvlUp():
    personajeBaseStats["lvl"] = personajeBaseStats["lvl"] + 1
    personajeBaseStats["fue"] = personajeBaseStats["fue"] + 1
    personajeBaseStats["con"] = personajeBaseStats["con"] + 1
    personajeBaseStats["int"] = personajeBaseStats["int"] + 1
    personajeBaseStats["esp"] = personajeBaseStats["esp"] + 1
    personajeBaseStats["des"] = personajeBaseStats["des"] + 1
    
    global personajeEstadisticas
    personajeEstadisticas = personajeCalculoEstadisticas()

personajeLvlUp()
personajeLvlUp()

print(personajeEstadisticas)

# getSlime Genera un slime de nivel que le indiques

def getSlime(nvl):
    try:
        baseStatsSlime = {
            "nvl": nvl,
            "fue": int(1 + 1 / 3 * nvl),
            "con": int(1 + 1 / 2 * nvl),
            "int": int(1 + 1 / 2 * nvl),
            "esp": int(1 + 1 * nvl),
            "des": int(1 + 1 / 4 * nvl)
        }
        
        
        return {
        "nombre": "Slime", 
        "clase": "Limo", 
        "nvl": baseStatsSlime["nvl"], 
        "pgMax": baseStatsSlime["nvl"] * 5, 
        "pmMax": baseStatsSlime["nvl"] * 1,
        "ini": baseStatsSlime["des"] * 5,
        "phyAtk": baseStatsSlime["fue"] + dictArmas["Nada"]["phyAtk"],
        "phyDef": baseStatsSlime["con"] + dictArmaduras["Nada"]["phyDef"],
        "magAtk": baseStatsSlime["int"] + dictArmas["Nada"]["magAtk"],
        "magDef": baseStatsSlime["esp"] + dictArmaduras["Nada"]["magDef"],
        "crit": dictArmas["Nada"]["crit"],
        "fue": baseStatsSlime["fue"],
        "con": baseStatsSlime["con"], 
        "int": baseStatsSlime["int"],
        "esp": baseStatsSlime["esp"],
        "des": baseStatsSlime["des"],
        "Experiencia": 20}
        
    except TypeError:
        print("ERROR: Pasa un entero a la función getSlime.")

# getSlime Genera un goblin de nivel que le indiques

def getGoblin(nvl):
    try:
        baseStatsGoblin = {
            "nvl": nvl,
            "fue": int(1 + 1 / 2 * nvl),
            "con": int(1 + 1 / 3 * nvl),
            "int": int(1 + 1 / 4 * nvl),
            "esp": int(1 + 1 / 4* nvl),
            "des": int(1 + 1 / 2 * nvl)
        }
        
        
        return {
        "nombre": "Goblin", 
        "clase": "Humanoide", 
        "nvl": baseStatsGoblin["nvl"], 
        "pgMax": baseStatsGoblin["nvl"] * 6, 
        "pmMax": baseStatsGoblin["nvl"] * 2,
        "ini": baseStatsGoblin["des"] * 5,
        "phyAtk": baseStatsGoblin["fue"] + dictArmas["Espada Corta"]["phyAtk"],
        "phyDef": baseStatsGoblin["con"] + dictArmaduras["Nada"]["phyDef"],
        "magAtk": baseStatsGoblin["int"] + dictArmas["Nada"]["magAtk"],
        "magDef": baseStatsGoblin["esp"] + dictArmaduras["Nada"]["magDef"],
        "crit": dictArmas["Espada Corta"]["crit"],
        "fue": baseStatsGoblin["fue"],
        "con": baseStatsGoblin["con"], 
        "int": baseStatsGoblin["int"],
        "esp": baseStatsGoblin["esp"],
        "des": baseStatsGoblin["des"],
        "Experiencia": 30}
        
    except TypeError:
        print("ERROR: Pasa un entero a la función getGoblin.")



def turnoPersonaje(argus, monstruo):
    print("1.- Atacar\n2.- Pasar")
    opcion = int(input("Introduce tu acción:\n    > "))
    if opcion == 1:
        monstruo["pgAct"] = monstruo["pgAct"] - atacarPersonaje(argus)
        
    elif opcion == 2:
        return

def atacarPersonaje(personaje):
    golpeCritico = random.randint(1, 100)
    
    if golpeCritico > personaje["crit"]:
        return math.trunc(personaje["phyAtk"] * (random.randint(50, 125)/100))
    
    else:
        print("¡GOLPE CRÍTCO!")
        return math.trunc(personaje["phyAtk"] * (random.randint(50, 125)/100)) * 2

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

print(atacarPersonaje(personajeEstadisticas))