# Práctica 16 Tipo Examen
camlisa = 0
camcuadcort = 0
camcuadlarg = 0
boxer = 0
slip = 0
minifalda = 0
sirena = 0
cullote = 0
tangtrad = 0
tangfill = 0
segres = 0

while True:
    print("Escoje tu género:" + "\n" + "1.- Hombre" + "\n" + "2.- Mujer" + "\n" + "3.- Muestra el cesto" + "\n" +
          "4.- Borra el cesto" + "\n" + "5.- Ayuda de compra" + "\n" + "6.- Salir")

    opmenu = int(input())
    print("\n")

    while opmenu == 1:
        print("Escoje categoria:" + "\n" + "1.- Camisas" + "\n" + "2.- Calzoncillos" + "\n" + "3.- Volver atras")

        ophombre = int(input())
        print("\n")

        while ophombre == 1:
            if segres == 1 or segres == 2:
                segres = 0
                break

            print("Escoje Subcategoria:" + "\n" + "1.- Lisa" + "\n" + "2.- A cuadros" + "\n" + "3.- Volver atrás")

            opcamisa = int(input())
            print("\n")

            while opcamisa == 1:
                print("¿Cuántas camisas lisas quiere?")
                camlisa = int(input())

                print("\n" + "Se han añadido", camlisa, "camisas listas a la cesta." + "\n" + "\n" +
                      "¿Que quiere hacer?" + "\n" + "1.- Seguir comprando" + "\n" + "2.- Resetear el pedido")

                segres = int(input())
                print("\n")

                if segres == 1:
                    break

                elif segres == 2:
                    camlisa = 0
                    break

            while opcamisa == 2:
                if segres == 1 or segres == 2:
                    break

                print("Escoje camisa a cuadros:" + "\n" + "1.- Manga corta" + "\n" + "2.- Manga larga" + "\n" +
                      "3.- Volver atrás")

                opcamcuadros = int(input())
                print("\n")

                while opcamcuadros == 1:
                    print("¿Cuántas camisas a cuadros de manga corta quiere?")
                    camcuadcort = int(input())

                    print("Se han añadido", camcuadcort, "camisas a cuadros de manga corta a la cesta." + "\n" + "\n" +
                          "¿Que quiere hacer?" + "\n" + "1.- Seguir comprando" + "\n" + "2.- Resetear el pedido")

                    segres = int(input())
                    print("\n")

                    if segres == 1:
                        break

                    elif segres == 2:
                        camcuadcort = 0
                        break

                while opcamcuadros == 2:
                    camcuadlarg = int(input("¿Cuántas camisas a cuadros de manga larga quiere?"+"\n"))

                    print("Se han añadido", camcuadlarg, "camisas a cuadros de manga larga a la cesta.")
                    print("\n")
                    print("¿Que quiere hacer?")
                    print("1.- Seguir comprando")
                    print("2.- Resetear el pedido")

                    segres = int(input())

                    print("\n")

                    if segres == 1:
                        break

                    elif segres == 2:
                        camcuadlarg = 0
                        break

                if opcamcuadros == 3:
                    break

            if opcamisa == 3:
                break

        while ophombre == 2:

            if segres == 1 or segres == 2:
                segres = 0
                break

            print("Escoje Subcategoria:")
            print("1.- Boxer")
            print("2.- Slip")
            print("3.- Volver atrás")

            opcalzoncillos = int(input())

            print("\n")

            while opcalzoncillos == 1:
                boxer = int(input("¿Cuántos boxers quiere?"+"\n"))

                print("Se han añadido", boxer, "boxers a la cesta.")
                print("\n")
                print("¿Que quiere hacer?")
                print("1.- Seguir comprando")
                print("2.- Resetear el pedido")

                segres = int(input())

                print("\n")

                if segres == 1:
                    break

                elif segres == 2:
                    boxer = 0
                    break

            while opcalzoncillos == 2:
                slip = int(input("¿Cuántos slips quiere?"+"\n"))

                print("Se han añadido", slip, "slips a la cesta.")
                print("\n")
                print("¿Que quiere hacer?")
                print("1.- Seguir comprando")
                print("2.- Resetear el pedido")

                segres = int(input())

                print("\n")

                if segres == 1:
                    break

                elif segres == 2:
                    slip = 0
                    break

            if opcalzoncillos == 3:
                break

        if ophombre == 3:
            break

    while opmenu == 2:
        print("Escoje categoria:")
        print("1.- Falda")
        print("2.- Bragas")
        print("3.- Volver atras")

        opmujer = int(input())

        print("\n")

        while opmujer == 1:

            if segres == 1 or segres == 2:
                segres = 0
                break

            print("Escoje Subcategoria:")
            print("1.- Minifalda")
            print("2.- Sirena")
            print("3.- Volver atrás")

            opfalda = int(input())

            print("\n")

            while opfalda == 1:
                minifalda = int(input("¿Cuántas minifaldas quiere?"+"\n"))

                print("Se han añadido", minifalda, "minifaldas a la cesta.")
                print("\n")
                print("¿Que quiere hacer?")
                print("1.- Seguir comprando")
                print("2.- Resetear el pedido")

                segres = int(input())

                print("\n")

                if segres == 1:
                    break

                elif segres == 2:
                    minifalda = 0
                    break

            while opfalda == 2:
                sirena = int(input("¿Cuántas sirenas quiere?"+"\n"))

                print("Se han añadido", sirena, "sirenas a la cesta.")
                print("\n")
                print("¿Que quiere hacer?")
                print("1.- Seguir comprando")
                print("2.- Resetear el pedido")

                segres = int(input())

                print("\n")

                if segres == 1:
                    break

                elif segres == 2:
                    sirena = 0
                    break

            if opfalda == 3:
                break

        while opmujer == 2:

            if segres == 1 or segres == 2:
                segres = 0
                break

            print("Escoje Subcategoria:")
            print("1.- Cullote")
            print("2.- Tanga")
            print("3.- Volver atrás")

            opbraga = int(input())

            print("\n")

            while opbraga == 1:
                cullote = int(input("¿Cuántas cullotes quiere?"+"\n"))

                print("Se han añadido", cullote, "cullotes a la cesta.")
                print("\n")
                print("¿Que quiere hacer?")
                print("1.- Seguir comprando")
                print("2.- Resetear el pedido")

                segres = int(input())

                print("\n")

                if segres == 1:
                    break

                elif segres == 2:
                    cullote = 0
                    break

            while opbraga == 2:

                if segres == 1 or segres == 2:
                    break

                print("Escoje Tanga:")
                print("1.- Tradicional")
                print("2.- Fill")
                print("3.- Volver atrás")

                optanga = int(input())

                print("\n")

                while optanga == 1:
                    tangtrad = int(input("¿Cuántos tangas tradicionales quiere?"+"\n"))

                    print("Se han añadido", tangtrad, "tangas tradicionales a la cesta.")
                    print("\n")
                    print("¿Que quiere hacer?")
                    print("1.- Seguir comprando")
                    print("2.- Resetear el pedido")

                    segres = int(input())

                    print("\n")

                    if segres == 1:
                        break

                    elif segres == 2:
                        tangtrad = 0
                        break

                while optanga == 2:
                    tangfill = int(input("¿Cuántos tangas fill quiere?"+"\n"))

                    print("Se han añadido", tangfill, "tangas fill a la cesta.")
                    print("\n")
                    print("¿Que quiere hacer?")
                    print("1.- Seguir comprando")
                    print("2.- Resetear el pedido")

                    segres = int(input())

                    print("\n")

                    if segres == 1:
                        break

                    elif segres == 2:
                        tangfill = 0
                        break

                if optanga == 3:
                    break

            if opbraga == 3:
                break

        if opmujer == 3:
            break

    if opmenu == 3:
        print("Cesta:")
        print("\n")

        if camlisa > 0:
            print(camlisa, "Camisas lisas")
            print("\n")

        if camcuadcort > 0:
            print(camcuadcort, "Camisas a cuadros con manga corta")
            print("\n")

        if camcuadlarg > 0:
            print(camcuadlarg, "Camisas a cuadros con manga larga")
            print("\n")

        if boxer > 0:
            print(boxer, "Calzoncillos boxer")
            print("\n")

        if slip > 0:
            print(slip, "Calzoncillos slip")
            print("\n")

        if minifalda > 0:
            print(minifalda, "Minifaldas")
            print("\n")

        if sirena > 0:
            print(sirena, "Sirenas")
            print("\n")

        if cullote > 0:
            print(cullote, "Cullotes")
            print("\n")

        if tangtrad > 0:
            print(tangtrad, "Tangas tradicionales")
            print("\n")

        if tangfill > 0:
            print(tangfill, "Tangas fill")
            print("\n")

        print("*"*25)

        input("Pulsa ENTER para continuar")

    elif opmenu == 4:
        camlisa = 0
        camcuadcort = 0
        camcuadlarg = 0
        boxer = 0
        slip = 0
        minifalda = 0
        sirena = 0
        cullote = 0
        tangtrad = 0
        tangfill = 0

        print("Se ha eliminado el pedido"+"\n")
        print("*"*25)
        input("Pulsa ENTER para continuar")

    elif opmenu == 5:
        print("Género".ljust(25) + "Categoria".ljust(25) + "Subcategoria".ljust(25) + "Opciones".ljust(25) + "\n" + "-"
              * 100 + "\n" + "Hombre".ljust(25) + "Camisas".ljust(25) + "Lisa".ljust(25) + "\n" + "".ljust(50) +
              "Cuadros".ljust(25) + "Manga corta".ljust(25) + "\n" + "".ljust(75) + "Manga larga".ljust(25) + "\n" +
              "\n" + "".ljust(25) + "Calzoncillos".ljust(25) + "Boxer".ljust(25) + "\n" + "".ljust(50) +
              "Slip".ljust(25) + "\n" + "\n" + "-" * 100 + "\n" + "Mujer".ljust(25) + "Faldas".ljust(25) + "Minifalda"
              .ljust(25) + "\n" + "".ljust(50) + "Sirena".ljust(25) + "\n" + "\n" + "".ljust(25) + "Bragas".ljust(25) +
              "Cullote".ljust(25) + "\n" + "".ljust(50) + "Tanga".ljust(25) + "Tradicional".ljust(25) + "\n" + ""
              .ljust(75) + "Fill".ljust(25))

    elif opmenu == 6:
        break
