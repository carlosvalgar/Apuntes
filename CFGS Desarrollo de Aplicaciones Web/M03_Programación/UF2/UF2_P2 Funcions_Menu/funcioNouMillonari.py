import time

def nouMillonari(empresari, accions):
    # Fem un bucle per a introduir el nom i asegurarnos que no estigui en la llista
    
    flagNomMillonari = False
    while not flagNomMillonari:
        nomMillonari = input("\nIntrodueix el nom del nou millonari:\n    > ").capitalize()
        
        if nomMillonari in empresari.keys():
            print("\nERROR: El nom que ha introduit ya esta en la base de dades.")
            
        else:
            flagNomMillonari = True
    
    # Fem un altre bucle per a assegurarnos que ens introdueixen un nombre enter com a edat
    
    flagEdatMillonari = False
    while not flagEdatMillonari:
        try:
            edatMillonari = int(input("\nIntrodueix l'edat del nou millonari:\n    > "))
            flagEdatMillonari = True
            
        except ValueError:
            print("\nERROR: Introdueix un nombre sencer.")
    
    # Fem un altre bucle per a introduir les accions de totes les empreses que tenim a la llista
    
    diccionariAccionsMillonari = {}
    
    for x in accions.keys():
        flagAccionsMillonari = False
        while not flagAccionsMillonari:
            try:
                diccionariAccionsMillonari[x] = int(input("\nIntrodueix les accions per a l'empresa " + str(x) + ":\n    > "))
                flagAccionsMillonari = True
                
            except ValueError:
                print("\nERROR: Introdueix un nombre sencer.")
    
    # Afegim les dades a la nostra llista (ja que com hem passat les variables ens permet modificar el valor d'aquesta)
    
    empresari[nomMillonari] = [edatMillonari, diccionariAccionsMillonari]
    print("\nMillonari introduit amb èxit.\n")
    
    time.sleep(1)