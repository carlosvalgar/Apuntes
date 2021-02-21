import funcioSeleccioMillonari
import time

def canviarAccions(empresari, accions):
    # Fem una funció en especial per seleccionar el nom del millonari que volem modificar
    
    canviarAccions = funcioSeleccioMillonari.seleccioMillonari(empresari)
    
    # Si retorna None sortirem de la funció y tornarem al menú principal
    
    if canviarAccions == None:
        return
    
    # Fem una llista amb el nom de totes les empreses
    
    llistaEmpreses = []
    
    for x in accions.keys():
        llistaEmpreses.append(x)
    
    flagCanviarAccions = False
    
    while not flagCanviarAccions:
        try:
            # Introduim el valor de l'empresa que volem canviar, aquest print esta fet per que mostri 3 empreses per linea i es generi encara que afegim empreses 
            
            print("\nDe quina empresa vols canviar les accions del millonari " + str(canviarAccions) + "?\nLes empreses son:\n    ", end = "")
            c = 0
            for x in llistaEmpreses:
                c+=1
                print(str(c) + ".- " + str(x).ljust(20), end = "")
                    
                if c%3 == 0 and x == llistaEmpreses[len(llistaEmpreses)-1]:
                    pass
                
                elif c%3 == 0:
                    print("\n    ", end = "")
                    
            empresaCanviaAccions = int(input("\n\n    > "))
            
            # Si el numero es una de les empreses ens demanará el valor per a les accions
            
            if empresaCanviaAccions > 0 and empresaCanviaAccions <= len(llistaEmpreses):
                while not flagCanviarAccions:
                    try:
                        nouValorAccions = int(input("\nIntrodueix la quantitat que té d'accions de l'empresa " +str(llistaEmpreses[empresaCanviaAccions -1] + ":\n    > ")))
                        empresari[canviarAccions][1][llistaEmpreses[empresaCanviaAccions -1]] = nouValorAccions
                        flagCanviarAccions = True
                        print("\nAccions modificades amb éxit.\n")
                        time.sleep(1)
                        
                    except ValueError:
                        print("\nIntrodueix un nombre sencer.")  
                    
            else:
                print("\nERROR: Introdueix un número entre 1 y " + str(len(llistaEmpreses)) + ".")
        
        except ValueError:
            print("\nIntrodueix un nombre sencer.")
        
        