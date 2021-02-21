# Diccionarios

dict_articles = {
    4: {"Nom_article": "Monitor Packard Bell", "stock": 6, "preu": 152},
    3: {"Nom_article": "Monitor Acer", "stock": 12, "preu": 132},
    2: {"Nom_article": "Portatil Toshiba", "stock": 9, "preu": 642},
    1: {"Nom_article": "Portatil Acer", "stock": 10, "preu": 522}                 
    }
dict_compres = {
    "AA32E": {"Data": (2020, 11, 1), "total_compra": 284},
    "AB37Z": {"Data": (2020, 11, 1), "total_compra": 674},
    "CF13U": {"Data": (2020, 11, 1), "total_compra": 1698},
    "KL11T": {"Data": (2020, 11, 1), "total_compra": 806},
    "ST234": {"Data": (2019, 12, 7), "total_compra": 1296}
    }
dict_clients = {
    "34343434A": {"nombre": "Pedro", "telefono": "666994455"},
    "78787878A": {"nombre": "Luis", "telefono": "666765432"},
    "39292939A": {"nombre": "Jose Luis", "telefono": "666232211"},
    }

cliente_compra = {
    "34343434A": ["AA32E", "AB37Z"], 
    "78787878A": ["CF13U", "KL11T"], 
    "39292939A": ["ST234"],

    }
compra_article = {
    "AA32E": [3, 4],
    "AB37Z": [1, 4],
    "CF13U": [1, 1, 1, 3],
    "KL11T": [1, 3, 4],
    "ST234": [1, 2, 3]
    }
compra_client = {
    "AA32E": "34343434A", 
    "AB37Z": "34343434A", 
    "CF13U": "78787878A", 
    "KL11T": "78787878A",
    "ST234": "39292939A"
    }
c = 4

# Menú

print("\n¡Bienvenido a la tienda informática!")
flagMenu = False

while not flagMenu:
    print("\nMenú Principal:\n    1.- Artículos\n    2.- Compras\n    3.- Clientes\n    4.- Salir\n")
    
    opcionMenuPrincipal = int(input("Introduce el número de la opción que quieras acceder: "))

    if opcionMenuPrincipal == 1:
        while opcionMenuPrincipal == 1:
            print("\nMenú de artículos:\n    1.- Listar artículos\n    2.- Busca el artículo por ID\n    3.- Busca el artículo por nombre\n    4.- Añadir artículo\n    5.- Volver al menu principal\n")

            opcionMenuArticulos = int(input("Introduce el número de la opción que quieras acceder: "))

            if opcionMenuArticulos == 1:
                while opcionMenuArticulos == 1:
                    print("\n¿Como quieres mostrarlo?:\n    1.- Ordenados por ID\n    2.- Ordenados por Nombre\n    3.- Volver al anterior menú\n    4.- Volver al menú principal\n")

                    opcionOrdenArticulos = int(input("Introduce el número de la opción que quieras acceder: "))
                    
                    if opcionOrdenArticulos == 1:
                        print()
                        
                        # Ordena los objetos del diccionario por su key y los printa en orden
                        
                        for i in sorted(dict_articles.keys()):
                            print("ID: " + str(i).ljust(4) + "Nombre del artículo: " + str(dict_articles[i]["Nom_article"]).ljust(25) + "Stock: " + str(dict_articles[i]["stock"]).ljust(3) + "Precio: " + str(dict_articles[i]["preu"]).ljust(5))
                        
                        opcionMenuArticulos = 0
                        opcionMenuPrincipal = 0
                    
                    elif opcionOrdenArticulos == 2:
                        print()
                        
                        # Pasa el diccionario a un array
                        
                        listDictArticles = []

                        for i in dict_articles.values():
                            listDictArticles.append(i)
                        
                        # Ordena los diccionarios dentro del array por nombre

                        for i in range(len(listDictArticles) -1):
                            for j in range (len(listDictArticles) -1 -i):
                                if listDictArticles[j]["Nom_article"] > listDictArticles[j + 1]["Nom_article"]:
                                    listDictArticles[j], listDictArticles[j + 1] = listDictArticles[j + 1], listDictArticles[j]
                                    
                        # Printa los diccionarios en orden
                        
                        for i in listDictArticles:
                            print("Nombre del artículo: " + str(i["Nom_article"]).ljust(25) + "Stock: " + str(i["stock"]).ljust(3) + "Precio: " + str(i["preu"]).ljust(5))
                        
                        opcionMenuArticulos = 0
                        opcionMenuPrincipal = 0
                            
                    elif opcionOrdenArticulos == 3:
                        opcionMenuArticulos = 0

                    elif opcionOrdenArticulos == 4:
                        opcionMenuArticulos = 0
                        opcionMenuPrincipal = 0

                    else:
                        print("\nERROR: Has seleccionado una opción no válida.")

            elif opcionMenuArticulos == 2:
                while opcionMenuArticulos == 2:
                    
                    # Hacemos una lista con solo las claves del diccionario para ordenarlas
                    
                    listIdArticles = []

                    for i in dict_articles.keys():
                        listIdArticles.append(i)

                        for i in range(len(listIdArticles) -1):
                            for j in range (len(listIdArticles) -1 -i):
                                if listIdArticles[j] > listIdArticles[j + 1]:
                                    listIdArticles[j], listIdArticles[j + 1] = listIdArticles[j + 1], listIdArticles[j]
                                    
                    
                    # Hacemos la busqueda binaria sobre esta lista de ids ordenada, si la id existe la ponemos en el diccionario y la printamos
                    
                    idProducto = int(input("\nIntroduce la ID del producto a buscar: "))

                    minimo = 0
                    maximo = len(listIdArticles) -1
                    flagBusquedaBinaria = False

                    while not flagBusquedaBinaria:
                        media = (minimo + maximo) // 2

                        if maximo < minimo:
                            print("\nERROR: La ID que buscas no está registrado en nuestra base de datos.")
                            flagBusquedaBinaria = True
                            
                        elif idProducto == listIdArticles[media]:
                            print("\n    Nombre del producto: " + str(dict_articles[listIdArticles[media]]["Nom_article"]))
                            print("    Stock: " + str(dict_articles[listIdArticles[media]]["stock"]))
                            print("    Precio: " + str(dict_articles[listIdArticles[media]]["preu"]))
                            flagBusquedaBinaria = True
                        
                        else:
                            if idProducto < listIdArticles[media]:
                                maximo = media - 1
                            
                            elif idProducto > listIdArticles[media]:
                                minimo = media + 1
                                        
                    flagSeguirBuscando = False
                    
                    # Le preguntamos si quiere seguir buscando productos por ID, sino lo devolvemos al menú principal
                    
                    while not flagSeguirBuscando:
                        print("\n¿Quiere buscar otro producto?\n    1.- Sí\n    2.- No\n")   
                        seguirBuscando = int(input("Introduce el número de la opción que quieras acceder: "))
                        
                        if seguirBuscando == 1:
                            flagSeguirBuscando = True
                            
                        elif seguirBuscando == 2:
                            flagSeguirBuscando = True
                            opcionMenuArticulos = 0
                            opcionMenuPrincipal = 0
                            
                        else:
                            print("\nERROR: Has seleccionado una opción no válida.")

            elif opcionMenuArticulos == 3:
                while opcionMenuArticulos == 3:
                    
                    # Pasamos el diccionario a un array
                    
                    listDictArticles = []

                    for i in dict_articles.values():
                        listDictArticles.append(i)
                    
                    # Ordenamos el diccionario

                        for i in range(len(listDictArticles) -1):
                            for j in range(len(listDictArticles) -1 -i):
                                if listDictArticles[j]["Nom_article"] > listDictArticles[j + 1]["Nom_article"]:
                                    listDictArticles[j], listDictArticles[j + 1] = listDictArticles[j + 1], listDictArticles[j]
                    
                    # Hacemos la busqueda binaria sobre el valor de nombre de artículo y si esta lo printamos
                    
                    nombreProducto = input("\nIntroduce el nombre del producto a buscar: ").lower()

                    minimo = 0
                    maximo = len(listDictArticles) -1
                    flagBusquedaBinaria = False

                    while flagBusquedaBinaria == False:
                        media = (minimo + maximo) // 2

                        if maximo < minimo:
                            print("\nERROR: El producto que buscas no está registrado en nuestra base de datos.")
                            flagBusquedaBinaria = True
                            
                        elif nombreProducto == str(listDictArticles[media]["Nom_article"]).lower():
                            print("\n    Nombre del producto: " + str(listDictArticles[media]["Nom_article"]))
                            print("    Stock: " + str(listDictArticles[media]["stock"]))
                            print("    Precio: " + str(listDictArticles[media]["preu"]))
                            flagBusquedaBinaria = True
                        
                        else:
                            
                            if nombreProducto < (listDictArticles[media]["Nom_article"]).lower():
                                maximo = media - 1
                                
                            elif nombreProducto > (listDictArticles[media]["Nom_article"]).lower():
                                minimo = media + 1
                                        
                    flagSeguirBuscando = False
                    
                    # Le preguntamos si quiere seguir buscando productos por nombre, sino lo mandamos al menu principal
                    
                    while not flagSeguirBuscando:
                        print("\n¿Quiere buscar otro producto?\n    1.- Sí\n    2.- No\n")   
                        seguirBuscando = int(input("Introduce el número de la opción que quieras acceder: "))
                        
                        if seguirBuscando == 1:
                            flagSeguirBuscando = True
                            
                        elif seguirBuscando == 2:
                            flagSeguirBuscando = True
                            opcionMenuArticulos = 0
                            opcionMenuPrincipal = 0
                            
                        else:
                            print("\nERROR: Has seleccionado una opción no válida.")
                
            elif opcionMenuArticulos == 4:
                flagNuevoProducto = False
                while not flagNuevoProducto:
                    
                    # Hacemos un diccionario para introducir los datos para el nuevo producto
                    
                    nuevaEntrada = {}
                    nuevaEntrada["Nom_article"] = input("\nIntroduzca el nombre del artículo: ").capitalize()
                    nuevaEntrada["stock"] = input("Introduzca la cantidad en stock: ")
                    nuevaEntrada["preu"] = input("Introduzca el precio: ")
                    
                    flagInsertarProducto = False
                    
                    # Antes de introducirlos, le preguntamos si los datos son los que quiere introducir, por si se ha equivocado o le damos la oportunidad de volver a otro menú
                    
                    while not flagInsertarProducto:
                        print("\n¿Quiere insertar (Nombre del artículo: " + str(nuevaEntrada["Nom_article"]) + "; Stock: " + str(nuevaEntrada["stock"]) + "; Precio: " + str(nuevaEntrada["preu"]) + ") a la lista de productos?\n    1.- Sí\n    2.- No\n    3.- Volver al anterior menú\n    4.- Volver al menú principal\n")
                        insertarProducto = int(input("Introduce el número de la opción que quieras acceder: "))
                        
                        if insertarProducto == 1:
                            flagInsertarProducto = True
                            flagNuevoProducto = True
                            opcionMenuArticulos = 0
                            opcionMenuPrincipal = 0
                            
                            c += 1
                            dict_articles[c] = nuevaEntrada                            
                            print("\nProducto añadido al registro con ID: " + str(c))
                            
                        elif insertarProducto == 2:
                            flagInsertarProducto = True
                            
                        elif insertarProducto == 3:
                            flagInsertarProducto = True
                            flagNuevoProducto = True
                            opcionMenuArticulos = 0
                            
                        elif insertarProducto == 4:
                            flagInsertarProducto = True
                            flagNuevoProducto = True
                            opcionMenuArticulos = 0
                            opcionMenuPrincipal = 0
                                                        
                        else:
                            print("\nERROR: Has seleccionado una opción no válida.")  

            elif opcionMenuArticulos == 5:
                opcionMenuPrincipal = 0

            else:
                print("\nERROR: Has seleccionado una opción no válida.")

    elif opcionMenuPrincipal == 2:
        print("WIP 2")

    elif opcionMenuPrincipal == 3:
        while opcionMenuPrincipal == 3:
            print("\nMenú de Clientes:\n    1.- Buscar cliente\n    2.- Buscar los 5 clientes que más han gastado\n    3.- Buscar los 5 clientes con mayor gasto por fecha\n    4.- Volver al menú principal\n")

            opcionMenuClientes = int(input("Introduce el número de la opción que quieras acceder: "))

            if opcionMenuClientes == 1:
                while opcionMenuClientes == 1:
                    print("\nBusca el cliente por:\n    1.- Nombre\n    2.- DNI\n    3.- Volver al anterior menú\n    4.- Volver al menú principal\n")

                    opcionBusquedaClientes = int(input("Introduce el número de la opción que quieras acceder: "))
                    print()
                    
                    if opcionBusquedaClientes == 1:
                        while opcionBusquedaClientes == 1:
                            # Creamos una lista con todos los diccionarios de los clientes y la ordenamos por nombres
                            
                            listaClientesNombre = []
                            
                            for i, j in dict_clients.items():
                                listaClientesNombre.append([i, j])
                                
                            for i in range(len(listaClientesNombre) -1):
                                for j in range(len(listaClientesNombre) -1 -i):
                                    if listaClientesNombre[j][1]["nombre"] > listaClientesNombre[j + 1][1]["nombre"]:
                                        listaClientesNombre[j], listaClientesNombre[j + 1] = listaClientesNombre[j + 1], listaClientesNombre[j]
                                    
                            #Pedimos un nombre y usamos búsqueda binaria para encontrar si está el nombre del cliente
                            
                            busquedaNombreCliente = input("Introduce el nombre de la persona que quieres buscar: ").lower()
                            
                            minimo = 0
                            maximo = len(listaClientesNombre) -1
                            
                            flagBusquedaBinaria = False
                            
                            while not flagBusquedaBinaria:
                                media = (minimo + maximo) // 2

                                if maximo < minimo:
                                    print("\nERROR: El nombre de cliente que estas buscando no está registrado en nuestra base de datos.")
                                    flagBusquedaBinaria = True
                                    
                                elif busquedaNombreCliente == listaClientesNombre[media][1]["nombre"].lower():
                                    print("\nNombre del cliente: " + str(listaClientesNombre[media][1]["nombre"]))
                                    print("DNI del cliente: " + str(listaClientesNombre[media][0]))
                                    print("Teléfono del cliente: " + str(listaClientesNombre[media][1]["telefono"]))
                                    flagBusquedaBinaria = True
                                
                                else:
                                    if busquedaNombreCliente < listaClientesNombre[media][1]["nombre"].lower():
                                        maximo = media - 1
                                    
                                    elif busquedaNombreCliente > listaClientesNombre[media][1]["nombre"].lower():
                                        minimo = media + 1
                            
                            flagSeguirBuscando = False
                            
                            # Le preguntamos si quiere seguir buscando productos por ID, sino lo devolvemos al menú principal
                            
                            while not flagSeguirBuscando:
                                print("\n¿Quiere buscar otro cliente?\n    1.- Sí\n    2.- No\n")   
                                seguirBuscando = int(input("Introduce el número de la opción que quieras acceder: "))
                                
                                if seguirBuscando == 1:
                                    flagSeguirBuscando = True
                                    print()
                                    
                                elif seguirBuscando == 2:
                                    flagSeguirBuscando = True
                                    opcionBusquedaClientes = 0
                                    opcionMenuClientes = 0
                                    opcionMenuPrincipal = 0
                                
                                else:
                                    print("\nERROR: Has seleccionado una opción no válida.")
                            
                    elif opcionBusquedaClientes == 2:
                        while opcionBusquedaClientes == 2:
                            print("¿Como quieres enseñar la compra del cliente?\n    1.- Muestra compra\n    2.- Muestra compra detallada\n    3.- Volver al anterior menú\n    4.- Volver al menú principal\n")

                            opcionMuestraCompra = int(input("Introduce el número de la opción que quieras acceder: "))

                            if opcionMuestraCompra == 1:
                                while opcionMuestraCompra == 1:
                                    # Le pedimos el DNI y miramos si existe en la lista de clientes:
                                    print()
                                    
                                    dniCliente = input("Introduce el DNI del cliente que quieres saber su compra: ").upper()
                                    
                                    if dniCliente in dict_clients:
                                        # Si existe printamos el nombre el dni del cliente y la fecha y el total de cada compra que tenga registrado
                                        
                                        print("\n    Nombre del cliente: " + str(dict_clients[dniCliente]["nombre"]))
                                        print("    DNI del cliente: " + str(dniCliente))
                                        
                                        for i in range(len(cliente_compra[dniCliente])):
                                            print("\nCompra " + str(i + 1) + ":")
                                            print("    Fecha de compra: " + str(dict_compres[cliente_compra[dniCliente][i]]["Data"][2]) + " - " + str(dict_compres[cliente_compra[dniCliente][i]]["Data"][1]) + " - " + str(dict_compres[cliente_compra[dniCliente][i]]["Data"][0]))
                                            print("    Total de compra: " + str(dict_compres[cliente_compra[dniCliente][i]]["total_compra"]))
                                        
                                    else:
                                        print("\nERROR: No se ha encontrado el DNI que has escrito en nuestra base de datos.")
                                    
                                    # Creamos un bucle para preguntarle si quiere seguir buscando clientes por DNI
                    
                                    flagSeguirBuscando = False
                                    
                                    while not flagSeguirBuscando:
                                        print("\n¿Quieres buscar por otro DNI?\n    1.- Sí\n    2.- No\n")
                                        
                                        seguirBuscando = int(input("Introduce el número de la opción que quieras acceder: "))
                                        
                                        if seguirBuscando == 1:
                                            flagSeguirBuscando = True
                                            
                                        elif seguirBuscando == 2:
                                            opcionMuestraCompra = 0
                                            opcionBusquedaClientes = 0
                                            opcionMenuClientes = 0
                                            opcionMenuPrincipal = 0
                                            flagSeguirBuscando = True
                                            
                                        else:
                                            print("\nERROR: Has seleccionado una opción no válida.")
                                            
                            elif opcionMuestraCompra == 2:
                                    # Le pedimos el DNI y miramos si existe en la lista de clientes:
                                    print()
                                    
                                    dniCliente = input("Introduce el DNI del cliente que quieres saber su compra: ").upper()
                                    
                                    if dniCliente in dict_clients:
                                        # Si existe printamos el nombre y el dni del cliente, ademas de la fecha de la compra, los productos que ha comprado y el total de la compra
                                        print("\n    Nombre del cliente: " + str(dict_clients[dniCliente]["nombre"]))
                                        print("    DNI del cliente: " + str(dniCliente))
                                        
                                        for i in range(len(cliente_compra[dniCliente])):
                                            print("\nCompra " + str(i + 1) + ":")
                                            print("    Fecha de compra: " + str(dict_compres[cliente_compra[dniCliente][i]]["Data"][2]) + " - " + str(dict_compres[cliente_compra[dniCliente][i]]["Data"][1]) + " - " + str(dict_compres[cliente_compra[dniCliente][i]]["Data"][0]))
                                            print("    Productos comprados:")
                                            
                                            for j in range(len(compra_article[cliente_compra[dniCliente][i]])):
                                                print("        " + str(dict_articles[compra_article[cliente_compra[dniCliente][i]][j]]["Nom_article"]))
                                            print("    Total de compra: " + str(dict_compres[cliente_compra[dniCliente][i]]["total_compra"]))
                                        
                                    else:
                                        print("\nERROR: No se ha encontrado el DNI que has escrito en nuestra base de datos.")
                                    
                                    # Creamos un bucle para preguntarle si quiere seguir buscando clientes por DNI
                    
                                    flagSeguirBuscando = False
                                    
                                    while not flagSeguirBuscando:
                                        print("\n¿Quieres buscar por otro DNI?\n    1.- Sí\n    2.- No\n")
                                        
                                        seguirBuscando = int(input("Introduce el número de la opción que quieras acceder: "))
                                        
                                        if seguirBuscando == 1:
                                            flagSeguirBuscando = True
                                            
                                        elif seguirBuscando == 2:
                                            opcionMuestraCompra = 0
                                            opcionBusquedaClientes = 0
                                            opcionMenuClientes = 0
                                            opcionMenuPrincipal = 0
                                            flagSeguirBuscando = True
                                            
                                        else:
                                            print("\nERROR: Has seleccionado una opción no válida.")

                            elif opcionMuestraCompra == 3:
                                opcionBusquedaClientes = 0

                            elif opcionMuestraCompra == 4:
                                opcionBusquedaClientes = 0
                                opcionMenuClientes = 0
                                opcionMenuPrincipal = 0

                            else:
                                print("\nERROR: Has seleccionado una opción no válida.")

                    elif opcionBusquedaClientes == 3:
                        opcionMenuClientes = 0

                    elif opcionBusquedaClientes == 4:
                        opcionMenuClientes = 0
                        opcionMenuPrincipal = 0

                    else:
                        print("\nERROR: Has seleccionado una opción no válida.")

            elif opcionMenuClientes == 2:
                
                # Creamos un array auxiliar con el DNI y el total de dinero gastado
                
                clientesMayorGasto = []
                                
                for i, j in cliente_compra.items():
                    sum = 0
                    
                    for k in j:
                        sum += dict_compres[k]["total_compra"]
                    
                    clientesMayorGasto.append([i, sum])
                
                # Ordenamos la lista que hemos creado con el método burbuja para que nos salga de mayor a menor
                    
                for i in range(len(clientesMayorGasto) -1):
                    for j in range(len(clientesMayorGasto) -1 -i):
                        if clientesMayorGasto[j][1] < clientesMayorGasto[j + 1][1]:
                            clientesMayorGasto[j], clientesMayorGasto[j + 1] = clientesMayorGasto[j + 1], clientesMayorGasto[j]
                
                # Si la lista es menor que 5 printamos toda la lista, si no printamos solo los 5 primeros
                
                print("\nLos 5 clientes que más han gastado en esta tienda son:")
                
                if len(clientesMayorGasto) < 5:
                    c = 0
                    print("(Sólo hay", len(clientesMayorGasto), "clientes registrados).")
                    
                    for i in clientesMayorGasto:
                        c += 1
                        print("    " + str(c) + ".- " + str(dict_clients[i[0]]["nombre"]) + " con un gasto total de " +str(i[1]))
                
                elif len(clientesMayorGasto) >= 5:
                    for i in range(5):
                        print("    " + str(i + 1) + ".- " + str(dict_clients[clientesMayorGasto[i][0]]["nombre"]) + " con un gasto total de " +str(clientesMayorGasto[i][1]))
                
                opcionMenuClientes = 0
                opcionMenuPrincipal = 0
                
            elif opcionMenuClientes == 3:
                while opcionMenuClientes == 3:
                    diaMayorGasto = int(input("Introduce el día que quieres revisar: "))
                    mesMayorGasto = int(input("Introduce el mes que quieres revisar: "))
                    añoMayorGasto = int(input("Introduce el año que quieres revisar: "))
                    
                    fechaMayorGasto = (añoMayorGasto, mesMayorGasto, diaMayorGasto)
                    # Creamos un array auxiliar con el DNI y el total de dinero gastado
                    
                    clientesMayorGasto = []
                    
                    for i, j in cliente_compra.items():
                        sum = 0
                        
                        for k in j:
                            if dict_compres[k]["Data"] == fechaMayorGasto:
                                sum += dict_compres[k]["total_compra"]

                        if sum > 0:
                            clientesMayorGasto.append([i, sum])
                    
                    # Ordenamos la lista que hemos creado con el método burbuja para que nos salga de mayor a menor
                    
                    for i in range(len(clientesMayorGasto) -1):
                        for j in range(len(clientesMayorGasto) -1 -i):
                            if clientesMayorGasto[j][1] < clientesMayorGasto[j + 1][1]:
                                clientesMayorGasto[j], clientesMayorGasto[j + 1] = clientesMayorGasto[j + 1], clientesMayorGasto[j]
                    
                    # Si la lista es menor que 5 printamos toda la lista, si no printamos solo los 5 primeros
                    
                    print("\nLos 5 clientes que mas han comprado en la fecha: " + str(fechaMayorGasto[2]) + " - " + str(fechaMayorGasto[1]) + " - " + str(fechaMayorGasto[0]) + " son:" )
                    
                    if len(clientesMayorGasto) < 5:
                        c = 0
                        print("(Sólo hay", len(clientesMayorGasto), "clientes registrados).")
                        
                        for i in clientesMayorGasto:
                            c += 1
                            print("    " + str(c) + ".- " + str(dict_clients[i[0]]["nombre"]) + " con un gasto total de " +str(i[1]))
                    
                    elif len(clientesMayorGasto) >= 5:
                        for i in range(5):
                            print("    " + str(i + 1) + ".- " + str(dict_clients[clientesMayorGasto[i][0]]["nombre"]) + " con un gasto total de " +str(clientesMayorGasto[i][1]))
                    
                    elif len(clientesMayorGasto) == 0:
                        print("\nERROR: No tenemos registrados clientes para la fecha" + str(fechaMayorGasto[2]) + " - " + str(fechaMayorGasto[1]) + " - " + str(fechaMayorGasto[0]) + ".")
                    
                    # Creamos un bucle para preguntarle si quiere seguir buscando clientes por fecha
                    
                    flagSeguirBuscando = False
                    
                    while not flagSeguirBuscando:
                        print("\n¿Quieres buscar por otra fecha?\n    1.- Sí\n    2.- No\n")
                        
                        seguirBuscando = int(input("Introduce el número de la opción que quieras acceder: "))
                        
                        if seguirBuscando == 1:
                            flagSeguirBuscando = True
                            print()
                            
                        elif seguirBuscando == 2:
                            opcionMenuClientes = 0
                            opcionMenuPrincipal = 0
                            flagSeguirBuscando = True
                            
                        else:
                            print("\nERROR: Has seleccionado una opción no válida.")
                        
            elif opcionMenuClientes == 4:
                opcionMenuPrincipal = 0

            else:
                print("\nERROR: Has seleccionado una opción no válida.")

    elif opcionMenuPrincipal == 4:
        flagMenu = True
        print("\n¡Hasta pronto!\n")

    else:
        print("\nERROR: Has seleccionado una opción no válida.")
