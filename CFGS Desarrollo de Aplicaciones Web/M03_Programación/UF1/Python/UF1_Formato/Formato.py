# Ejercicio 1
n1 = "AW2"
n2 = "Població"
print("AW1".ljust(5) + "->" + "Programació".rjust(13))
print("{0:5}->{1:>13}".format("AWS1", "Elements"))
print(f"{n1:5}->{n2:>13}" + "\n")

n1 = 6
n2 = 56
n3 = 123
n4 = 4
print(str(n1).rjust(4))
print("{0:>4}".format(n2))
print(f"{n3:>4}")
print(f"{n4:>4}" + "\n")

n1 = 3
n2 = 13
n3 = 23
n4 = 4
print(str(n1).zfill(3))
print(str(n2).zfill(3))
print(str(n3).zfill(3))
print(str(n4).zfill(3) + "\n")


# Ejercicio 2
num1 = 10
num2 = 100
num3 = 1000
print(str(num1).rjust(4))
print("{0:>4}".format(num2))
print(f"{num3:>4}" + "\n")

print(str(num1).zfill(4))
print(str(num2).zfill(4))
print(str(num3) + "\n")


# Ejercicio 3
import math
num1 = math.pi
num2 = float(153.210)

print("{0:7.3f}".format(num1))
print(f"{num2:>7.3f}" + "\n")

print("{0:07.3f}".format(num1))
print(f"{num2:>7.3f}" + "\n")


# Ejercicio 4
hola = "Hola Mundo"
num1 = float(20.02)

print(f"{hola:>20}")
print(f"{hola:.3}")
print(f"{hola:^20.2}")

print("150".zfill(5))
print("7887".ljust(7))
print("{0:07.3f}".format(num1) + "\n")


# Extra
num1 = input("Entra el primer número: ")
num2 = input("Segundo número: ")
num3 = input("Tercer numero: ")
print("{0:>7} | {1:^10} | {2:20}".format(num1, num2, num3))
print(f"{num1:>7} | {num2:^10} | {num3:20}")
