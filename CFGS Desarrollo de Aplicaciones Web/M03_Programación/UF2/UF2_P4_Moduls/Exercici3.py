def validarNom(nom):
    # Fem un modul que rep una cadena de text i revisa la seva longitud i si es alfanumerica i ens retorna true en cas positiu 
    if len(nom) >= 6 and len(nom) <= 12:
    
        if nom.isalnum() == True:
            return True
        
        else:
            return "El nom d'usuari pot contenir només lletres i numeros"
    
    else:
        if len(nom) < 6:
            return "El nom d'usuari ha de contenir almenys 6 caràcters"
            
        elif len(nom) > 12:
            return "El nom d'usuari no pot contenir més de 12 caràcters"