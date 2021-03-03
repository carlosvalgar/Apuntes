import os
import shutil
os.chdir(os.path.dirname(os.path.realpath(__file__)))

# Ex. 1.-

def ex1():
    if os.path.isdir(os.path.join("Temp")) == False:
        print("S'ha creat la carpeta " + str(os.path.abspath("Temp")) + ".")
        os.mkdir("Temp")

    elif os.path.isdir(os.path.join("Temp")) == True:
        print("S'ha esborrat la carpeta " + str(os.path.abspath("Temp")) + ".")
        os.rmdir("Temp")

# Ex. 2.-

def ex2():
    try:
        splittedExtension = input("Introdueix els dos formats separats per un espai:\n    > ").split()

        for i in os.listdir("."):
            if i.endswith("." + str(splittedExtension[0])):
                print("Cabiando el nombre de " + str(i) + " a " + str(i.split(".")[0]) + "." + str(splittedExtension[1] + "."))
                os.rename(i, i.split(".")[0] + "." + str(splittedExtension[1]))
                
    except IndexError:
        print("ERROR: Introduce dos formatos separados por un espacio.")

# Ex. 3.-

def ex3():
    try:
        ficheroBuscar = input("Quin és el nom del fitxer a cercar?\n    > ")
        rutaBuscar = input("Escriu el nom d'una ruta a una carpeta\n    > ")

        if not os.path.isdir(rutaBuscar):
            raise FileNotFoundError
        
        flagArxiuTrobat = False
        
        for root, dirs, files in os.walk(rutaBuscar):
            if len(files) > 0:
                for i in files:
                    if i == ficheroBuscar:
                        print("S'ha trobat el fitxer a: " + str(root) + os.sep + str(i))
                        flagArxiuTrobat = True
        
        if flagArxiuTrobat == False:
            print("No s'ha trobat l'arxiu " + str(ficheroBuscar) + " a la carpeta o cap subcarpeta de " + str(rutaBuscar) + ".")
    
    except FileNotFoundError:
        print("ERROR: La ruta " + str(rutaBuscar) + " no existeix.")

# Ex- 4.-

def delNomFitxer(nomFitxer):
    try:
        os.remove(nomFitxer)
    
    except FileNotFoundError:
        print("ERROR: L'arxiu " + str(nomFitxer) + " no existeix en la carpeta actual.")

def propNomFitxer(nomFitxer):
    try:
        print("La mida del fitxer " + str(nomFitxer) + " es de " + str(os.path.getsize(nomFitxer)) + " bytes.")
    
    except FileNotFoundError:
        print("ERROR: L'arxiu " + str(nomFitxer) + " no existeix en la carpeta actual.")

delNomFitxer("1.txt")
propNomFitxer("1.txt")