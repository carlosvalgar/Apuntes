# Definim les funcions com s'especifica

def sumar (a, b):
    return a + b

def restar (a, b):
    return a - b

def multiplicar (a, b):
    return a * b

def dividir (a, b):
    try:
        return a / b
    
    except ZeroDivisionError:
        return "ERROR: No es pot dividir per zero."