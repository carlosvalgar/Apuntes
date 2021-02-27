import armas as wpn
import armaduras as arm

# Genera un slime de nivel que le indiques

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
        "pgAct": baseStatsSlime["nvl"] * 5, 
        "pmMax": baseStatsSlime["nvl"] * 1,
        "pmAct": baseStatsSlime["nvl"] * 1,
        "ini": baseStatsSlime["des"] * 1,
        "prio": baseStatsSlime["des"] * 1,
        "phyAtk": baseStatsSlime["fue"] + wpn.dictArmas["Nada"]["phyAtk"],
        "phyDef": baseStatsSlime["con"] + arm.dictArmaduras["Nada"]["phyDef"],
        "magAtk": baseStatsSlime["int"] + wpn.dictArmas["Nada"]["magAtk"],
        "magDef": baseStatsSlime["esp"] + arm.dictArmaduras["Nada"]["magDef"],
        "crit": wpn.dictArmas["Nada"]["crit"],
        "fue": baseStatsSlime["fue"],
        "con": baseStatsSlime["con"], 
        "int": baseStatsSlime["int"],
        "esp": baseStatsSlime["esp"],
        "des": baseStatsSlime["des"],
        "exp": int(20 * (0.5 + nvl / 2))}
        
    except TypeError:
        print("ERROR: Pasa un entero a la función getSlime.")

# Genera un goblin de nivel que le indiques

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
        "pgAct": baseStatsGoblin["nvl"] * 6, 
        "pmMax": baseStatsGoblin["nvl"] * 2,
        "pmAct": baseStatsGoblin["nvl"] * 2,
        "ini": baseStatsGoblin["des"] * 1,
        "prio": baseStatsGoblin["des"] * 1,
        "phyAtk": baseStatsGoblin["fue"] + wpn.dictArmas["Espada Corta"]["phyAtk"],
        "phyDef": baseStatsGoblin["con"] + arm.dictArmaduras["Nada"]["phyDef"],
        "magAtk": baseStatsGoblin["int"] + wpn.dictArmas["Espada Corta"]["magAtk"],
        "magDef": baseStatsGoblin["esp"] + arm.dictArmaduras["Nada"]["magDef"],
        "crit": wpn.dictArmas["Espada Corta"]["crit"],
        "fue": baseStatsGoblin["fue"],
        "con": baseStatsGoblin["con"], 
        "int": baseStatsGoblin["int"],
        "esp": baseStatsGoblin["esp"],
        "des": baseStatsGoblin["des"],
        "exp": int(30 * (0.5 + nvl / 2))}
        
    except TypeError:
        print("ERROR: Pasa un entero a la función getGoblin.")