# Pt.20 Exercici 3:

morse = {'A': '.-', 'B': '-...', 'C': '-.-.',
'D': '-..', 'E': '.', 'F': '..-.',
'G': '--.', 'H': '....', 'I': '..',
'J': '.---', 'K': '-.-', 'L': '.-..',
'M': '--', 'N': '-.', "Ñ": "--.--", 'O': '---',
'P': '.--.', 'Q': '--.-', 'R': '.-.',
'S': '...', 'T': '-', 'U': '..-',
'V': '...-', 'W': '.--', 'X': '-..-',
'Y': '-.--', 'Z': '--..', '1': '.----',
'2': '..---', '3': '...--', '4': '....-',
'5': '.....', '6': '-....', '7': '--...',
'8': '---..', '9': '----.', '0': '-----',
'.': '.-.-.-', ',': '--..--', ':': '---...',
';': '-.-.-.', '?': '..--..', '!': '-.-.--',
'"': '.-..-.', "'": '.----.', '+': '.-.-.',
'-': '-....-', '/': '-..-.', '=': '-...-',
'_': '..--.-', '$': '...-..-', '@': '.--.-.',
'&': '.-...', '(': '-.--.', ')': '-.--.-', " ": " "}


palabraMorse = input("\nIntrodueix una frase en morse, les lletres separades per espais i les paraules separades per tres espais: \n")

listaPalabraMorse = palabraMorse.split(" ")
palabraEscrita = ""
c = 0

for i in listaPalabraMorse:
    
    if i != "":
        for j, k in morse.items():
            if i == k:
                palabraEscrita += j

    else:
        c += 1
        if c == 3:
            palabraEscrita += " "
            c = 0

print(palabraEscrita.capitalize(), "\n")
