# Diccionarios con los que vamos a trabajar.

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
    "39292939A": {"nombre": "Jose Luis", "telefono": "666232211"}
    }

cliente_compra = {
    "34343434A": ["AA32E", "AB37Z"], 
    "78787878A": ["CF13U", "KL11T"], 
    "39292939A": ["ST234"]
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

# Ex 1.- Listado de todos los menus con las cabeceras, ordenados por el numero de la opcion como se llega a ellos.

tupla_menu0 = ("Artículos", "Compras", "Clientes", "Salir del programa")
cabecera0 = ("Menú Principal")

tupla_menu01 = ("Listar artículos", "Busca artículo por ID", "Busca artículo por nombre", "Añade artículo", "Volver atrás")
cabecera01 = ("Menú de artículos")

tupla_menu011 = ("Ordenados por ID", "Ordenados por nombre", "Volver atrás")
cabecera011 = ("Menú como ordenar la lista de artículos")

tupla_menu03 = ("Buscar cliente", "Buscar los 5 clientes con más gasto", "Buscar los 5 clientes con más gasto en un mes en concreto", "Modificar datos de los clientes", "Volver atrás")
cabecera03 = ("Menú de clientes")

tupla_menu031 = ("Por nombre", "Por DNI", "Volver atrás")
cabecera031 = ("Menú como buscar los clientes")

tupla_menu0312 = ("Mostrar compras", "Mostrar compras detalladas", "Volver atrás")
cabeceraMenu0312 = ("Menú mostrar las compras del cliente")

tupla_menu034 = ("Modificar Nombre", "Modificar DNI", "Modificar Teléfono", "Volver atrás")
cabecera_menu034 = ("Menú modificar datos del cliente")

# Ex 1.- Le pasamos la tupla y la cabecera para que nos printe el menu con el formato que hemos definido aqui, como va con len(tupla) da igual los subapartados que tenga, en caso que sea una opcion no deseada abrimos un error.

def menus(tupla, *cabecera):
    while True:
        try:
            if len(cabecera) > 0:
                print(cabecera[0])
            
            for x in tupla:
                print("".ljust(4) + str(tupla.index(x) + 1) + ") " + str(x))
            
            opcion = int(input("\nElije una opcion:\n    > "))
            
            if opcion < 1 or opcion > len(tupla):
                raise Exception
            
        except ValueError:
            print("\nERROR: La opción debe ser un número entero.\n")
        
        except Exception:
            print("\nERROR: Opción inválida.\n")
        
        else:
            return opcion

# Ex 2.- Introducimos un nif, miramos si tiene 9 carácteres y despues si los 8 primeros son numeros y el ultimo es una letra, en caso negativo abrimos un error.

def peticion_nif():
    while True:
        try:
            nif = input("Introduzca el NIF de la persona que quieras buscar (8 números seguidos por 1 letra);\n    > ").upper()
            
            if len(nif) != 9:
                print("\nERROR: El NIF que has introducido no tiene 9 carácteres.\n")
                raise Exception
            
            letraNif = nif[8]
            numerosNif = nif.replace(letraNif, "")
            
            if numerosNif.isnumeric() == False:
                print("\nERROR: Los 8 primeros carácteres no son todos números.\n")
                raise Exception
            
            if letraNif.isalpha() == False:
                print("\nERROR: El último carácter no es una letra.\n")
                raise Exception
            
        except Exception:
            pass
        
        else:
            return nif

# Ex 3.- Pedimos el numero de teléfono, si se pone un valor que no sea un entero saltará un error, si tiene un número de carácteres diferente a 9 saltará un error, devuelve el número introducido en formato string.

def nuevo_telefono():
    while True:
        try:
            telefono = int(input("Introduzca su número de teléfono:\n    > "))
            
            if len(str(telefono)) != 9:
                print("\nERROR: Introduzca un número de 9 dígitos.\n")
                raise Exception
            
        except ValueError:
            print("\nERROR: Introduzca sólo números enteros.\n")
        
        except Exception:
            pass
        
        else:
            return str(telefono)

# Ex 4.- La funcion pide un numero con 8 digitos, si no es un numero entero saltara error, si no tiene 8 digitos saltara error, retorna este numero con una letra asignada.

def nuevo_nif():
    while True:
        try:
            dniSinLetra = int(input("Introduzca los 8 dígitos del DNI:\n    > "))
            
            if len(str(dniSinLetra)) != 8:
                print("\nERROR: El NIF introducido no tiene 8 dígitos.\n")
                raise Exception
            
            palabra = "TRWAGMYFPDXBNJZSQVHLCKE"
            dniConLetra = str(dniSinLetra) + palabra[dniSinLetra%23]
            
            if dniConLetra in dict_clients.keys():
                print("\nERROR: El NIF introducido ya existe en nuestra base de datos.\n")
                raise Exception
            
        except ValueError:
            print("\nERROR: Introduzca sólo números enteros.\n")
            
        except Exception:
            pass
        
        else:
            return dniConLetra

# Ex 5.- Le pedimos al usuario un numero para la ID, si dicho valor no es un numero salta error, si el numero añadido esta en el diccionario tambien salta error, si todo funciona devuelve ese id.

def nuevo_id_articulo():
    while True:
        try:
            idArticulo = int(input("Introduzca la nueva ID del artículo:\n    > "))
            
            if idArticulo in dict_articles.keys():
                print("\nERROR: La ID que intenta introducir ya esta en nuestra base de datos.\n")
                raise Exception
            
        except ValueError:
            print("\nERROR: Introduzca sólo números enteros.\n")
        
        except Exception:
            pass
        
        else:
            return idArticulo

# Ex 6.- Le pide al usuario la cantidad de stock del artículo, si es negativa o si pone otra cosa que no sea un entero saltara error, si todo va bien devuelve la cantidad de stock

def nuevo_stock_articulo():
    while True:
        try:
            stockArticulo = int(input("Introduzca la nueva cantidad de stock del artículo:\n    > "))
            
            if stockArticulo < 0:
                print("\nERROR: La cantidad de stock no puede ser negativa.\n")
                raise Exception
            
        except ValueError:
            print("\nERROR: Introduzca sólo números enteros.\n")
        
        except Exception:
            pass
        
        else:
            return stockArticulo

# Ex 7.- Le pedimos al usuario un numero y si es negativo o contiene letras salta un error, sino nos devuelve el precio del articulo. Lo he hecho con float en vez de int como pide el ejercicio porque le encuentro mas sentido que a un precio se le puedan añadir decimales.

def nuevo_precio_articulo():
    while True:
        try:
            precioArticulo = float(input("Introduzca el nuevo precio del artículo:\n    > "))
            
            if precioArticulo < 0:
                print("\nERROR: El valor de un producto no puede ser negativo.\n")
                raise Exception
        
        except ValueError:
            print("\nERROR: Introduzca sólo números enteros.\n")
        
        except Exception:
            pass
        
        else:
            return precioArticulo

# Ex 8.- Introducimos el nombre entonces iteramos el diccionario entero con todas las keys que tiene y las comparamos con el nombre introducido (la comparacion se hace en minuscula), si ya existe salta un error sino devuelve el producto introducido

def nuevo_nombre_articulo():
    while True:
        try:
            nombreArticulo = input("Introduzca el nuevo nombre del artículo:\n    > ")
            
            for x in dict_articles.keys():
                if nombreArticulo.lower() == dict_articles[x]["Nom_article"].lower():
                    print("\nERROR: El nombre que intenta introducir ya está en la base de datos.\n")
                    raise Exception
            
        except Exception:
            pass
        
        else: 
            return nombreArticulo

# Ex 9.- Esta funcion te pide como minimo dos parametros (cabecera y datos) y otros dos opcionales (pie y titulo) que estan inicializados en "". Si el valor de estos dos ultimos valores es diferente los printara en las posiciones adecuadas sino los obviara. La cabecera recorre la lista de items y por cada uno lo imprime con un espacio de 20, lo mismo para los datos. Despues tambien le da formato con * y = a las separaciones entre la cabecera, los datos y el pie.

def imprimir_datos(cabecera, datos, pie = "", titulo = ""):
    if titulo != "":
        print(str(titulo) + "\n")
    
    for x in cabecera:
        print(str(x).ljust(20), end = "")
    print()
    
    print("*" * 20 * len(cabecera))
    
    for x in datos:
        for y in x:
            print(str(y).ljust(20), end = "")
        print()
    
    if pie != "":
        print("=" * 20 * len(cabecera) + "\n" + str(pie))

# Ex 10.- La funcion mira si el parametro lista es una lista y si todos sus valores tienen la misma categoria sino salta error, tambien mira si el parametro orden es asc o desc sino salta error y si todo es correcto usa el metodo burbuja para ordenar lo de dentro de la lista

def ordenar_lista(lista, orden):
    try:
        if type(lista) is not list:
            print("\nERROR: El parámetro lista no es una lista de valores.\n")
            raise Exception
        
        for x in range(len(lista) -1):
            if type(lista[x]) != type(lista[x + 1]):
                print("\nERROR: La lista contiene diferentes tipos de datos.\n")
                raise Exception
        
        if orden.lower() != "asc" and orden.lower() != "desc":
            print("\nERROR: El valor del parámetro orden no es asc o desc.\n")
            raise Exception
        
        if orden.lower() == "asc":
            for x in range(len(lista) -1) :
                for y in range(len(lista) -1 - x):
                    if lista[y] > lista[y + 1]:
                        lista[y], lista[y + 1] = lista[y + 1], lista[y]
        
        elif orden.lower() == "desc":
            for x in range(len(lista) -1) :
                for y in range(len(lista) -1 - x):
                    if lista[y] < lista[y + 1]:
                        lista[y], lista[y + 1] = lista[y + 1], lista[y]
        
        return lista
        
    except Exception:
        pass

# 11.- Empezamos mirando si orden tiene el parametro asc o desc, despues colocamos todas las claves en una lista para poder intentar ordenarlas, si no tenemos parametro key miramos si es un diccionario de diccionarios si lo es saltamos error sino los ordenamos y devolvemos la lista ordenada, en caso de tener el parametro key, miramos que el diccionario sea un diccionario con diccionarios si no lo es saltamos error, si lo es los ordenamos y devolvemos el valor, ademas hay 2 checks mas  uno de TypeError por si se comparan valores diferentes (int y str por ejemplo) y KeyError por si el valor de key no existe en el diccionario que hemos colocado

def ordenar_diccionario_por_valor(diccionario, orden, key = ""):
    try:        
        if orden.lower() != "asc" and orden.lower() != "desc":
            print("\nERROR: El valor del parámetro orden no es asc o desc.\n")
            raise Exception
        
        keysDiccionario = list(diccionario.keys())
        
        if key == "":
            for x in diccionario.values():
                if type(x) == dict:
                    print("\nERROR: El diccionario que has puesto es un conjunto de diccionarios, por lo que tiene que tener el parámetro key.\n")
                    raise Exception
            
            if orden.lower() == "asc":
                for x in range(len(keysDiccionario) -1):
                    for y in range(len(keysDiccionario) -1 - x):
                        if diccionario[keysDiccionario[y]] > diccionario[keysDiccionario[y + 1]]:
                            keysDiccionario[y], keysDiccionario[y + 1] = keysDiccionario[y + 1], keysDiccionario[y]
                            
            elif orden.lower() == "desc":
                for x in range(len(keysDiccionario) -1):
                    for y in range(len(keysDiccionario) -1 - x):
                        if diccionario[keysDiccionario[y]] < diccionario[keysDiccionario[y + 1]]:
                            keysDiccionario[y], keysDiccionario[y + 1] = keysDiccionario[y + 1], keysDiccionario[y]
        
        else:
            for x in diccionario.values():
                if type(x) != dict:
                    print("\nERROR: El diccionario que has puesto no es un conjunto de diccionarios, por lo que no puede tener el parámetro key.\n")
                    raise Exception
            
            if orden.lower() == "asc":
                for x in range(len(keysDiccionario) -1):
                    for y in range(len(keysDiccionario) -1 - x):
                        if diccionario[keysDiccionario[y]][key] > diccionario[keysDiccionario[y + 1]][key]:
                            keysDiccionario[y], keysDiccionario[y + 1] = keysDiccionario[y + 1], keysDiccionario[y]
                            
            elif orden.lower() == "desc":
                for x in range(len(keysDiccionario) -1):
                    for y in range(len(keysDiccionario) -1 - x):
                        if diccionario[keysDiccionario[y]][key] < diccionario[keysDiccionario[y + 1]][key]:
                            keysDiccionario[y], keysDiccionario[y + 1] = keysDiccionario[y + 1], keysDiccionario[y]
        
        return keysDiccionario
    
    except TypeError:
        print("\nERROR: Los valores que estás comparando no son todos de la misma clase.\n")
    
    except KeyError:
        print("\nERROR: Esta clave no existe en el diccionario que has colocado.\n")
    
    except Exception:
        pass
