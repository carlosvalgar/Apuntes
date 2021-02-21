import funcioSeleccioMillonari
import time
def canviarNom(empresari):
    # Fem una funció en especial per seleccionar el nom del millonari que volem modificar
    
    canviarNom = funcioSeleccioMillonari.seleccioMillonari(empresari)
    
    # Si retorna None sortirem de la funció y tornarem al menú principal
    
    if canviarNom == None:
        return
    
    # Ens asegurem que el nom nou no estigui a la llista de millonaris
    
    flagNouNomMillonari = False
    while not flagNouNomMillonari:
        nouNom = input("\nIntrodueix el nou nom del millonari " + str(canviarNom) + ":\n    > ").capitalize()
    
        
        if nouNom in empresari.keys():
            print("\nERROR: El nom que ha introduit ya esta en la base de dades.")
            
        else:
            flagNouNomMillonari = True
    
    # Fem una nova entrada al diccionari ja que no es pot modificar la key d'un diccionari, per tant li donarem tots els valors de l'antiga key a la nova i la borrarem despres
    
    empresari[nouNom] = empresari[canviarNom]
    empresari.pop(canviarNom)
    print("\nNom canviat amb éxit.\n")
    time.sleep(1)
