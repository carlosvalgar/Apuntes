# Forma abreviada de los array
"""
numeros = [i for i in range(100)]
print(numeros)

numeros = [-3, 2, 4, -7, 0, 1]
num = [i for i in range > 0] #este esta mal
print(num)

num = [[0 for i in range(6)] for i in range(4)]
print(num)
"""

#  TUPLAS

"""
# Las tuplas se representan (), y son invariables

a = 9
b = 8
c = -9
t = a, b, c

print(t)

#Si tienes una lista dentro de la tupla puedes modificar esta tupla

t1 = "Hola", "Adeu", 55, [1, 2, 3]
t1[3].append(4)
print(t1)

#Par desentuplar

x, y, z, w = t1

print(x)
print(y)
print(z)
print(w)

num2 = t1[3]
print(num2)

#funciones que se pueden usar con las tuplas: len(), count()

for i in t1:
    print(i)

#Podemos modificar si la lista es una tupla o el que
lista = list(t1)
print(lista)
lista = tuple(t1)
print(lista)

#Para pasarla a string tienes que recorrer la tupla o lista y sumarle los valores
streng = ""
for i in t1:
    streng += i
print(streng)

# se puede aplicar sumas yres tas en las tuplas y las listas
"""
"""
ficha1 = int(input("Valor 1 Ficha 1:")), int(input("Valor 2 Ficha 1:"))
ficha2 = int(input("Valor 1 Ficha 2:")), int(input("Valor 2 Ficha 2:"))

coinciden = False

for i in ficha1:
    if i in ficha2:
        print("Coinciden")
        coinciden = True

if coinciden == False:
    print("No coinciden")
"""
"""
#  DICCIONARIOS

futbolListas = {3: "Gerard Piqué", 10: "Messi"}
print(futbolListas)

#  Añadir valor a diccionario (Los printa aleatoriamente), la clave puede ser str, int, float, listas, tuplas... etc.
#  igual que las claves
futbolListas[15] = "Ansu Fati"
print(futbolListas)

#  Recorrer un diccionario (Tenemos, items, keys, values)

for i in futbolListas:
    print(i, "->", futbolListas[i])


#  .items() te dice primero la clave y despues su valor
for i, j in futbolListas.items():
    print(i, j)

#  .keys() te dice la clave
for i in futbolListas.keys():
    print(i, "->", futbolListas[i])

#  .values() de devuelve el valor de cada clave
for i in futbolListas.values():
    print(i)

print(futbolListas.items())
print(futbolListas.keys())
print(futbolListas.values())
print(futbolListas[10])
print(futbolListas.get(10))
futbolListas[9] = "Sergio Busquets"
futbolListas.setdefault(11, "Lenglet")
futbolListas.setdefault(12)
print(futbolListas)
"""