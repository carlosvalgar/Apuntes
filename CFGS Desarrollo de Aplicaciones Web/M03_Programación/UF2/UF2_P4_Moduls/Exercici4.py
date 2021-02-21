import re

def validarContrasenya(password):
    # Fem un modul que rep una contrasenya que mira que al menys tingui una lletra majuscula, una minuscula, un numero i un caracter especial, si es compleixen les condicions retorna true
    if len(password) >= 8 and re.search("[A-Z]", password) != None and re.search("[a-z]", password) != None and re.search("[0-9]", password) != None and re.search("[r'\W+']", password) != None and re.search(" ", password) == None:
        return True
    
    else:
        return "La constrasenya triada no és segura"
    