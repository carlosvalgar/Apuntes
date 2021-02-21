import funcioDemanarNumero

def f():
    flagFuncioF = False
    while not flagFuncioF:
        try:
            
            # Demanem un numero que te que ser major que 100 si no ho es fem saltar un error
            
            numero = funcioDemanarNumero.demanarNumero()
            
            if numero <= 100:
                raise ValueError
            
            print("\nEl resultat de la funció es: " + str(numero - 100))
            
            flagFuncioF = True
        
        except ValueError:
            print("\nERROR: El nombre ha de ser major que 100.")