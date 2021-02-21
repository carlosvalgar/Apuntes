#Pràctica 13 Condicionals, Exercici 5:
maxnum=int(input("Introduce hasta que valor quieres que vaya el sumatorio: "))
c=0
sumnum=0

while c<=maxnum:
    sumnum+=c
    c+=1

print("\n"+"La suma de todos los números hasta el",maxnum,"es de "+str(sumnum)+".")