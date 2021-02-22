import os
import itertools

# Creamos este diccionario para poder pasar las variables a su tipo
dispatcher = {"int": int, "str": str, "float": float}

# Base de los ejercicios

def recuperarDatos():
    try:
        with open(os.path.join("Archivos", "datos.txt"), "r") as datos:
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

listaCliente = ["Pepe", "Perez", "Garcia"]
listaPath = ["Archivos", "datos.txt"]
print(readClientFile(listaPath, listaCliente))


