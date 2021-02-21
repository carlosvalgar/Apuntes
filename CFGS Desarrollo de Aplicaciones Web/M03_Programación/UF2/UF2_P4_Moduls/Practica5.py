import Exercici3
import Exercici4

flagLogIn = False

while not flagLogIn:
    # Demanem un nom i una contrasenya a l'usuari i posem en una variable el que ens retornen les funcions abans creades, sortira del bucle quan el nom i la contrasenya cumpleixin amb les condicions especificades
    nomUsuari = input("Introdueix el nom: ")
    validacioUsuari = Exercici3.validarNom(nomUsuari)
    
    if validacioUsuari == True:
        passUsuari = input("Introdueix la contrasenya: ")
        validacioPass = Exercici4.validarContrasenya(passUsuari)
        
        if validacioPass == True:
            print("Estamos dentro del programa")
            flagLogIn = True
        
        else:
            print(validacioPass)
    
    else:
        print(validacioUsuari)
        