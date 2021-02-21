def alumnesAprovats(llistaAlumnes, llistaNotes):
    llistaAprovats = []
    for x in range(len(llistaAlumnes)):
        if llistaNotes[x] >= 5:
            llistaAprovats.append(llistaAlumnes[x])
    print("\n" + str(llistaAprovats) + "\n")

def numeroAprovats(llistaNotes):
    contador = 0
    for x in llistaNotes:
        if x >= 5:
            contador += 1
    return contador

def maximaNota(llistaAlumnes, llistaNotes):
    notaMesAlta = max(llistaNotes)
    llistaNumeroAlumne = []
    for x in range(len(llistaAlumnes)):
        if llistaNotes[x] == notaMesAlta:
            llistaNumeroAlumne.append(llistaAlumnes[x])
    print("\n" + str(llistaNumeroAlumne) + "\n")

def igualMesMitja(llistaAlumnes, llistaNotes):
    mitja = 0
    for x in llistaNotes:
        mitja += x
    mitja /= len(llistaNotes)
    
    llistaAlumnesMesMitja = []
    for x in range(len(llistaNotes)):
        if llistaNotes[x] >= mitja:
            llistaAlumnesMesMitja.append(llistaAlumnes[x])
    print("\n" + str(llistaAlumnesMesMitja) + "\n")

def buscaNotaPerNom(llistaAlumnes, llistaNotes, nomAlumne):
    if nomAlumne.capitalize() in llistaAlumnes:
        return llistaNotes[llistaAlumnes.index(nomAlumne.capitalize())]
    
    else:
        return None
    
def ordenaNota(llistaAlumnes, llistaNotes):
    for x in range(len(llistaNotes) -1):
        for y in range (len(llistaNotes) -1 -x):
            if llistaNotes[y] < llistaNotes[y + 1]:
                llistaNotes[y], llistaNotes[y + 1] = llistaNotes[y + 1], llistaNotes[y]
                llistaAlumnes[y], llistaAlumnes[y + 1] = llistaAlumnes[y + 1], llistaAlumnes[y]
                
    capcelera = "| " + "Alumne".center(10) + " | " + "Nota".center(4) + " |"
    print("\n" + "-" * len(capcelera) + "\n" + str(capcelera) + "\n" + "-" * len(capcelera))
    
    for x in range(len(llistaNotes)):
        print("| " + str(llistaAlumnes[x]).center(10) + " | " + str(llistaNotes[x]).center(4) + " | ")
    print("-" * len(capcelera) + "\n")
        
alumnes = ["Pere", "Pau", "Anna", "Andrea", "Pol", "Nil", "Montserrat", "Gerard"]
notes = [4.3, 5.6, 5.9, 9.7, 2.6, 6.8, 8.8, 2.4]

flagMenu = False

while not flagMenu:
    print("Programa de gestió d'alumnes i notes:\n    1.- Mostra els alumnes aprovats\n    2.- Mostra el numero d'aprovats\n    3.- Alumnes amb major nota\n    4.- Alumnes amb més nota que la nota mitja\n    5.- Mostra la nota de l'alumne\n    6.- Mostra els alumnes ordenats per les seves notes\n    7.- Sortir")
    opcioMenu = int(input("\nIntrodueix una de les opcions del menú:\n    > "))
    
    if opcioMenu == 1:
        alumnesAprovats(alumnes, notes)
        
    elif opcioMenu == 2:
        print("\n" + str(numeroAprovats(notes)) + "\n")
    
    elif opcioMenu == 3:
        maximaNota(alumnes, notes)
    
    elif opcioMenu == 4:
        igualMesMitja(alumnes, notes)
    
    elif opcioMenu == 5:
        nomAlumne = input("\nIntrodueix el nom de l'alumne a buscar:\n    > ")
        print("\n" + str(buscaNotaPerNom(alumnes, notes, nomAlumne)) + "\n")
    
    elif opcioMenu == 6:
        ordenaNota(alumnes, notes)
        
    elif opcioMenu == 7:
        flagMenu = True
        input("Prem enter per tancar el programa.")