import os
# Feu un programa que escrigui a l'arxiu "parells.txt" els nombres parells de l'1 al 100, i en "senars.txt" els senars de l'1 al 100.

# for i in range(101):
#     if i%2 == 0:
#         with open(os.path.join("parells.txt"), "a") as fichero:
#             fichero.write(str(i) + "\n")
            
#     elif i%2 == 1:
#         with open(os.path.join("senars.txt"), "a") as fichero:
#             fichero.write(str(i) + "\n")

# with open(os.path.join("parells.txt"), "w") as fichero:
#     with open(os.path.join("senars.txt"), "w") as fichero2:
#         for i in range(101):
#             if i%2 == 0:
#                 fichero.write(str(i) + "\n")
#             elif i%2 == 1:
#                 fichero2.write(str(i) + "\n")

# with open(os.path.join("parells.txt"), "r") as fichero:
#     with open(os.path.join("senars.txt"), "r") as fichero2:
#         with open(os.path.join("0 a 100.txt"), "w") as fichero3:
#             for i in fichero.readlines():
#                 fichero3.write(i + fichero2.readline())

with open(os.path.join("parells.txt"), "r") as fichero:
    print(fichero.tell())
    fichero.read(13)
    print(fichero.tell())
    print(fichero.seek(10))
    print(fichero.read())
