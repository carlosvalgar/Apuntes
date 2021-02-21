#Pràctica 13 Condicionals, Exercici 4:
num=int(input("Introduce el número para saber todos sus múltiplos entre 1 y 1000: "))
c=2
mult=num

while mult<=1000 and mult>0:
    print(mult)
    mult=num*c
    c+=1