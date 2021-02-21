#Pràctica 14 Condicionals, Exercici 4:
num=int(input("Escribe un número para saber sus divisores: "))
print("Los divisores de",num,"són: ",end="")
for i in range(1,num+1):

    if num%i==0:
        print(i,"",end="")

print("\n"+"Hasta la vista!")

