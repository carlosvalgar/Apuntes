def paraulaAlfabetica():
    paraula = input("\nIntrodueix una paraula:\n    > ")
    return sorted(paraula.lower()) == list(paraula.lower())
    
if paraulaAlfabetica() == True:
    print("\nEs una paraula alfabética.")
    
else:
    print("\nNo es una paraula alfabética.")
