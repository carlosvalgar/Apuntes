import funcioSeleccioMillonari
import time

def canviarEdat(empresari):
    # Fem una funció en especial per seleccionar el nom del millonari que volem modificar
    
    canviarEdat = funcioSeleccioMillonari.seleccioMillonari(empresari)
    
    # Si retorna None sortirem de la funció y tornarem al menú principal
    
    if canviarEdat == None:
        return

    # Fem un bucle per a assegurarnos que ens introdueixen un nombre enter com a edat
    
    flagEdatMillonari = False
    while not flagEdatMillonari:
        try:
            novaEdat = int(input("\nIntrodueix la nova edat del millonari:\n    > "))
            flagEdatMillonari = True
            
        except ValueError:
            print("\nERROR: Introdueix un nombre sencer.")
    
    empresari[canviarEdat][0] = novaEdat
    print("\nEdat canviada amb éxit.\n")
    time.sleep(1)