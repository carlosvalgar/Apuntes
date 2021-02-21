import random
sortir = False
pacients = []
habitacionsLliures = 10

for i in range(5):
    print("*", end="")
print(" Benvingut a l'hospital! ", end="")
for i in range(4):
    print("*", end="")
    if i == 3:
        print("*")

print()

while not sortir:
    for i in range(5):
        print("*", end="")
    print(" Que vol fer? ", end="")
    for i in range(4):
        print("*", end="")
        if i == 3:
         print("*")

    print("1.- Ingressar pacients")
    print("2.- Consultar dades d'un pacient per número d'habitació")
    print("3.- Consultar dades d'un pacient per nom")
    print("4.- Llistar tots els pacients")
    print("5.- Donar d'alta un pacient")
    print("6.- Sortir")

    menu = int(input())
    print()

    if menu == 1:
        nom = input("Introdueix el nom del pacient: ")
        print()
        edat = int(input("Introdueix l'edat del pacient: "))
        print()
        flagHabitacio = False
        loopBreakHabitacio = 0

        while not flagHabitacio:
            habitacio = random.randint(1, habitacionsLliures)
            flagHabitacio = True
            for i in pacients:
                if habitacio == i[2]:
                    habitacio = random.randint(1, habitacionsLliures)
                    flagHabitacio = False
                    loopBreakHabitacio += 1
            if loopBreakHabitacio > 10000:
                break

        if flagHabitacio != False:                 
            print("Habitació:",habitacio)
            pacients.append([nom.capitalize(), edat, habitacio])
        
        elif flagHabitacio == False:
            print("Ho sentim, no queden habitacions.")
        
        print()

    if menu == 2:
        comprovacioHabitacio = int(input("Introdueix una habitació: "))
        print()
        flagCompHabitacio = False

        while comprovacioHabitacio > habitacionsLliures:
            print("ERROR: Només hi han", habitacionsLliures, "habitacions en aquest hospital.")
            print()
            comprovacioHabitacio = int(input("Introdueix una habitació: "))
            print()

        for i in pacients:
            if comprovacioHabitacio == i[2]:
                print(i)
                flagCompHabitacio = True

        if flagCompHabitacio == False:
            print("La habitació està buida.")

        print()

    if menu == 3:
        comprovacioNom = (input("Introdueix el nom d'un pacient: "))
        print()
        flagCompNom = False
        for i in pacients:
            if comprovacioNom.capitalize() == i[0]:
                print(i)
                flagCompNom = True
        
        if flagCompNom == False:
            print("No hi ha cap pacient amb aquest nom.")

        print()

    if menu == 4:
        if pacients == []:
            print("No hi ha pacients.")
        else:
            print(pacients)
        
        print()

    if menu == 5:
        alta = input("Introdueix el nom de la persona per donar-li de alta: ")
        print()
        flagAlta = False

        for i in pacients:
            if alta.capitalize() == i[0]:
                pacients.remove(i)
                flagAlta = True
        
        if flagAlta == True:
            print(alta.capitalize(),"ha sigut donat d'alta amb éxit.")
        
        elif flagAlta == False:
            print("ERROR: No hi ha cap", alta.capitalize(), "a l'hospital.")
        
        print()

    if menu == 6:
        sortir = True
        for i in range(5):
            print("*", end="")

        print(" Fins aviat! ", end="")
        
        for i in range(4):
            print("*", end="")
            
            if i == 3:
                print("*")
        
        print()
            