def suma (a, b):
    return a + b

def resta (a, b):
    return a - b

def multiplicacio (a, b):
    return a * b

def exit ():
    global flagMenuMain
    flagMenuMain = True
    return print("Hasta luegis")

def menu ():
    print("Calculadora\n    1.- Suma\n    2.- Resta\n    3.- Producto\n    4.- Salir")