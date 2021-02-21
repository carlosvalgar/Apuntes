# Ejercicio de Listas
import random

print("Datos de Ventas")
print()

# Generación aleatoria de los valores en las listas

precio = []
empresa = []

for i in range(5):
    precio.append(random.random()*100)

for i in range(4):
    lista = []
    lista.append(random.randint(1, 20))
    lista.append(random.randint(1, 20))
    lista.append(random.randint(1, 20))
    lista.append(random.randint(1, 20))
    lista.append(random.randint(1, 20))

    empresa.append(lista)

# Cantidad total de ventas de cada artículo 

for i in range(len(precio)):
    cantidadTotal = 0

    for j in empresa:
        cantidadTotal += j[i]
    print("Cantidad total vendida del artículo", i + 1, "vendidos:", cantidadTotal)
print()

# Cantidad total de ventas en la sucursal 2

ventasSucursal2 = 0
print("Cantidad de artículos vendidos en la sucursal 2:", end=" ")

for i in range(len(precio)):
    ventasSucursal2 += empresa[1][i]

print(ventasSucursal2)
print()

# Cantidad de ventas del artículo 3 en la sucursal 1
 
print("Cantidad vendida del artículo 3 en la sucursal 1:", empresa[0][2])
print()

# Recaudación de cada sucursal, Recaudación total y Sucursal con mayor recaudación

recaudacionTotal = 0
mayorRecaudacion = 0
empresaMayorRecaudacion = 0

for i in range(len(empresa)):
    recaudacionSucursal = 0
    for j in range(len(precio)):
         recaudacionSucursal += empresa[i][j] * precio[j]

    if recaudacionSucursal > mayorRecaudacion:
        mayorRecaudacion = recaudacionSucursal
        empresaMayorRecaudacion = i + 1

    print("Recaudación total de la sucursal " + str(i + 1) + ":", f"{recaudacionSucursal:.2f}")
    recaudacionTotal += recaudacionSucursal
print()

print("La recaudación total de la empresa es:",f"{recaudacionTotal:.2f}")
print()

print("La empresa que mas ha recaudado ha sido la empresa", empresaMayorRecaudacion, ".")
print()

# print de los valores generados aleatoriamente

print(precio)
print(empresa)

