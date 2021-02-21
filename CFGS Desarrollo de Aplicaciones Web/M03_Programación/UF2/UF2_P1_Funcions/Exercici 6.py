def producte(a, *b):
    resultat = a
    for x in b:
        resultat *= x
    return resultat

print(producte(1, 2, 3, 4, 5, 6, 7, 8, 9, 10))
print(producte(1, 2, 3, 4))
print(producte(1, 2))