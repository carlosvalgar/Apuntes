def demanarNumero():
    while True:
        
        # Fem una funcio que ens servira per asegurarnos que tenim un numero en l'input
        
        try:
            numero = float(input("\nIntrodueix el teu número:\n    > "))
            return numero
        
        except ValueError:
            print("\nERROR: Introdueix un nombre.")