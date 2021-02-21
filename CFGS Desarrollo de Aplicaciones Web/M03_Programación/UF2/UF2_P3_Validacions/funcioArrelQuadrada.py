import math
import funcioDemanarNumero

def arrelQuadrada():
    flagArrelQuadrada = False
    while not flagArrelQuadrada:
        
        # Fem l'arrel quadrada d'un numero que demanem per un altre funcio, si el numero es negatiu el comprovem aqui mateix ja que la funcio l'utilitzarem de base
        
        try:
            numero = funcioDemanarNumero.demanarNumero()
            
            if numero < 0:
                raise ValueError
            
            print("\nEl resultat de l'arrel quadrada es: " + str(math.sqrt(numero)))
            
            flagArrelQuadrada = True
            
        except ValueError:
            print("\nERROR: El número no pot ser negatiu.")