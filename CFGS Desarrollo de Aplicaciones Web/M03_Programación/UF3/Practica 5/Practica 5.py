import os

# Ponemos la ruta de trabajo donde se encuentra el fichero

os.chdir(os.path.dirname(os.path.realpath(__file__)))

# Añadimos los diccionarios de la Práctica

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
    34343434: ["AA32E", "AB37Z"], 
    "78787878A": ["CF13U", "KL11T"],
    "39292939A": ["ST234"]
}

compra_article = {
    "AA32E": [3,4], 
    "AB37Z": [1,4], 
    "CF13U": [1,1,1,3], 
    "KL11T": [1,3,4],
    "ST234": [1,2,3]
}

compra_client = {
    "AA32E": "34343434A",
    "AB37Z": "34343434A",
    "CF13U": "78787878A",
    "KL11T": "78787878A",
    "ST234": "39292939A"
}

# Crea una carpeta archivos y dentro introduce los diccionarios en formato .txt

def guardar_diccionario(nombreFichero, diccionario):
    # Comprueba que exista el directorio Archivos, sino lo crea    
    if os.path.isdir(os.path.join("Archivos")) == False:
        print("S'ha creat la carpeta " + str(os.path.abspath("Archivos")) + ".")
        os.mkdir("Archivos")
    
    # Comprueba si existe el archivo que vamos a crear, sino manda un mensaje indicando su creación
    if os.path.isfile(os.path.join("Archivos", nombreFichero + ".txt")) == False:
        print("S'ha creat l'arxiu " + str(os.path.abspath(os.path.join("Archivos", nombreFichero + ".txt"))) + ".")
    
    # Creamos el archivo en formato w, porque si lo hacemos en a cada vez que añadamos el diccionario se repetiran valores
    with open(os.path.join("Archivos", nombreFichero + ".txt"), "w") as archivo:
        for item in diccionario.items():
            if type(item[0]) == str:
                archivo.write("key_type=str" + "*" + str(item[0]) + "*")
                
            elif type(item[0]) == int:
                archivo.write("key_type=int" + "*" + str(item[0]) + "*")
            
            if type(item[1]) == str:
                archivo.write("value_type=str" + "*" + str(item[1]) + "*")
            
            elif type(item[1]) == int:
                archivo.write("value_type=int" + "*" + str(item[1]) + "*")
            
            # Si es un diccionario repetimos el codigo principal
            elif type(item[1]) == dict:
                archivo.write("value_type=dict" + "*")
                
                for item2 in item[1].items():
                    if type(item2[0]) == str:
                        archivo.write("key_type=str" + "*" + str(item2[0]) + "*")
                        
                    elif type(item2[0]) == int:
                        archivo.write("key_type=int" + "*" + str(item2[0]) + "*")
                    
                    if type(item2[1]) == str:
                        archivo.write("value_type=str" + "*" + str(item2[1]) + "*")
                    
                    elif type(item2[1]) == int:
                        archivo.write("value_type=int" + "*" + str(item2[1]) + "*")
                
                    elif type(item2[1]) == list:
                        archivo.write("value_type=list" + "*")
                        
                        for i in item2[1]:
                            if type(i) == str:
                                archivo.write("value_type=str" + "*" + str(i) + "*")

                            elif type(i) == int:
                                archivo.write("value_type=int" + "*" + str(i) + "*")
                        
                        archivo.write("list*")
            
                    elif type(item2[1]) == tuple:
                        archivo.write("value_type=tuple" + "*")
                        
                        for i in item2[1]:
                            if type(i) == str:
                                archivo.write("value_type=str" + "*" + str(i) + "*")

                            elif type(i) == int:
                                archivo.write("value_type=int" + "*" + str(i) + "*")
                        
                        archivo.write("tuple*")
                        
                archivo.write("dict*")
            
            # Si es una lista escribimos la lista iterando sobre item[1]
            elif type(item[1]) == list:
                archivo.write("value_type=list" + "*")
                
                for i in item[1]:
                    if type(i) == str:
                        archivo.write("value_type=str" + "*" + str(i) + "*")

                    elif type(i) == int:
                        archivo.write("value_type=int" + "*" + str(i) + "*")
                
                archivo.write("list*")
            
            # Si es una tupla hacemos lo miso que con la lista
            elif type(item[1]) == tuple:
                archivo.write("value_type=tuple" + "*")
                
                for i in item[1]:
                    if type(i) == str:
                        archivo.write("value_type=str" + "*" + str(i) + "*")

                    elif type(i) == int:
                        archivo.write("value_type=int" + "*" + str(i) + "*")
                
                archivo.write("tuple*")

def cargar_diccionario(nombreFichero):
    with open(os.path.join("Archivos", nombreFichero), "r") as archivo:
        recover = archivo.readlines()[0].split("*")
        if "" in recover:
            recover.remove("")
        
        print(recover)
        
        dictRecover = {}
        dictlen = 0
        for i in range(len(recover)):
            if dictlen > 0:
                dictlen -= 1
                
            else:
                if recover[i] == "key_type=int":
                    key = int(recover[i + 1])
                    flagKey = False
                    
                elif recover[i] == "key_type=str":
                    key = str(recover[i + 1])
                    flagKey = False
                
                elif not flagKey:
                    if recover[i] == "value_type=int":
                        value = int(recover[i + 1])
                        dictRecover[key] = value
                        flagKey = True
                        
                    elif recover[i] == "value_type=str":
                        value = str(recover[i + 1])
                        dictRecover[key] = value
                        flagKey = True
                        
                    elif recover[i] == "value_type=list":
                        listaRecover = []
                        flagList = False
                        
                        for j in recover[i + 1:]:
                            if j == "list":
                                flagList = True
                                
                            if not flagList:
                                if j == "value_type=int":
                                    value = "int"
                                    
                                elif j == "value_type=str":
                                    value = "str"
                                    
                                else:
                                    if value == "int":
                                        listaRecover.append(int(j))
                                        
                                    elif value == "str":
                                        listaRecover.append(str(j))
                                        
                        value = listaRecover
                        dictRecover[key] = value
                        flagKey = True
                        
                    elif recover[i] == "value_type=tuple":
                        tupleRecover = []
                        flagTuple = False
                        
                        for j in recover[i + 1:]:
                            if j == "tuple":
                                flagTuple = True
                                
                            if not flagTuple:
                                if j == "value_type=int":
                                    value = "int"
                                    
                                elif j == "value_type=str":
                                    value = "str"
                                    
                                else:
                                    if value == "int":
                                        tupleRecover.append(int(j))
                                        
                                    elif value == "str":
                                        tupleRecover.append(str(j))
                                        
                        value = tuple(tupleRecover)
                        dictRecover[key] = value
                        flagKey = True
                    
                    elif recover[i] == "value_type=dict":
                        listDictRecover = []
                        dictRecover2 = {}
                        flagDict = False

                        for j in recover[i + 1:]:
                            if j == "dict":
                                flagDict = True
                            
                            if not flagDict:
                                listDictRecover.append(j)
                                
                        for j in range(len(listDictRecover)):
                            if listDictRecover[j] == "key_type=int":
                                key2 = int(listDictRecover[j + 1])
                                flagKey2 = False
                                
                            elif listDictRecover[j] == "key_type=str":
                                key2 = str(listDictRecover[j + 1])
                                flagKey2 = False
                            
                            elif not flagKey2:
                                if listDictRecover[j] == "value_type=int":
                                    value2 = int(listDictRecover[j + 1])
                                    dictRecover2[key2] = value2
                                    flagKey2 = True
                                    
                                elif listDictRecover[j] == "value_type=str":
                                    value2 = str(listDictRecover[j + 1])
                                    dictRecover2[key2] = value2
                                    flagKey2 = True
                                    
                        dictRecover[key] = dictRecover2
                        dictlen = len(dictRecover2)*4
                        flagKey = True
                    
        return dictRecover




# guardar_diccionario("dict_clients", dict_clients)

print(cargar_diccionario("dict_clients.txt"))

print(len({1:1, 2:2}))