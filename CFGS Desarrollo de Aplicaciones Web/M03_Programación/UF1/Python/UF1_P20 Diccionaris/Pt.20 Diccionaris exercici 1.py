# Pt.20 Exercici 1:

frase = input("\nEscribe una frase para contar las palabras que hay: ").lower()
biblioteca = {}
listaPalabras = frase.split()

for i in listaPalabras:
    c = 0

    for j in range (len(listaPalabras)):
        if i == listaPalabras[j]:
            c += 1

    biblioteca[i] = c

print("\n", biblioteca, "\n")    
