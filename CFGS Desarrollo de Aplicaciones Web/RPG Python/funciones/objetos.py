import personaje as pj
# Cantidad descripcion
dictObjetos = {"Pocion": [10, "Restaura un 25% de la salud de tu personaje"]}


def objetos(objeto, cantidad):
    if objeto == "Pocion":
        if cantidad[objeto][0] >= 1:
            cantidad[objeto][0] -= 1
            if round(pj.personajeEstadisticas["pgAct"] + pj.personajeEstadisticas["pgMax"] * 0.25) >= pj.personajeEstadisticas["pgMax"]:
                print("Te has curado " + str(pj.personajeEstadisticas["pgMax"] - pj.personajeEstadisticas["pgAct"]) + " PG! ")
                pj.personajeEstadisticas["pgAct"] = pj.personajeEstadisticas["pgMax"]
            
            else:
                print("Te has curado " + str(round(pj.personajeEstadisticas["pgMax"] * 0.25)) + " PG!")
                pj.personajeEstadisticas["pgAct"] += round(pj.personajeEstadisticas["pgMax"] * 0.25)
        
        else:
            return False