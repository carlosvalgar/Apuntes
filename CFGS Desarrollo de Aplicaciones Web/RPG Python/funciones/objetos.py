import personaje as pj
# Cantidad descripcion
dictObjetos = {"Pocion": [1, "Restaura un 25% de la salud de tu personaje"]}


def objetos(objeto, cantidad):
    if objeto == "Pocion":
        if cantidad[objeto][0] >= 1:
            cantidad[objeto][0] -= 1
            if round(pj.personajeEstadisticas["pgAct"] + pj.personajeEstadisticas["pgMax"] * 0.25) >= pj.personajeEstadisticas["pgMax"]:
                pj.personajeEstadisticas["pgAct"] = pj.personajeEstadisticas["pgMax"]
            
            else:
                pj.personajeEstadisticas["pgAct"] += round(pj.personajeEstadisticas["pgMax"] * 0.25)
        
        else:
            return False
        
pj.personajeEstadisticas["pgAct"] -= 1
print(pj.personajeEstadisticas["pgAct"])

objetos("Pocion", dictObjetos)
print(dictObjetos)
print(pj.personajeEstadisticas)
objetos("Pocion", dictObjetos)
print(dictObjetos)
print(pj.personajeEstadisticas)