#Pràctica 15 Aleatorios:
import random
kmrec=0
kmcaz=-20
sed=0
beb=0
cans=0
cant=random.randint(4,10)

print("¡Bienvenido a Botswana!"+"\n")
print("Has robado un elefante para salvarlo de las crueles matanzas, para conseguirlo tienes que atravesar el desierto "
      "del Kalahari, que tiene una distancia de 200 km."+"\n")
print("¡Los cazadores furtivos quieren recuperar su elefante y salen en tu persecución!")
print("Tendrás que sobrevivir al desierto y correr más que los cazadores Bosquimanos para poder llegar a salvo con el "
      "elefante que quieres rescatar."+"\n")

input("¡Pulsa Enter para comenzar!"+"\n")

while True:
    print("A. Beber de la cantimplora,")
    print("B. Velocidad moderada hacia adelante.")
    print("C. A toda velocidad hacia adelante.")
    print("D. Para y descansa.")
    print("E. Comprueba tu estado.")
    print("Q. Salir.")

    menu=input()

    if menu=="A" or menu=="a":
        if cant>0:
            cant-=1
            sed=0
            beb+=1
            print("\n"+"¡Un trago de gloriosa agua!"+"\n")
        else:
            print("\n"+"¡No te queda agua en la cantimplora!"+"\n"+"¡A ver si tienes suerte y encuentras un oasis!"+
                  "\n")

    elif menu=="B" or menu=="b":
        kmacc=random.randint(5,12)
        kmrec+=kmacc
        kmcaz+=random.randint(7,14)
        sed+=1
        cans+=1
        print("\n"+"Has recorrido",kmacc,"kms.")
        print("Llevas recorrido",kmrec,"kms."+"\n")

    elif menu=="C" or menu=="c":
        kmacc=random.randint(10,20)
        kmrec+=kmacc
        kmcaz+=random.randint(7,14)
        sed+=1
        cans+=random.randint(1,3)
        print("\n"+"Has recorrido",kmacc,"kms.")
        print("Llevas recorrido",kmrec,"kms."+"\n")

    elif menu=="D" or menu=="d":
        kmcaz+=random.randint(7,14)
        cans=0
        print("\n"+"¡El elefante se alegra de pasar la noche!"+"\n")

    elif menu=="E" or menu=="e":
        print("\n"+"Kilómetros recorridos:",kmrec)
        print("Veces que has bebido de la cantimplora:",beb)
        print("Tragos que te quedan:",cant)
        print("Los Bosquimanos están a",kmrec-kmcaz,"km detrás tuyo."+"\n")

    elif menu=="Q" or menu=="q":
        print("Game Over: Has abandonado a tu elefante para salir corriendo.")
        break

    if sed>4 and sed<= 6:
        print("Tienes sed"+"\n")
    elif sed>6:
        print("Game over: Has muerto de sed"+"\n")
        break

    if cans>5 and cans<=8:
        print("El elefante empieza a estar cansado"+"\n")
    elif cans>8:
        print("Game over: El elefante ha muerto"+"\n")
        break

    if kmrec-kmcaz<15 and kmrec-kmcaz>0:
        print("¡Los cazadores se acercan!"+"\n")
    elif kmrec-kmcaz<=0:
        print("Game over: Los cazadores te han matado"+"\n")
        break

    if kmrec>=200:
        print("Victoria: ¡Tu y el elefante habéis podido huir de los cazadores!"+"\n")
        break

    oasis=random.randint(1,20)

    if oasis==1:
        if menu=="B" or menu=="b" or menu=="C" or menu=="c":
            cant=10
            sed=0
            cans=0
            print("Has encontrado un oasis, aprovechas para descansar, beber agua y rellenar tu cantimplora."+"\n")


