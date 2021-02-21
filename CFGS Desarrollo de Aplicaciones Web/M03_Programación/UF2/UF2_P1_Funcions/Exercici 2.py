def comuns(lista1, lista2):
    listaComuns = []
    for x in lista1:
        if x in lista2 and x not in listaComuns:
            listaComuns.append(x)
    return listaComuns

print(comuns([1,2,1],[2,3,2,4]))