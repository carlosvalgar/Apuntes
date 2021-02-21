def menu():
    try:
        # Demanem un numero i si no compleix amb les condicions fem saltar un error, el mateix que seria si posem lletres
        
        opcio = int(input("\nLa calculadora\n    1.- Arrel quadrada d'un número\n    2.- Divisió entre dos números\n    3.- Calcular el resultat de f(x) = x -100\n    4.- Sortir\n    > "))
        
        if opcio < 1 or opcio > 4:
            raise ValueError
        
        else:
            return opcio
    
    except ValueError:
        print("\nERROR: Opció invalida")