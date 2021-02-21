# Calcula la suma de los elementos de una lista de forma recursiva

def sumaLista(lista, pos):
    if pos == len(lista) -1:
        return lista[pos]
    return lista[pos] + sumaLista(lista, pos + 1)

def productoLista(lista):
    if len(lista) == 1:
        return lista[0]
    return lista[0] * productoLista(lista[1:])

def numerosUsuario(num):
    if num == 1:
        print(num)
    else:
        numerosUsuario(num -1)
        print(num)

def sumaPares(num):
    if num == 2:
        return 2
    elif num%2 == 1:
        return num -1 + sumaPares(num -3)
    else:
        return num + sumaPares(num -2)

def comparacioLlista(llista1, llista2):
    if len(llista1) == 1 or len(llista2) == 1:
        if llista1[0] == llista2[0]:
            return True
        else:
            return False
    if comparacioLlista(llista1[1:], llista2[1:]) == True:
        if llista1[0] == llista2[0]:
            return True
        else:
            return False
    elif comparacioLlista(llista1[1:], llista2[1:]) == False:
        return False

def numeroIndex(llista):
    if len(llista) == 1:
        if llista[-1] == llista.index(llista[-1]):
            return True
        else:
            return False
    if numeroIndex(llista[:-1]) == False:
        if llista[-1] == llista.index(llista[-1]):
            return True
        else:
            return False
    elif numeroIndex(llista[:-1]) == True:
        return True


llista = [6, 5, 4, 3, 2, 1]
print(numeroIndex(llista))