import personaje as pj
import habilidadesPersonaje as pjskll
import habilidadesMonstruo as mnstrskll
import menus as menu
import os

clear = lambda: os.system("cls")

defensaPersonaje = False

def turnoPersonaje(monstruo):
    global defensaPersonaje
    flagEndTurn = False
    
    while not flagEndTurn:
        if defensaPersonaje == True:
            pj.personajeEstadisticas["phyDef"] = int(pj.personajeEstadisticas["phyDef"] / 2)
            defensaPersonaje = False
        
        option = menu.menuPersonaje(menu.menuPrincipalCombate, monstruo, "Turno de " + pj.personajeEstadisticasExtra["nombre"], 12)
        
        if option == 1:
            monstruo["pgAct"] -= pjskll.atacarPersonaje(pj.personajeEstadisticas, monstruo)
            flagEndTurn = True

        elif option == 2:
            pjskll.defensaPersonaje(pj.personajeEstadisticas)
            defensaPersonaje = True
            flagEndTurn = True
            
        elif option == 3:
            flagSkills = False
            
            while not flagSkills:
                optionSkill = menu.menuPersonaje(menu.menuHabilidadesCombate, monstruo, "Habilidades", 59)
                
                if optionSkill == 1 and pj.personajeEstadisticas["pmAct"]>= 2:
                    pjskll.corteRapido(pj.personajeEstadisticas, monstruo)
                    flagSkills = True
                    flagEndTurn = True
                
                elif optionSkill == 1 and pj.personajeEstadisticas["pmAct"] < 2:
                    print("No tienes suficiente mana!")
                    
                elif optionSkill == 2 and pj.personajeEstadisticas["pmAct"]>= 2 and pj.personajeBaseStats["lvl"] >= 2:
                    pjskll.corteRapido(pj.personajeEstadisticas, monstruo)
                    print("CORTE RAPIDO LVL 2!")
                    flagSkills = True
                    flagEndTurn = True
                
                
                elif optionSkill == 2 and pj.personajeEstadisticas["pmAct"] < 2 and pj.personajeBaseStats["lvl"] >= 2:
                    print("No tienes suficiente mana!")
                    
                else:
                    flagSkills = True
                    
        elif option == 4:
            print("WIP")

def gameOver():
    print("Tus PG han llegado a 0, has perdido.")

def victoria(monstruo):
    print("¡Has vencido al monstruo en combate!")
    pj.personajeEstadisticasExtra["expAct"] += monstruo["exp"]
    if pj.personajeEstadisticasExtra["expAct"] >= pj.personajeEstadisticasExtra["expNext"]:
        pj.personajeLvlUp()
        menu.menuHabilidadesCombate = menu.diccionarioHabilidades()

def combate(personaje, monstruo):
    flagEnd = False
    while not flagEnd:
        personaje["prio"] += personaje["ini"]
        monstruo["prio"] += monstruo["ini"]
        
        if personaje["prio"] >= 100 and personaje["prio"] >= monstruo["prio"]:
            turnoPersonaje(monstruo)
            personaje["prio"] -= 100
            
            if personaje["pgAct"] <= 0:
                gameOver()
                flagEnd = True
                
            elif monstruo["pgAct"] <= 0:
                victoria(monstruo)
                flagEnd = True
        
        elif monstruo["prio"] > 100:
            personaje["pgAct"] -= mnstrskll.atacarMonstruo(monstruo, personaje)
            monstruo["prio"] -= 100
            
            if personaje["pgAct"] <= 0:
                gameOver()
                flagEnd = True
                
            elif monstruo["pgAct"] <= 0:
                victoria(monstruo)
                flagEnd = True