def seleccioMillonari(empresari):
    # Ens permet introduir un nom i el busca a la llista si esta retorna aquest valor, sino pregunta si vols buscar un altra i si no vols retorna None
    
    flagSeleccioMillonari = False
    while not flagSeleccioMillonari:
        millonari = input("\nIntrodueix el nom del millonari que vols modificar:\n    > ").capitalize()

        if millonari in empresari.keys():
            flagSeleccioMillonari = True
        
        else:
            flagSeguirCanviantNom = False
            while not flagSeguirCanviantNom:
                try:
                    seguirCanviantNom = int(input("\nERROR: El millonari no està a la nostra base de dades. Vols introduir un altre nom?\n    1.- Sí\n    2.- No\n\n    > "))
                    
                    if seguirCanviantNom == 1:
                        flagSeguirCanviantNom = True
                        
                    elif seguirCanviantNom == 2:
                        print()
                        return None
                    
                    else:
                        print("ERROR: Introdueix la opció 1 o 2.")
                
                except ValueError:
                    print("ERROR: Introdueix un nombre sencer.")

    return millonari