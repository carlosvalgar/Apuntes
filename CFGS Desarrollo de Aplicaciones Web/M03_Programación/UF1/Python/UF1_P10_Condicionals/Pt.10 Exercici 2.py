#Pràctica 10 Condicionals, Exercici 2:
ticket=6.60
tar=""
pers=int(input("¿Cuantas personas sois? "))
idavuelta=input("¿El viaje es de ida y vuelta? (Si/No) ")
if idavuelta=="Si":
    ticket*=2

if pers>=20:
    prec=2*ticket+(pers-2)*ticket*0.5
    tar="Se ha aplicado la tarifa de grupo."

else:
    jov = int(input("¿Cuantas personas jóvenes sois? "))
    may=pers-jov
    precjov=jov*ticket*0.85
    if jov>0:
        tar="Se ha aplicado la tarifa joven para "+str(jov)+" personas. "
    if idavuelta=="Si" and may>0:
        precmay=may*ticket*0.9
        tar+="Se ha aplicado la tarifa de ida y vuelta a "+str(may)+" personas."
    else:
        precmay=may*ticket
    prec=precmay+precjov

print("Se tienen que abonar "+f"{prec:.2f}"+" euros.")
if pers>=20 or jov>=1 or idavuelta=="Si":
    print(tar)
else:
    print("Se ha aplicado la tarifa normal.")