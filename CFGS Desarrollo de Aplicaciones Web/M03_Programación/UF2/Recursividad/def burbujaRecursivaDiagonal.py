def burbujaRecursiva(lista, pasadas = 0, comparaciones = 0):
    try:
        
        if len(lista) != len(lista[0]):
            raise ValueError
        
        for listas in range(len(lista) -1):
            if len(lista[listas]) != len(lista[listas + 1]):
                raise ValueError
        
        
        if pasadas > len(lista) -1:
            return lista
        
        if comparaciones > len(lista) -2 -pasadas:
            return burbujaRecursiva(lista, pasadas + 1, 0)
        
        if lista[comparaciones][comparaciones] > lista[comparaciones + 1][comparaciones + 1]:
            lista[comparaciones][comparaciones], lista[comparaciones + 1][comparaciones + 1] = lista[comparaciones + 1][comparaciones + 1], lista[comparaciones][comparaciones]
            
        return burbujaRecursiva(lista, pasadas, comparaciones + 1)
    
    except ValueError:
        print("ERROR: La lista tiene que ser una matriz cuadrada.")

lista = [[99, 2, -1], [2, 15, -2], [1, 5, -7]]
print(burbujaRecursiva(lista))