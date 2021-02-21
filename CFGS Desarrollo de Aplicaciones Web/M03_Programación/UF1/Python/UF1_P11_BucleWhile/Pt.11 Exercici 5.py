#Pràctica 11 Exercici 5
x=int(input("Introduce un valor x: "))
n=int(input("Introduce un valor n: "))
c=0
exp=1
while c<n:
    exp*=x
    c+=1
print(str(x)+" elevado a "+str(n)+" es "+str(exp)+".")
#Este de aquí es con fórmula para asegurar que esta bien
#print(str(x)+" elevado a "+str(n)+" es "+str(x**n)+".")