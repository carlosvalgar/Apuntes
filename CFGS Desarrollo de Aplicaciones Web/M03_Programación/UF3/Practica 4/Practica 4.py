import os
import shutil
os.chdir(os.path.dirname(os.path.realpath(__file__)))

# Ex. 1.-

# if os.path.isdir(os.path.join("Temp")) == False:
#     print("S'ha creat la carpeta " + str(os.path.abspath("Temp")) + ".")
#     os.mkdir("Temp")

# elif os.path.isdir(os.path.join("Temp")) == True:
#     print("S'ha esborrat la carpeta " + str(os.path.abspath("Temp")) + ".")
#     os.rmdir("Temp")

# Ex. 2.-

conversio = input("Introdueix els dos formats")

for i in os.listdir("."):
    if i[-4:] == ".txt":
        os.rename(i, i[0:-3] + str(conversio[4:]))