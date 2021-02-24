import os
import itertools

# Creamos este diccionario para poder pasar las variables a su tipo
dispatcher = {"int": int, "str": str, "float": float}
dictionaryKeys = ["id", "name", "firstLastname", "secondLastname", "direction", "postalCode", "population", "province"]

# Usaremos esta funcion para añadir id, nom, cognom1, cognom2, direccio  poblacio i provincia

def newClientData(dataType = ""):
    if dataType.lower() == "id": 
        while True:
            try:
                newInt = int(input("\nInsert a number for the new user's ID:\n    > "))
                return newInt
            
            except ValueError:
                print("\nERROR: Please, insert an integer.")
    
    elif dataType.lower() == "name":
        while True:
            try:
                newString = input("\nInsert a name for the new user's name:\n    > ")
                
                if newString.isalpha() == False:
                    raise ValueError
                
                return newString
            
            except ValueError:
                print("\nERROR: Insert a name with only letters.")
    
    elif dataType.lower() == "first lastname":
        while True:
            try:
                newString = input("\nInsert a first lastname for the new user's first lastname:\n    > ")
                
                if newString.isalpha() == False:
                    raise ValueError
                
                return newString
            
            except ValueError:
                print("\nERROR: Insert a lastname with only letters.")
    
    elif dataType.lower() == "second lastname":
        while True:
            try:
                newString = input("\nInsert a second lastname for the new user's second lastname:\n    > ")
                
                if newString.isalpha() == False:
                    raise ValueError
                
                return newString
            
            except ValueError:
                print("\nERROR: Insert a lastname with only letters.")
    
    elif dataType.lower() == "direction":
        while True:
            try:
                newString = input("\nInsert a direction for the new user's direction:\n    > ")
                
                return newString
            
            except ValueError:
                print("\nERROR: Unexpected error.")
    
    elif dataType.lower() == "postal code":
        while True:
            try:
                newString = input("\nInsert a postal code for the new user's postal code:\n    > ")
                
                if newString.isdigit() == False:
                    raise ValueError
                
                return newString
            
            except ValueError:
                print("\nERROR: Insert a postal code with only numbers.")
    
    elif dataType.lower() == "population":
        while True:
            try:
                newString = input("\nInsert a population for the new user's population:\n    > ")
                
                if newString.isalpha() == False:
                    raise ValueError
                
                return newString
            
            except ValueError:
                print("\nERROR: Insert a population with only letters.")
    
    elif dataType.lower() == "province":
        while True:
            try:
                newString = input("\nInsert a province for the new user's province:\n    > ")
                
                if newString.isalpha() == False:
                    raise ValueError
                
                return newString
            
            except ValueError:
                print("\nERROR: Insert a province with only letters.")
    
    else:
        print("\nERROR: Wrong value, try id, name, lastname, direction, postal code, population or province.\n")

# Esta funcion nos devuelve un cliente nuevo que hayamos definido

def newClient():
    varNewClient = {"id":newClientData("id"), "name":newClientData("name"), "firstLastname":newClientData("first lastname"), "secondLastname":newClientData("second lastname"), "direction":newClientData("direction"),"postalCode":newClientData("postal code"),"population":newClientData("population"),"province":newClientData("province")}
    
    print("Insert client:" + "\n    ID: " + str(varNewClient["id"]) + "\n    Name: " + str(varNewClient["name"]) + "\n    First lastname: " + str(varNewClient["firstLastname"]) + "\n    Second lastname: " + str(varNewClient["secondLastname"]) + "\n    Direction: " + str(varNewClient["direction"]) + "\n    Postal code: " + str(varNewClient["postalCode"]) + "\n    Population: " + str(varNewClient["population"]) + "\n    Province: " + str(varNewClient["province"]))
    
    flagPrint = False
    while not flagPrint:
        try:
            option = int(input("\n1.- Yes\n2.- No\n    > "))
            
            if option < 1 or option > 2:
                raise ValueError
            
            if option == 1:
                return varNewClient
            
            elif option == 2:
                return None
                
        except ValueError:
            print("ERROR: Insert a value of 1 or 2.")

# Esta funcion nos devuelve la una lista de diccionarios con todos los clientes

def recoverData(file):
    try:
        path = ""
        for i in file:
            path = os.path.join(path, i)
            
        with open(path, "r") as datos:
            clientes = datos.readlines()
            listaClientes = []
            # Vamos a usar un bucle para tratar los datos y convertirlos a algo que podamos trabajar
            for cliente in clientes:
                varCliente = cliente.split("\n")
                varCliente = varCliente[0].split("#")
                varClienteType = []
                varClienteValue = []
                
                # Hacemos dos listas, una con el tipo de valor y otra con los valores
                for i in varCliente:
                    if i == "str" or i == "int" or i == "float":
                        varClienteType.append(i)
                        
                    else:   
                        varClienteValue.append(i)
                        
                # Comprobamos que las dos listas sean iguales
                if len(varClienteType) != len(varClienteValue) and len(varClienteType) != len(dictionaryKeys):
                    raise ValueError
                
                # Iteramos sobre las dos listas a la vez para crear una con los valores correspondientes
                varCliente = {}
                for (i, j, k) in zip(varClienteType, varClienteValue, dictionaryKeys):
                    varCliente[k] = dispatcher[i](j)
                
                # Añadimos a la lista
                listaClientes.append(varCliente)
            return listaClientes
        
    except FileNotFoundError:
        print("ERROR: The file you're looking for doesn't exist.")
    
    except ValueError:
        print("ERROR: The data in your file has different number of data type and data values.")

# Esta funcion nos devuelve (si existe) el cliente con nombre y apellidos mencionados

def readClientFile(file, client):
    try:
        path = ""
        for i in file:
            path = os.path.join(path, i)
        
        with open(path, "r") as datos:
            clientes = datos.readlines()
            listaClientes = []
            # Vamos a usar un bucle para tratar los datos y convertirlos a algo que podamos trabajar
            for cliente in clientes:
                varCliente = cliente.split("\n")
                varCliente = varCliente[0].split("#")
                varClienteType = []
                varClienteValue = []
                
                # Hacemos dos listas, una con el tipo de valor y otra con los valores
                for i in varCliente:
                    if i == "str" or i == "int" or i == "float":
                        varClienteType.append(i)
                        
                    else:   
                        varClienteValue.append(i)
                        
                # Comprobamos que las dos listas sean iguales
                if len(varClienteType) != len(varClienteValue):
                    raise ValueError
                
                # Iteramos sobre las dos listas a la vez para crear una con los valores correspondientes
                varCliente = {}
                for (i, j, k) in zip(varClienteType, varClienteValue, dictionaryKeys):
                    varCliente[k] = dispatcher[i](j)
                
                # Añadimos a la lista si cumple con los requisitos
                if client[0] == varCliente["name"] and client[1] == varCliente["firstLastname"] and client[2] == varCliente["secondLastname"]:
                    listaClientes.append(varCliente)
            
            # Miramos si la longitud de la lista es 0, si lo es saltamos un error porque la lista esta vacia
            if len(listaClientes) == 0:
                raise SyntaxError
                
            return listaClientes
        
    except FileNotFoundError:
        print("ERROR: The file you're looking for doesn't exist.")
    
    except ValueError:
        print("ERROR: The data in your file has different number of data type and data values.")
        
    except SyntaxError:
        print("ERROR: Person with name " + str(client[0]) + " " + str(client[1]) + " " + str(client[2]) + " not found.") 

# Al introducir nuestra lista de diccionarios la devolvera ordenada

def sortClientsById(listClient):
    try:
        return sorted(listClient, key = lambda x: x["id"])
    
    except TypeError:
        print("ERROR: Try passing a valid client dictionary.")

# Ejemplo de como hacer funcionar readClientFile
    # listaCliente = ["Pepe", "Perez", "Garcia"]
    # listaPath = ["Archivos", "datos.txt"]
    # print(readClientFile(listaPath, listaCliente))

# Ejemplo de como hacer funcionar recoverData
    # print(recoverData(["Archivos", "datos.txt"]))

# Ejemplo de como hacer funcionar sortClientsById
    #print(sortClientsById(recoverData(["Archivos", "datos.txt"])))

