# Función con parámetros y con return
def suma1(a, *b):
    resultat = a
    for x in b:
        resultat += x

    return resultat

# Función con parámetros y sin return
def suma2(a, *b):
    resultat = a
    for x in b:
        resultat += x
        
    print(resultat)

# Función sin parámetros y con return
def suma3():
    a = int(input("Entra el valor 'a': "))
    b = int(input("Entra el valor 'b': "))
    resultat = a + b
    return resultat

# Función sin parámetros y sin return
def suma4():
    a = int(input("Entra el valor 'a': "))
    b = int(input("Entra el valor 'b': "))
    resultat = a + b
    print(resultat)

print(suma1(1,2,3,4,5))

# *b funcion arbitraria, crea una tupla **b funcion arbitraria, crea un diccionario

def doblar(num):
    resultado = num*2
    return resultado

doblar = lambda x: x*2
print(doblar(3))

impar = lambda x: x%2 == 1
print(impar(3))

lista = [-1, 2, 3, 4, 5, 6, -7, 8, -9, 10, 11]
listaNegativos = list(filter(lambda x: x < 0, lista))
print(listaNegativos)
