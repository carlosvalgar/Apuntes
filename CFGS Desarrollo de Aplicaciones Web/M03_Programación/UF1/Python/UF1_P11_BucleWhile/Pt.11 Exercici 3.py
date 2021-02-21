#Pràctica 11 exercici 3:
num=int(input("Introduzca números, introduzca uno negativo para parar: "))
numsum=0
while num>=0:
    numsum+=num
    num=int(input("Siga introduciendo números, introduzca uno negativo para parar: "))
print("La suma de todos los números introducidos es:",numsum,".")