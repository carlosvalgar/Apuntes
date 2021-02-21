import time

def afegirEmpresa(empresari, accions):
    # Generem una llista que tindra tots els noms de les empreses en minucscula per comparar que no es pugui colocar la mateixa empresa dos cops
    
    llistaNomEmpresa = []
    
    for x in accions.keys():
        llistaNomEmpresa.append(x.lower())
    
    flagNomEmpresa = False
    while not flagNomEmpresa:
        nomEmpresa = input("\nAfegeix el nom de la nova empresa:\n    > ")
        
        if nomEmpresa.lower() not in llistaNomEmpresa:
            flagNomEmpresa = True
            
        else:
            print("\nERROR: El nom que intenta introduir ja esta a la base de dades.")
    
    # Fem un bucle per introduir el valor de les accions
    
    flagValorAccions = False
    while not flagValorAccions:
        try:
            valorAccions = float(input("\nIntrodueix el valor de les accions:\n    > "))
            flagValorAccions = True
            
        except ValueError:
            print("\nERROR: Introdueix un nombre enter o decimal.")
    
    accions[nomEmpresa] = valorAccions
    
    # Fem un bucle per introduir la nova empresa a tots els empresaris ja existents
    
    for x in empresari.keys():
        empresari[x][1][nomEmpresa] = 0
    print("\nEmpresa introduida amb éxit.\n")
    time.sleep(1)