import teoria

flagMenuMain = False
while not flagMenuMain:
    accion = [ lambda a, b: teoria.suma(a, b), 
                lambda a, b: teoria.resta(a, b), 
                lambda a, b: teoria.multiplicacio(a, b), 
                lambda: teoria.exit() ]
    
    teoria.menu()
    opcion = int(input())

    
    if opcion == 4:
        accion[opcion -1]()
    
    else:
        a = int(input("algo"))
        b = int(input("algo2"))
        print(accion[opcion -1](a, b))
    