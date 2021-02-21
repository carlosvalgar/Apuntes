import re

def login(usuaris):
    while True:
        try:
            # Demanem un nom al usuari i si no es alfabetic fem saltar un error i retornem el nomLogIn a None per identificar on es l'error
            
            nomLogIn = input("\nIntrodueix el nom d'usuari:\n    > ")
            
            if nomLogIn.isalpha() == False:
                nomLogIn = None
                raise ValueError
            
            # Demanem la contrasenya i si no te al menys una lletra majuscula, una minuscula i un numero fem saltar un error i retornem el passLogIn a None per identificar on es l'error
            
            passLogIn = input("\nIntrodueix la contrasenya (Té que tindre una lletra majúscula, una minúscula i un número): \n    > ")
            if re.search("[A-Z]", passLogIn) == None or re.search("[a-z]", passLogIn) == None or re.search("[0-9]", passLogIn) == None:
                passLogIn = None
                raise ValueError
            
            # Si el nom esta en el diccionari i coincideix amb la contrasenya que te asignada validem l'entrada
            
            if nomLogIn in usuaris.keys():
                if passLogIn == usuaris[nomLogIn]:
                    return True
                
                else:
                    print("\nERROR: Contrasenya incorrecta.")
                
                # En cas de no ser un nom d'usuari correcte i una contrasenya correcte li preguntem si vol tornar a afegir els valors, sino sortirem de la funcio el que tancara el programa
                
                flagTornarLogin = False
                while not flagTornarLogin:
                    try:
                        tornarLogin = int(input("\nVol tornar a introduir la contrasenya?\n    1.- Sí\n    2.- No\n    > "))
                        
                        if tornarLogin == 1:
                            flagTornarLogin = True
                        
                        elif tornarLogin == 2:
                            return False
                        
                        else:
                            raise ValueError
            
                    except ValueError:
                        print("\nERROR: Opció incorrecta.")
            else:
                print("\nERROR: Nom d'usuari incorrecte.")
        
        # Utilitzem els None abans fet per identificar l'error, si falla el nomLogin no deixara pasar a la comprovacio d error de contrasenya
        
        except ValueError:
            if nomLogIn == None:
                print("\nERROR: El nom només pot contenir lletres.")
            
            elif passLogIn == None:
                print("\nERROR: La contrasenya no conté tots els caracters especificats.")