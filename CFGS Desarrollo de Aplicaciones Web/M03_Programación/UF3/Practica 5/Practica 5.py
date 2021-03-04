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
                
            elif type(item[1]) == dict:
                archivo.write("value_type=dict" + "*")
                guardar_diccionario(nombreFichero, item[1])
                archivo.write("dict*")
            
            elif type(item[1]) == list:
                archivo.write("value_type=list" + "*")
                
                for i in item[1]:
                    if type(i) == str:
                        archivo.write("value_type=str" + "*" + str(i) + "*")

                    elif type(i) == int:
                        archivo.write("value_type=int" + "*" + str(i) + "*")
                
                archivo.write("list*")
            
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
        recover = archivo.readlines()[0].split("key_type=")
        if "" in recover:
            recover.remove("")
            
        print(recover)
        for i in recover:
            j = i.split("*value_type=")
            print(j)


# print(list(compra_client.items()))
# print(list(compra_article.items()))
# print(list(dict_clients.items()))

cargar_diccionario("cliente_compra.txt")
# guardar_diccionario("cliente_compra", cliente_compra)