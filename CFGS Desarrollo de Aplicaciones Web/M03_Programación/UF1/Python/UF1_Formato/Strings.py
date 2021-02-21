frase="CaStAnYaDa"

print(frase.title())
print(frase.swapcase())
print(frase.lower())
print(frase.upper())

# isalnum devuelve True cuando te da numeros y letras, no espacios ni nada más.
print(frase.isalnum())

# isalpha devuelve True cuando sólo tenga letras, no espacios ni nada más.
print(frase.isalpha())

# isdigit devuelve True cuando tenga sólo números, no espacios ni nada mas
print(frase.isdigit())

# istitle devuelve true cuando se cumpla el formato que pide.
print(frase.istitle())

# islower y isupper, comprueba que las letras esten en minuscula o mayuscula.
print(frase.islower())
print(frase.isupper())

# Sólo pone en mayúscula la primera letra de la primera palabra de mi frase
print(frase.capitalize())

# Dice a partir de que posición a encontrado la cadena (-1 es que no lo encontró), principio y final son opcionales
print(frase.find("tA",2,7))
print(frase.find("Ya"))
print(frase.startswith("c"))
print(frase.lower().startswith("c"))
print(frase.endswith("A"))
print(frase.upper().endswith("A"))
print(frase.count("a"))
print(frase.count("a",4,8))
print(frase.lower().count("a"))

# len sirve para contar los caracteres de la string, contando desde el 0 hasta el 9 incluido en este caso.
print(len(frase))

# Extrae contenido dependiendo de los parametros, el primero dice donde empieza, el segundo el final y el tercero el paso.
# Se puede omitir tot, interptreta 0, tot y 1
print(frase[0:15:2])

# con una letra extrae una letra
print(frase[5])

# para invertir la frase
print(frase[15:0:-1])