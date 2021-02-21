#Pràctica 13 Condicionals, Exercici 6:
intr=int(input("¿Cuántos números vas a introducir? "))
print("\n")

num=0
numsum=0

for i in range(intr):
    num=int(input("Introduce un número: "))
    numsum+=num

    if i==0:
        max=num
        min=num

    if max<num:
        max=num

    elif min>num:
        min=num

print("\n"+"El número más pequeño es",min)
print("\n"+"El número más grande es",max)
print("\n"+"La media de todos los números es:",numsum/intr)