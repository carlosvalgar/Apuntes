def burbujaRecursiva(lista, pasadas = 0, comparaciones = 0, numLista = 0):
    if numLista > len(lista) -1:
        return lista
    
    if pasadas > len(lista[numLista]) -1:
        return burbujaRecursiva(lista, 0, 0, numLista + 1)
    
    if comparaciones > len(lista[numLista]) -2 -pasadas:
        return burbujaRecursiva(lista, pasadas + 1, 0, numLista)
    
    if lista[numLista][comparaciones] > lista[numLista][comparaciones + 1]:
        lista[numLista][comparaciones], lista[numLista][comparaciones + 1] = lista[numLista][comparaciones + 1], lista[numLista][comparaciones]
        
    return burbujaRecursiva(lista, pasadas, comparaciones + 1, numLista)

lista = [[3, 1, 2], [8, 4, 5], [9, -1, 2]]
print(burbujaRecursiva(lista))