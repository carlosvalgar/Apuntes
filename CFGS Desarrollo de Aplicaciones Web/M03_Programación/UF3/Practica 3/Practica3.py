import os
import shutil

# Con esto seleccionamos como ambito de trabajo la carpeta donde esta localiado el archivo que estamos usando.

os.chdir(os.path.dirname(os.path.realpath(__file__)))

# Ex. 1.-

# Te comprueba el directorio, si no existe te lo crea

# if os.path.isdir(os.path.join("exercicis", "Data", "operacions")) == False:
#     print("Generating directory ./exercicis/Data/operacions")
#     os.makedirs(os.path.join("exercicis", "Data", "operacions"))

# Te genera un archivo pacients.txt en el directorio exercicis\Data\operacions

# if os.path.isfile(os.path.join("exercicis", "Data", "operacions", "pacients.txt")) == False:
#     print("Generating file ./exercicis/Data/operacions/pacients.txt")
#     with open(os.path.join("exercicis", "Data", "operacions", "pacients.txt"), "w"): pass

# Ex. 2.-

# dictPacients = {"nom" : "Pep", "edat" : 42, "Diabetic" : True}

# if os.path.isfile(os.path.join("exercicis", "Data", "operacions", "pacients.txt")) == False:
#     if os.path.isdir(os.path.join("exercicis", "Data", "operacions")) == False:
#         print("Generating directory ./exercicis/Data/operacions")
#         os.makedirs(os.path.join("exercicis", "Data", "operacions"))

#     with open(os.path.join("exercicis", "Data", "operacions", "pacients.txt"), "a") as pacients:
#         for pacient in dictPacients.items():
#             for data in pacient:
#                 pacients.write(str(data) + "#")
#             pacients.write("\t")
#         pacients.write("\n")

# else:
#     with open(os.path.join("exercicis", "Data", "operacions", "pacients.txt"), "a") as pacients:
#         for pacient in dictPacients.items():
#             for data in pacient:
#                 pacients.write(str(data) + "#")
#             pacients.write("\t")
#         pacients.write("\n")

# Ex. 3.-

# try:
#     shutil.copytree("exercicis", "exercicis.bak")

# except FileNotFoundError:
#     print("ERROR: The directory you want to copy doesn't exist.")

# except FileExistsError:
#     print("ERROR: The directory you want to copy is already copied.")

# Ex. 4.-

# shutil.copy(os.path.join("exercicis", "Data", "operacions", "pacients.txt"), os.path.join("exercicis", "Data", "pacients.txt"))

# Ex. 5.-

# try:
#     os.remove(os.path.join("exercicis", "Data", "pacients.txt"))

# except FileNotFoundError:
#     print("ERROR: The file you want to remove doesn't exist.")