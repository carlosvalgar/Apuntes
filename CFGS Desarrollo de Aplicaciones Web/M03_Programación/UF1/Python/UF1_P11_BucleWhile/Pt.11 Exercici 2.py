#Pràctica 11 exercici 2:
num=int(input("Introduce números, introduce uno negativo para acabar de introducir valores: "))
numax=0
while num>=0:
    if numax<num:
        numax=num
    num=int(input("Sigue introduciendo números, introduce uno negativo para acabar de introducir valores: "))
print("El número más alto que has introducido ha sido:",numax,".")