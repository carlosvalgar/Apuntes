#Pràctica 9 Condicionals, Exercici 1:
print("Introduce el valor del PH del agua: ")
agua=int(input())
PH=0
if agua<7 and agua>0:
    PH="ácido"
elif agua==7:
    PH="neutro"
elif agua>7 and agua<14:
    PH="básico"
else:
    print("¡El PH del agua tiene que ser mayor que 0 y menor que 14!")
if PH=="ácido" or PH=="neutro" or PH=="básico":
    print("Nos encontramos en un medio "+PH+".")
