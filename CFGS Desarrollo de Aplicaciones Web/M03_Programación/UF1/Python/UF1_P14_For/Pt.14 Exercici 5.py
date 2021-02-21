#Pràctica 14 Condicionals, Exercici 5:
numin=int(input("Dime cuantos números vas a introducir: "))
c=0

for i in range(1,numin+1):
    numin2=int(input("Introduce el número "+str(i)+": "))

    if numin2<0:
        c+=1

print("Has introducido",c,"valores negativos.")