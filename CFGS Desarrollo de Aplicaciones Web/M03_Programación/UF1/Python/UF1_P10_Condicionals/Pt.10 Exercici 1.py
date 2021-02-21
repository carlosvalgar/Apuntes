#Pràctica 10 Condicionals, Exercici 1:
print("Introduzca la longitud del ataúd (cm): ")
long=float(input())
print("Introduzca el ancho del ataúd (cm): ")
ancho=float(input())
print("Introduzca el tipo de madera del ataúd: (Pino, Caoba, Roble)")
tipo=input()
print("Introduzca cuantos accesorios quiere: ")
acc=int(input())
sup=long*ancho
prec=1000
if sup>=12000:
    prec+=500
if tipo=="Caoba":
    prec+=450
elif tipo=="Roble":
    prec+=150
prec+=(acc*50)
print("El precio de su ataúd es de ",prec," euros.")