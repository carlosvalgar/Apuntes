import armas as wpn
import armaduras as arm

# Te recalcula las estadisticas del personaje, util para subir de nivel o calcular la base

def personajeCalculoEstadisticas():
    return {
        "lvl": personajeBaseStats["lvl"],
        "pgMax": personajeBaseStats["lvl"] * 10,
        "pgAct": personajeBaseStats["lvl"] * 10,
        "pmMax": personajeBaseStats["lvl"] * 5,
        "pmAct": personajeBaseStats["lvl"] * 5,
        "ini": personajeBaseStats["des"] * 1,
        "prio": personajeBaseStats["des"] * 1,
        "phyAtk": personajeBaseStats["fue"] + wpn.dictArmas[personajeEquipamiento["arma"]]["phyAtk"],
        "phyDef": personajeBaseStats["con"],
        "magAtk": personajeBaseStats["int"] + wpn.dictArmas[personajeEquipamiento["arma"]]["magAtk"],
        "magDef": personajeBaseStats["esp"],
        "crit": wpn.dictArmas[personajeEquipamiento["arma"]]["crit"]
    }

# Sube un nivel al personaje

def personajeLvlUp():
    personajeBaseStats["lvl"] = personajeBaseStats["lvl"] + 1
    personajeBaseStats["fue"] = personajeBaseStats["fue"] + 1
    personajeBaseStats["con"] = personajeBaseStats["con"] + 1
    personajeBaseStats["int"] = personajeBaseStats["int"] + 1
    personajeBaseStats["esp"] = personajeBaseStats["esp"] + 1
    personajeBaseStats["des"] = personajeBaseStats["des"] + 1
    personajeEstadisticasExtra["expNext"] += int(personajeEstadisticasExtra["expNext"] + personajeEstadisticasExtra["expNext"] * personajeBaseStats["lvl"] * 0.125)
    print("Has subido al nivel " + str(personajeBaseStats["lvl"]))
    
    global personajeEstadisticas
    
    personajeEstadisticas = personajeCalculoEstadisticas()

# Diccionario con las estadisticas base del personaje

personajeBaseStats = {
    "lvl": 1,
    "fue": 3, 
    "con": 1, 
    "int": 1, 
    "esp": 1, 
    "des": 3
}

# Diccionario con el equipamiento base del personaje

personajeEquipamiento = {
    "arma": "Espada Corta", 
    "armadura": "Nada", 
    "abalorio": "Nada"
}

# Diccionario con las estadisticas calculadas del personaje

personajeEstadisticas =  personajeCalculoEstadisticas()

# Estadisticas adicionaes del personaje que no entran en otro diccionario

personajeEstadisticasExtra = {
    "nombre": "Personaje",
    "clase": "Guerrero",
    "expAct": 0,
    "expNext": 20
}

