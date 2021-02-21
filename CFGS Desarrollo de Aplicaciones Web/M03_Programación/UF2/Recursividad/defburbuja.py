def burbujaRecursiva(lista, pasadas, comparaciones):
    if pasadas > len(lista) -1:
        return lista
    
    if comparaciones > len(lista) -2 -pasadas:
        return burbujaRecursiva(lista, pasadas + 1, 0)
    
    if lista[comparaciones] > lista[comparaciones + 1]:
        lista[comparaciones], lista[comparaciones + 1] = lista[comparaciones + 1], lista[comparaciones]
        
    return burbujaRecursiva(lista, pasadas, comparaciones + 1)

lista = [1, -2, 2, 77, 4, -3]
print(burbujaRecursiva(lista, 0, 0))