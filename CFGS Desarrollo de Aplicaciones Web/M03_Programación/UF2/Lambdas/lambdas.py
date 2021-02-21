# Exercici 1

def doble(num):
    return num * 2

dobleLambda = lambda num : num * 2 
print(dobleLambda(5))

def invertir(cadena):
    return cadena[::-1]

invertirLambda = lambda cadena : cadena[::-1]
print(invertirLambda("Holi"))

def sumar(x, y):
    return x + y

sumarLambda = lambda x, y : x + y
print(sumarLambda(3, 4))

def impar(n):
    return n%2 != 0

imparLambda = lambda n : n%2 != 0
print(imparLambda(3))