#Pràctica 11 Exercici 8:
num=int(input("Introduce un número. (Pon el -1 para acabar de introducir números) "))
numsum=0
c=0
while num!=-1:
    if num>=0 and num<=10:
        numsum+=num
        c+=1
    else:
        print(num)
    num=int(input("Introduce más números. (Pon el -1 para acabar de introducir números) "))
print("La media de la suma de los números introducidos entre 0 y 10 es de: "+str(numsum/c)+".")