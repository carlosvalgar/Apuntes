#Pràctica 13 Condicionals, Exercici 2:

num=int(input("Introduce un múltiplo de 10: "+"\n"))

while num%10!=0:
    print("\n"+"ERROR:",num,"no es múltiplo de 10."+"\n")
    num = int(input("Introduce un múltiplo de 10: "+"\n"))

num2=num
c=0

while True :
    if num2%10==0:
        num2/=10
        c+=1
    else:
        break

print("Entrada".ljust(15)+"Mensaje de Salida".center(22))
print(f"{num:<15}"+str(int(num2))+" por 10 elevado a "+str(c))
