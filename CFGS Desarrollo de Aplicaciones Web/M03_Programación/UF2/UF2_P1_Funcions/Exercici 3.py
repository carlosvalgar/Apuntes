def tresLinies():
    print("\n" * 2)

def nouLinies():
    for x in range(3):
        tresLinies()

def netejaPantalla():
    for x in range(2):
        tresLinies()
        nouLinies()
    print()

netejaPantalla() # Al moure la funció al principi del programa estem cridant una funció que encara no hem definit per tant no fará res.

def concatenaNVegades(c, n):
    print(c * n)

concatenaNVegades("Hola", 27)