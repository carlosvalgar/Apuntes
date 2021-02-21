def descompteAplicat(preu, descompte):
    descompteAplicat = (preu * (100 - descompte))/100
    return descompteAplicat

def llegeixla10():
    flagLlegeixla10 = False
    while not flagLlegeixla10:
        try:
            numero = int(input("\nIntrodueix un nombre sencer entre 0 i 10:\n    > "))
            if numero <= 10 and numero >= 0:
                flagLlegeixla10 = True
            else:
                print("\nERROR: Introdueix un nombre entre 0 i 10.")
                
        except ValueError:
            print("\nERROR: Introdueix un nombre sencer.")
            
    return numero

def esVocal(caracter):
    if caracter.lower() in "aeiou":
        return True
    else:
        return False

def multiplicacioLista(lista):
    num = 1
    for x in lista:
        num *= x
    
    return num

def histograma(lista, caracterHorizontal = "-", caracterVertical = "|"):
    print("\nHistograma:\n")
    for x in lista:
        celdaNumerica = str(caracterVertical) + " " + str(x) + " " + str(caracterVertical)
        longitud = str(caracterHorizontal* x)
        
        print(caracterHorizontal * len(celdaNumerica), end = "")
        print(longitud)
        
        print(celdaNumerica, end = "")
        print(" " * len(longitud) + caracterVertical)
        
        print(caracterHorizontal * len(celdaNumerica), end = "")
        print(longitud)
    print()

def filtraParaules(llistaParaules, numeroDeCaracters):
    llistaParaulesAmbMesCaracters = []
    for x in llistaParaules:
        if len(x) > numeroDeCaracters:
            llistaParaulesAmbMesCaracters.append(x)
            
    return llistaParaulesAmbMesCaracters

def cuantesMayuscules():
    cadenaText = input("\nIntrodueix una paraula:\n    > ")
    
    contador = 0
    
    for x in cadenaText:
        if x.isupper():
            contador += 1
            
    print("\nLa paraula que has introduit conté " + str (contador) + " lletres en majúscula.\n")

flagMenu = False

while not flagMenu:
    print("Exercicis de Funcions:\n    1.- Exercici 1\n    2.- Exercici 2\n    3.- Exercici 3\n    4.- Exercici 4\n    5.- Exercici 5\n    6.- Exercici 6\n    7.- Exercici 7\n    8.- Sortir\n\nEscull una opcio:")
    opcio = int(input("    > "))

    if opcio == 1:
        # Definiu i programeu una funció que, donats un preu i un percentatge de descompte, ens torni el preu amb el descompte aplicat. La funció té dos paràmetres: preu i percentatge. Retorna el preu amb el descompte aplicat.
        
        preu = float(input("\nIntrodueix el preu del producte:\n    > "))
        descompte = float(input("\nIntrodueix el descompte:\n    > "))
        print("\nPreu amb descompte: " +str(descompteAplicat(preu, descompte)) + "\n")     
        
    elif opcio == 2:
        # Creeu una funció "llegeixla10" que s'encarregui de demanar a l'usuari que introdueixi pel teclat un nombre entre 0 i 10. Fins que el nombre no està entre 0 i el 10, continua demanant a l'usuari el número. La funció no té paràmetres, i retorna un nombre sencer, que és el que s'ha llegit a la funció.
        print("\nNúmero:", llegeixla10(), "\n")

    elif opcio == 3:
        # Escriure una funció que donat un caràcter retorni True si és una vocal, en cas contrari, torna False.
        flagCaracter = False
        while not flagCaracter:
            caracter = input("\nIntroduex un carácter:\n    > ")
            
            if len(caracter) == 1 and caracter.isnumeric() == False:
                flagCaracter = True
            
            else: 
                print("\nERROR: Introdueix només un carácter que no sigui numéric.")
                
        if esVocal(caracter) == True:
            print("\nEs una vocal.\n")
        
        else:
            print("\nEs una consonant.\n")
    
    elif opcio == 4:
        # Escriure una funció multipliquin els elements d’una llista. Per exemple: multip([1,2,3,4]) hauria de tornar 24.
        lista = []
        flagIntroducirNumero = False
        while not flagIntroducirNumero:
            try:
                x = int(input("\nIntrodueix un nombre sencer:\n    > "))
                
                lista.append(x)
                
                flagContinuar = False
                while not flagContinuar:
                    try:
                        print("\nLlista = " + str(lista))
                        
                        continuar = int(input("\n¿Vols continuar afegint nombres?\n    1.- Si\n    2.- No\n\n    > "))

                        if continuar == 1:
                            flagContinuar = True
                        
                        elif continuar == 2:
                            flagContinuar = True
                            flagIntroducirNumero = True
                        
                        else:
                            print("\nERROR: Introdueix 1 o 2.")
                        
                    except ValueError:
                        print("\nERROR: Introdueix 1 o 2.")
                
            except ValueError:
                print("\nERROR: Introdueix un nombre sencer.")

        print("\nLa multiplicació dels nombres de la llista: " + str(lista) + " és = " + str (multiplicacioLista(lista)) + "\n")
        
    elif opcio == 5:
        # Escriure un programa que contingui una funció anomenada histograma, aquesta funció agafarà els elements d’una llista de números sencers i imprimirà un histograma en la pantalla. 
        lista = []
        flagIntroducirNumero = False
        while not flagIntroducirNumero:
            try:
                x = int(input("\nIntrodueix un nombre sencer:\n    > "))
                
                lista.append(x)
                
                flagContinuar = False
                while not flagContinuar:
                    try:
                        print("\nLlista = " + str(lista))
                        
                        continuar = int(input("\n¿Vols continuar afegint nombres?\n    1.- Si\n    2.- No\n\n    > "))

                        if continuar == 1:
                            flagContinuar = True
                        
                        elif continuar == 2:
                            flagContinuar = True
                            flagIntroducirNumero = True
                        
                        else:
                            print("\nERROR: Introdueix 1 o 2.")
                        
                    except ValueError:
                        print("\nERROR: Introdueix 1 o 2.")
                
            except ValueError:
                print("\nERROR: Introdueix un nombre sencer.")
        
        histograma(lista)
    
    elif opcio == 6:
        # Escriure un programa que contingui una funció anomenada filtra_paraules, que agafi una llista de paraules i un nombre sencer n, i retorni les paraules que tinguin més de n caràcters.
        llista = []
        
        flagIntroducirPalabra = False
        while not flagIntroducirPalabra:
            x = input("\nIntrodueix una paraula:\n    > ")
                
            llista.append(x)
                
            flagContinuar = False
            while not flagContinuar:
                try:
                    print("\nLlista = " + str(llista))
                        
                    continuar = int(input("\n¿Vols continuar afegint paraules?\n    1.- Si\n    2.- No\n\n    > "))

                    if continuar == 1:
                        flagContinuar = True
                    
                    elif continuar == 2:
                        flagContinuar = True                            
                        flagIntroducirPalabra = True
                    
                    else:
                        print("\nERROR: Introdueix 1 o 2.")
                        
                except ValueError:
                    print("\nERROR: Introdueix 1 o 2.")
        
        flagNumeroSencer = False
        
        while not flagNumeroSencer:
            try:
                numeroMaxCaracters = int(input("\nIntrodueix un nombre sencer mayor que zero:\n    > "))
                
                if numeroMaxCaracters > 0:
                    flagNumeroSencer = True
                
                else:
                    print("\nERROR: El número no es major que zero.")
            
            except ValueError:
                print("\nERROR: Introdueix un nombre sencer.")
        
        print("\nLes paraules de la llista amb mes de " + str(numeroMaxCaracters) + " caràcters són:")
        
        for x in filtraParaules(llista, numeroMaxCaracters):
            print("    > " + str(x))
        print()
        
    elif opcio == 7:
        cuantesMayuscules()
        
    else:
        flagMenu=True
        input("\nFi del Programa, polsi cualsevol tecla per tancar el programa.")