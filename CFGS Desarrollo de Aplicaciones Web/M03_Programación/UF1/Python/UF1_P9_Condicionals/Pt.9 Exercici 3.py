#Pràctica 9 Condicionals, Exercici 3:
print("Escribe la temperatura en grados centígrados:")
tempcent=float(input())
print("A que sistema de temperatura quieres pasarlo? (Kelvin, Fahrenheit, Rankine o Réaumur).")
tempsist=input()
if tempsist=="Kelvin":
    tempfin=tempcent+273.15
    id=" ºK"
elif tempsist=="Fahrenheit":
    tempfin=tempcent * 9 / 5 + 32
    id=" ºF"
elif tempsist=="Rankine":
    tempfin=9/5*(tempcent+273.15)
    id=" ºRankine"
elif tempsist=="Réaumur":
    tempfin=4/5*tempcent
    id=" ºRéaumur"
else:
    print("No has elegido un sistema válido.")

print("La temperatura es de "+str(tempfin)+id+".")