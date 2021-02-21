# Variables complejas: listas, tuplas y diccionarios.
listaNumero = [1, 2, 3, 4, 5, 6.7, "Hola", "¿Que tal?", True, False]

# Esta lista implica que puedes poner en cada posición cada tipo de información y que en la posición 0, esta almacenado
# el 1, etc. La longitud de esta lista es de 4, pero las posiciones válidas son del 0 al 3.
direccion = ["Anna", "Carrer Balmes 5", "Barcelona", "88020"]
print(direccion[0])

# Para cambiar un elemento de la lista pones la variable con [] y dentro la posición de la variable.
direccion[2] = "Cornella"
print(direccion)

# Al poner la lista como directorio de la variable, la variable tomará los valores de dentro de la lista como sus valores.
for i in direccion:
    print(i.ljust(25), end="")
print("")

#  El range es como una variable que empieza (Valor 0) en el número que se indica, hasta el valor máximo (Max-1), con el
#  salto que queramos P.ej:(0,25,1).
for i in range(0, len(direccion)):
    print(i)
    print(direccion[i])

# Ejemplo de funcionamiento de una lista
listaDatos = []
cantNum=int(input("Entra la cantidad de números: "))

for i in range(cantNum):
    listaDatos.append(input("Entra un número: "))
print(listaDatos)

# La función .append sirve para añadir al final de la lista el valor a printar, por lo que lo ordena.
listaDatos = []
num = 0

while num != -1:
    num = int(input("Introduce un número: "))

    if num != -1:
        listaDatos.append(num)

print(listaDatos)

# La funcion max te enseña el valor mas elevado de la lista, min el menor, y len te devuelve la longitud de la lista
print(max(listaDatos))
print(min(listaDatos))
print(len(listaDatos))

# La funcion sorted te ordena la lista momentaneamente
print(sorted(listaDatos))

# La funcion .sort no te devuelve nada, sólo la ordena, por lo que la variable se ordena.
listaDatos.sort()
print(listaDatos)

listaDatos = []
num = int(input("¿Cuantos números vas a introducir? "))

for i in range(num):
    listaDatos.append(int(input("Introduce un número:")))
    
    if listaDatos[i] % 2 == 0:
        print(listaDatos[i])

# Printa los valores impares dentro de la lista
for i in listaDatos:  
    if i % 2 == 1:
        print(i)

# Printa los valores en las posiciones impares
for i in range(0, c, 2):  
    print(listaDatos[i])

# Este nos printa la lista de datos desde el final hasta el principio
print(listaDatos[::-1])

# Este nos printa la lista de datos desde el final hasta el principio pero cambia la lista de forma permanente
listaDatos.reverse()
print(listaDatos)

# Asi controlamos que la lista aleatoria siempre tenga 7 números
import random
primitiva = []

while len(primitiva) < 7:
    dice = random.randint(1, 49)

    if dice not in primitiva:
        primitiva.append(dice)

print(primitiva)

# Ejemplo 
usuarios = ["Marta", "David", "Elvira", "Juan", "Marcos"]
administradores = ["Juan", "Marta"]

# la funcion .pop() elimina el ultimo elemento de la lista (administradores.pop())
# la .remove tambien se puede usar como administradores.remove(administradores[0])

# Nos aseguramos que lo que queremos borrar está en la lista:
if "Juan" in administradores:
    administradores.remove("Juan")

administradores.append("Marcos")

for i in usuarios:
    print(i, end=" ")
    if i in administradores:
        print("(Admin)")
    else:
        print()


# Ejemplo 2
personas = []

for i in range(2):
    nombre = input("Nombre: ")
    direccion = input("Dirección: ")
    edad = input("Edad: ")

    personas.append([nombre, direccion, edad])

cambiodireccion = (input("De quién quieres cambiar la direccion?"))

for i in personas:
    if cambiodireccion in i:
        i[1] = input("Introduce la nueva dirección: ")

print(personas)
