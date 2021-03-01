import os
import shutil
try:
    with open ("numeros.txt", "r", encoding = "UTF-8") as archivo:
        # .mode te dice como has abierto el archivo
        print(archivo.mode)
        # .name te dice como se llama el documento
        print(archivo.name)
        # .encoding te dice cual es la codificacion
        print(archivo.encoding)
        # .closed te dice si esta cerrado o no
        print(archivo.closed)
    print(archivo.closed)
except FileNotFoundError:
    print("El archivo no existe")
    
# Te dice donde esta la ruta que se esta utilizando
print(os.getcwd())
dirTrabajo = os.getcwd()

# Sirve para cambiar de directorio
os.chdir(os.sep+"Users"+os.sep+"Jutox")
os.chdir("C:\\Users\\Jutox")
print(os.getcwd())

# Te muestra lo que hay en un directorio
print(os.listdir("C:\\Users\\Jutox\\appdata"))
print(os.listdir("."))

# Te crea un directorio o una ruta de directorios
try:
    print(os.mkdir(dirTrabajo + os.sep + "Prueba 1"))
    print(os.makedirs(dirTrabajo + os.sep + "Prueba 2" + os.sep + "Prueba 3"))

except FileExistsError:
    print("Ya existe Prueba 1 o Prueba 2 o Prueba 3")

os.chdir(dirTrabajo)
print(os.getcwd())
# Te cambia el nombre
try:
    os.rename("numeros.txt", "cosacambiada.txt")

except FileNotFoundError:
    print("Ya lo has cambiado el nombre")

# Elimina un archivo

try:
    os.remove("cosacambiada.txt")
    
except FileNotFoundError:
    print("Ya lo has eliminado")

# Elimina un directorio

os.rmdir("Prueba 1")

# Elimina directorios

shutil.rmtree("Prueba 2")

# Se copia un archivo 

shutil.copy("copiaz.txt", "copiaz2.txt")

os.mkdir(os.getcwd() + os.sep + "cosas")
shutil.copy("copiaz.txt", "cosas" +  os.sep + "copiaz2.txt")

# Te copia un directorio y todas sus subcarpetas
shutil.copytree("cosas", "cosis")

# Te mueve un directorio
shutil.move("cosas", "cosis")