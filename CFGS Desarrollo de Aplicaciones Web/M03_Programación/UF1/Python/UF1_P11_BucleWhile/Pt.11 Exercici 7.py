#Pràctica 11 Exercici 7
num=int(input("Introduce un número: "))
sumnum=0
c=0
while c<=num:
    if c%2==1:
        sumnum+=c
    c+=1
print("La suma de los impares hasta "+str(num)+" es de "+str(sumnum)+".")
