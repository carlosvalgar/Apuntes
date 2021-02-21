#Pràctica 13 Condicionals, Exercici 1:
i=0
j=0

print("CALCULADORA")

while True:
    print("Menú principal"+"\n\n"+"1 - Sumar"+"\n"+"2 - Restar"+"\n"+"3 - Multiplicar"+"\n"+"4 - Dividir"+"\n"+
          "0 - Salir"+"\n")

    menu=int(input("Opció: "))

    if menu<0 or menu>4:
        print("\n"+"********************************************************")
        print("* ERROR: Elige una de las opciones del menú principal. *")
        print("********************************************************"+"\n")

    elif menu==1:
        i=int(input("Introduce el primer valor: "))
        j=int(input("Introduce el segundo valor: "))
        print("\n"+"La suma de",i,"y",j,"es igual a "+str(i+j)+"."+"\n")
        input("Pulsa cualquier tecla para volver al menú."+"\n")

    elif menu==2:
        i=int(input("Introduce el primer valor: "))
        j=int(input("Introduce el segundo valor: "))
        print("\n"+"La resta de",i,"y",j,"es igual a "+str(i-j)+"."+"\n")
        input("Pulsa cualquier tecla para volver al menú."+"\n")

    elif menu==3:
        i=int(input("Introduce el primer valor: "))
        j=int(input("Introduce el segundo valor: "))
        print("\n"+"La multiplicación de",i,"y",j,"es igual a "+str(i*j)+"."+"\n")
        input("Pulsa cualquier tecla para volver al menú."+"\n")

    elif menu==4:
        i = int(input("Introduce el primer valor: "))
        j = int(input("Introduce el segundo valor: "))

        while j==0:
            print("\n" + "*************************************")
            print("* ERROR: No se puede dividir por 0. *")
            print("*************************************" + "\n")

            i=int(input("Introduce el primer valor: "))
            j=int(input("Introduce el segundo valor: "))

        print("\n"+"La división de",i,"y",j,"es igual a "+f"{i/j:.2f}"+"."+"\n")
        input("Pulsa cualquier tecla para volver al menú."+"\n")

    elif menu==0:
        break

print("\n"+"Programa finalizado.")