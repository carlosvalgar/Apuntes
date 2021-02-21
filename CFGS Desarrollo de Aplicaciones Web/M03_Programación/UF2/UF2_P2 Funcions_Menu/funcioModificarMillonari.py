import funcioCanviarNom
import funcioCanviarEdat
import funcioCanviarAccions

def modificarMillonari(empresari, accions):
    # Fem un bucle per a que ens doni un valor entre 1 i 4 a més de assegurarnos que sigui un nombre enter i retornem aquest numero
    
    opcio = 0
    while opcio < 1 or opcio > 4:
        try:
            print("\nMenú Modificació de Dades de un Millonari\n    1.- Canviar el Nom\n    2.- Canviar l'Edat\n    3.- Modificar les Accions\n    4.- Sortir")
            opcio = int(input("\nIntrodueix una opció:\n    > "))
            
            if opcio < 1 or opcio > 4:
                print("\nERROR: Opció no vàlida.")
            
            # Segons la opció cridem unes altres funcions
            
            elif opcio == 1:
                funcioCanviarNom.canviarNom(empresari)
            
            elif opcio == 2:
                funcioCanviarEdat.canviarEdat(empresari)
            
            elif opcio == 3:
                funcioCanviarAccions.canviarAccions(empresari, accions)
            
            elif opcio == 4:
                print()
                
        except ValueError:
            print("\nERROR: Introdueix un nombre enter.")