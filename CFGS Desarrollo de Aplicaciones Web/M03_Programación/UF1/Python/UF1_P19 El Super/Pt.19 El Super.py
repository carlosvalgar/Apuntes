# Pt.19 El Super

print("\nBenvinguit al Super!")

productes = [(41419, 'Fideus', 0.75, 210), (70717, 'Quadern', 1.5, 119), (78714, 'Sabó', 2.34, 708), (30877, 'Desodorant', 2.5, 79), (47470, 'Iogurt', 0.43, 832), 
(50809, 'Pomes', 0.56, 55), (75466, 'Galetes', 2.35, 0), (33692, 'Beguda', 0.81, 20), (89148, 'Arròs', 1.48, 121), (66194, 'Llapis', 1, 900), (15982, 'Llet', 1.6, 40), 
(41235, 'Xocolate', 3.75, 48)]

clients = [('11652624-7', 'Perico Los Palotes'), ('88302680-0', 'Leonardo Farkas'), ('75478967-8', 'Fulanita De Tal')]

vendes = [(1, (2020, 9, 12), '88302680-0'), (2, (2020, 9, 19), '11652624-7'), (3, (2020, 9, 30), '75478967-8'), (4, (2020, 10, 1), '88302680-0'), (5, (2020, 10, 13), '75478967-8'), 
(6, (2020, 11, 11), '11652624-7')]

items = [(1, 89148, 3), (2, 50809, 4), (2, 33692, 2), (2, 47470, 6), (3, 30877, 1), (4, 89148, 1), (4, 75466, 2), (5, 89148, 2), (5, 47470, 10), (6, 41419, 2)]

llistaMesos = ["Gener", "Febrer", "Març", "Abril", "Maig", "Juny", "Juliol", "Agost", "Septembre", "Octubre", "Novembre", "Desembre"]

flagSortir = False

while not flagSortir:
    print("\nQue vols fer?\na) Inserir producte al magatzem\nb) Inserir clients\nc) Producte més car\nd) Preu total que costa tots els productes del magatzem\ne) Ingrés total per"
    " vendes\nf) Producte amb més ingresos\ng) Client que més ha gastat\nh) Total de vendes del mes\ni) Data última venda de producte\nj) Sortir del programa\n\nIntrodueix la teva"
    " opció (la lletra de l'opció): ")

    optMenu = input()

    if optMenu.lower() == "a":
        flagCodiProducte = False

        while not flagCodiProducte:
            flagCodiProducte = True
            codiProducte = 0

            while len(str(codiProducte)) != 5:
                codiProducte = int(input("Introdueix el codi de 5 dígits del producte: "))

                if len(str(codiProducte)) != 5:
                    print("\nError: El codi té que ser de 5 dígits.\n")

            for i in productes:
                if codiProducte == i[0]:
                    flagCodiProducte = False
                    print("\nError: El codi ja existeix en la base de dades.")
                    print(i, "\n")
          
        nomProducte = input("Introdueix el nom del producte: ")
        preuProducte = float(input("Introdueix el preu del producte: "))
        quantitatMagatzem = int(input("Introdueix la quantitat de producte al magatzem: "))

        productes.append((codiProducte, nomProducte.capitalize(), preuProducte, quantitatMagatzem))

        print("\nLlista de productes:", productes)

    elif optMenu.lower() == "b":
        flagCodiClient = False            

        while not flagCodiClient:
            flagCodiClient = True
            codiClient = 0

            while len(str(codiClient)) != 8:
                codiClient = int(input("Introdueix el codi de 8 dígits del client: "))

                if len(str(codiClient)) != 8:
                    print("\nError: El codi té que ser de 8 dígits.\n")

            codiClient2 = 10

            while len(str(codiClient2)) != 1:
                codiClient2 = int(input("Introdueix el número diferenciador (un dígit): "))

                if len(str(codiClient2)) != 1:
                    print("\nError: El número diferenciador té que ser de un dígit.\n")
            
            for i in clients:
                if str(codiClient) + "-" + str(codiClient2) == i[0]:
                    flagCodiClient = False 
                    print("\nError: El codi ja existeix en la base de dades.")
                    print(i, "\n")

        nomClient = input("Introdueix el nom del client: ")

        clients.append((str(codiClient) + "-" + str(codiClient2) , nomClient.capitalize()))

        print("\nLlista de clients:", clients)

    elif optMenu.lower() == "c":
        producteMesCar = [0, "", 0, 0]

        for i in productes:
            if producteMesCar[2] < i[2]:
                producteMesCar = i
        
        print("\nEl producte més car es:", producteMesCar[1])
        print(producteMesCar)

    elif optMenu.lower() == "d":
        sumaPreu = 0

        for i in productes:
            sumaPreu += i[2] * i[3]
        
        print("\nAl magatzem tenim productes per valor de", f"{sumaPreu:.2f}","Euros.")

    elif optMenu.lower() == "e":
        ingresTotalVendes = 0

        for i in items:
            for j in productes:
                if i[1] == j[0]:
                    ingresTotalVendes += j[2] * i[2]
        
        print("\nL'ingrés total per vendes es de", f"{ingresTotalVendes:.2f}", "Euros.")

    elif optMenu.lower() == "f":
        producteMesIngressos = [0, "", 0, 0]
        ingressos = 0

        for i in productes:
            ventesProducte = 0

            for j in items:
                if i[0] == j[1]:
                    ventesProducte += i[2] * j[2]
            
            if ventesProducte > ingressos:
                producteMesIngressos = i
                ingressos = ventesProducte
        
        print("\nEl producte amb més ingressos es:", producteMesIngressos[1])
        print("Amb uns ingressos totals de", f"{ingressos:.2f}", "Euros.")
        print(producteMesIngressos)
        
    elif optMenu.lower() == "g":
        listaMayorComprador = []
        mayorComprador = 0

        for i in clients:
            precioCliente = 0

            for j in vendes:
                if i[0] == j[2]:
                    for k in items:
                        if j[0] == k[0]:
                            for l in productes:
                                if k[1] == l[0]:
                                    precioCliente += k[2] * l[2]

            if precioCliente > mayorComprador:
                mayorComprador = precioCliente
                listaMayorComprador = i
        
        print("\nEl mayor comprador es:", listaMayorComprador[1])
        print("Con una compra total de:", f"{mayorComprador:.2f}", "Euros.")                                   

    elif optMenu.lower() == "h":
        mes = 0
        contador = 0

        while mes < 1 or mes > 12:
            mes = int(input("Introdueix el mes (en número) del que vols saber el total de vendes: "))

            if mes < 1 or mes > 12:
                print("\nERROR: El valor introduit no está entre 1 i 12.")
        
        for i in vendes:
            if mes == i[1][1]:
                contador += 1
        
        print("\nEl mes de", llistaMesos[mes - 1], "hi han registrades", contador, "compres.")
                
    elif optMenu.lower() == "i":
        print("\nL'últim producte s'ha venut el dia", vendes[len(vendes) - 1][1][2], "del mes de", llistaMesos[vendes[len(vendes) - 1][1][1] - 1], "de l'any", vendes[len(vendes) - 1][1][0])

    elif optMenu.lower() == "j":
        flagSortir = True
        print("Fins aviat!")
    
    else:
        print("\nERROR: Opció errónea.\n")
