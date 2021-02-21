import os
# Abrir el archivo
# Trabajar con el archivo, insertar, modificar datos, hacer consultas o eliminar datos
# Cerrar el archivo

# si tuviesemos diversas carpetas el path seria: os.path.join("carpeta1", "carpeta2"..."archivo.extension")

# r: escritura solo
# w: escribe solo y borra el contenido
# a: escribe solo y no borra el contenido (se coloca al final)
# r+: lee escribe y se coloca al principio
# w+: lee escribe y borra el contenido
# a+: lee escribe y escribe al final
# os.getcwd() añade a la lista el directorio de trabajo actual 

# fitxer = open(os.path.join("arxiu2.txt"), "r")
# contenido = fitxer.read()
# print(contenido)

# with open(os.path.join("arxiu2.txt"), "r") as contenido2:
#     lector = contenido2.read()
#     print(type(lector))
#     print(lector)
# read(), readline(), readlines()

# with open(os.path.join("arxiu3.txt"), "w") as fichero:
#     fichero.write("Buenos dias")
#     fichero.write("¿Que tal?")

# with open(os.path.join("arxiu4.txt"), "w") as fichero:
#     fichero.writelines(["Buenos dias\t", "¿Qué tal?\n", "JUAPETÓN"])