import os
import itertools

# Creamos este diccionario para poder pasar las variables a su tipo
dispatcher = {"int": int, "str": str, "float": float}
dictionaryKeys = ["id", "name", "firstLastname", "secondLastname", "direction", "postalCode", "population", "province"]
# Base de los ejercicios

# Usaremos esta funcion para añadir el número de cliente

def newNumCli():
    while True:
        try:
            newID = int(input("Insert a number for the new user's ID:\n    > "))
            return newID
        
        except ValueError:
            print("ERROR: Please, insert an integer.")

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

# para acceder al fichero se tiene que poner la ruta en una lista que el programa leerá

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
                varCliente = []
                for (i, j) in zip(varClienteType, varClienteValue):
                    varCliente.append(dispatcher[i](j))
                
                # Añadimos a la lista
                if client[0] == varCliente[1] and client[1] == varCliente[2] and client[2] == varCliente[3]:
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

# Ejemplos de como hacer funcionar readClientFile
# listaCliente = ["Pepe", "Perez", "Garcia"]
# listaPath = ["Archivos", "datos.txt"]
# print(readClientFile(listaPath, listaCliente))
# cosa = input("Escribe la ruta de tu archivo separada por espacios.\n    > ")
# cosa = cosa.split()
# print(readClientFile(cosa, listaCliente))


print(recoverData(["Archivos", "datos.txt"]))