#Pràctica 11 Exercici 4
num=int(input("Introduzca números, introduzca uno negativo para parar: "))
numsum=0
c=1
while num>=0:
    numsum+=num
    num=int(input("Siga introduciendo números, introduzca uno negativo para parar: "))
    if num<0:
        break
    c+=1
print("La suma de todos los números introducidos es:",numsum,". Has introducido:",c,"números.")