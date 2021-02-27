import os

# Lista donde tenemos todos los values que vamos a usar en nuestros diccionarios

listaKeys = ["id", "nomCompania", "direccio", "ciutat"]

# Es una funcion que te genera los dos archivos base de la practica una para Cara.txt y otro para Dura.txt

def generacionArchivosCara():
    caraSL = [
        {"id": "ALFKI", "nomCompania": "Alfredo Futterkiste", "direccio": "Obere Str. 57", "ciutat": "Berlín"},
        {"id": "ANATR", "nomCompania": "Ana Trujillo Emparedados", "direccio": "Avda. de la Constitución 2222", "ciutat": "México D.F."},
        {"id": "BLONP", "nomCompania": "Blondel père et fils", "direccio": "24, place Kléber", "ciutat": "Estrasburgo"},
        {"id": "BOLID", "nomCompania": "Bolido Comidas preparadas", "direccio": "C/ Araquil, 67", "ciutat": "Madrid"}
    ]

    with open(os.path.join("files", "Cara.txt"), "w") as cara:
        print("Generating Cara.txt")
        
        for i in caraSL:
            cara.write(str(i["id"]) + "#" + str(i["nomCompania"]) + "#" + str(i["direccio"]) + "#" + str(i["ciutat"]) + "\n")

def generacionArchivosDura():    
    duraSL = [
        {"id": "ANTON", "nomCompania": "Antonio Moreno Taquería", "direccio": "Mataderos 2312", "ciutat": "México D.F."},
        {"id": "AROUT", "nomCompania": "Around the Horn", "direccio": "120 Hanover Sq.", "ciutat": "Londres"},
        {"id": "BURGS", "nomCompania": "Berglunds snabbköp", "direccio": "Berguvsvägen 8", "ciutat": "Lulea"},
        {"id": "BLAUS", "nomCompania": "Blauer See Delikatessen", "direccio": "Forsterstr. 57", "ciutat": "Manheim"},
        {"id": "BVBEV", "nomCompania": "BVs Beverages", "direccio": "Fauntleroy Circus", "ciutat": "Londres"}
    ]

    with open(os.path.join("files", "Dura.txt"), "w") as dura:
        print("Generating Dura.txt")
        
        for i in duraSL:
            dura.write(str(i["id"]) + "#" + str(i["nomCompania"]) + "#" + str(i["direccio"]) + "#" + str(i["ciutat"]) + "\n")

# Comprueba la existencia de los archivos, si no existen te genera los archivos, te devuelve true o false si los ha podido o no generar

def archivosBaseExist():
    try:
        if os.path.isfile(os.path.join("files", "Cara.txt")) == False:
            generacionArchivosCara()
            
        if os.path.isfile(os.path.join("files", "Dura.txt")) == False:
            generacionArchivosDura()
        
        return True
    
    except FileNotFoundError:
        print("ERROR: Please don't delete files directory.")
        
        return False

# Esta funcion nos recupera los datos de Cara.txt

def recoverCara():
    try:
        with open(os.path.join("files", "Cara.txt"), "r") as cara:
            listaArchivo = cara.readlines()
            
            # Hacemos una lista de listas con los valores recuperados
            
            listaCara = []
            for cliente in listaArchivo:
                varListaArchivo = cliente.split("\n")
                varListaArchivo = varListaArchivo[0].split("#")
                listaCara.append(varListaArchivo)
            
            # Comprobamos que los archivos que vamos a añadir tengan el mismo numero de valores que de claves
            
            for i in listaCara:
                if len(i) != len(listaKeys):
                    raise ValueError
            
            # Generamos el diccionario a partir de los valores recuperados
            
            listaCaraDict = []
            for cliente in listaCara:
                varDict = {}
                for i in range(len(cliente)):
                    varDict[listaKeys[i]] = cliente[i]
                listaCaraDict.append(varDict)
                
        return listaCaraDict
    
    except ValueError:
        print("ERROR: Different quantity of keys and values of your data.")
    
    except FileNotFoundError:
        print("ERROR: File files/cara.txt doesn't exist.")

# Esta funcion nos recupera los datos de Dura.txt

def recoverDura():
    try:
        with open(os.path.join("files", "Dura.txt"), "r") as dura:
            listaArchivo = dura.readlines()
            
            # Hacemos una lista de listas con los valores recuperados
            
            listaDura = []
            for cliente in listaArchivo:
                varListaArchivo = cliente.split("\n")
                varListaArchivo = varListaArchivo[0].split("#")
                listaDura.append(varListaArchivo)
            
            # Comprobamos que los archivos que vamos a añadir tengan el mismo numero de valores que de claves
            
            for i in listaDura:
                if len(i) != len(listaKeys):
                    raise ValueError
            
            # Generamos el diccionario a partir de los valores recuperados
            
            listaDuraDict = []
            for cliente in listaDura:
                varDict = {}
                for i in range(len(cliente)):
                    varDict[listaKeys[i]] = cliente[i]
                listaDuraDict.append(varDict)
                
        return listaDuraDict
    
    except ValueError:
        print("ERROR: Different quantity of keys and values of your data.")
    
    except FileNotFoundError:
        print("ERROR: File files/cara.txt doesn't exist.")

# Esta funcion te pide dos listas y las une en una sola

def fusionCaraDura(cara, dura):
    try:
        if type(cara) != list or type(dura) != list:
            raise ValueError
        
        listaCaradura = cara
        
        for client in dura:
            listaCaradura.append(client)
        
        return listaCaradura
    
    except ValueError:
        print("ERROR: The two values must be a list.")

# Esta funcion te ordena la lista generada por la funcion fusionCaraDura

def sortCaraDura(caradura):
    try:
        listaCaradura = sorted(caradura, key= lambda empresa: empresa["nomCompania"].lower())
        return listaCaradura
    
    except TypeError:
        print("ERROR: The function only works with a list of dictionaries.")
        
    except KeyError:
        print("ERROR: Your dictionary must have a key called nomCompania.")

# Esta funcion te genera Caradura.txt donde estaran guardados todos los clientes ordenados por nombre de compañia

def saveCaraDura(caraduraList):
    try:
        with open(os.path.join("files", "Caradura.txt"), "w") as caradura:
            print("Saving Caradura.txt")
            for client in caraduraList:
                caradura.write(str(client["id"]) + "#" + str(client["nomCompania"]) + "#" + str(client["direccio"]) + "#" + str(client["ciutat"]) + "\n")
                
    except FileNotFoundError:
        print("ERROR: Directory files doesn't exist.")
        
# Ejemplo de uso

archivosBaseExist()
saveCaraDura(sortCaraDura(fusionCaraDura(recoverCara(), recoverDura())))