import funcioDemanarNumero

def divisioDosNumeros():
    flagDivisioDosNumeros = False
    while not flagDivisioDosNumeros:
        try:
            
            # Demanem 2 numeros si el segon es 0 fem saltar un error
            
            print("\nNúmero 1 ", end = "")
            num1 = funcioDemanarNumero.demanarNumero()
            print("\nNúmero 2 ", end = "")
            num2 = funcioDemanarNumero.demanarNumero()
            
            if num2 == 0:
                raise ValueError
            
            print("\nEl resultat de la divisió es: " + str(num1 / num2) )
            
            flagDivisioDosNumeros = True
            
        except:
            print("\nERROR: No es pot dividir entre zero.")