def menuPrincipal():
    print("Menú Principal\n    1.- Introduir nou millonari\n    2.- Mostrar el millonari més ric\n    3.- Mostrar la informació de tots els millonaris\n    4.- Introduir una nova empresa\n    5.- Modificar la informació d'un millonari\n    6.- Sortir")
    
    # Fem un bucle per a que ens doni un valor entre 1 i 6 a més de assegurarnos que sigui un nombre enter i retornem aquest numero
    
    opcio = 0
    while opcio < 1 or opcio > 6:
        try:
            opcio = int(input("\nIntrodueix una opció:\n    > "))
            
            if opcio < 1 or opcio > 6:
                print("\nERROR: Opció no vàlida.")
                
        except ValueError:
            print("\nERROR: Introdueix un nombre enter.")
        
    return opcio