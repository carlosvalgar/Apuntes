import time

def informacioMillonaris(empresari):
    empresariosOrdenadosEdad = []
    
    # Fem una llista de llistes amb el nom de l'empresari i l'edat
    
    for x in empresari.keys():
        empresariosOrdenadosEdad.append([x, empresari[x][0]])
    
    # Fem l'ordenació bombolla
    
    for x in range(len(empresariosOrdenadosEdad) -1):
        for y in range(len(empresariosOrdenadosEdad) -1 -x):
            if empresariosOrdenadosEdad[y][1] < empresariosOrdenadosEdad[y + 1][1]:
                empresariosOrdenadosEdad[y], empresariosOrdenadosEdad[y + 1] = empresariosOrdenadosEdad[y + 1], empresariosOrdenadosEdad[y]
    
    # Printem la informació de cada empresari segons la llista ordenada per edats
    
    for x in empresariosOrdenadosEdad:
        print("\n" + str(x[0]) + " amb " + str(empresari[x[0]][0]) + " anys té una quantitat d'accions a cada empresa:" )
        
        for y in empresari[x[0]][1].keys():
            print("    > " + str(y) + ": " + str(empresari[x[0]][1][y]))
        time.sleep(1)
    print()    