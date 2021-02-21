#Pràctica 13 Condicionals, Exercici 3:
mnt=0
hrs=0

bact=int(input("Introduce el número de bacterias inicial: "))

while bact<10000000:
    bact+=bact
    mnt+=3

while mnt>60:
    mnt-=60
    hrs+=1

#Este if es para dejar más bonito el resultado, nada más.

if mnt<10:
    print("\n" + "*************************************************************")
    print("* La bacteria tarda", hrs, "hora y", mnt, "minutos en matar al huésped. *")
    print("*************************************************************")

else:
    print("\n"+"**************************************************************")
    print("* La bacteria tarda",hrs,"hora y",mnt,"minutos en matar al huésped. *")
    print("**************************************************************")