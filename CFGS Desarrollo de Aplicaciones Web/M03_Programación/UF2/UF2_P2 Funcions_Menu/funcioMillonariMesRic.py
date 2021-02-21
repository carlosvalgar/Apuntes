import time

def millonariMesRic(empresari, accions):
    # Inicialitzem dues variables que tindrán el valor del millonari més ric i cuant té per a la comparació
    mesRic = ""
    riquesa = 0
    
    # Comparem el valor de riquesa de tots els millonaris i ens quedem el que sigui mes alt juntament amb el seu nom
    
    for x in empresari.keys():
        contadorValorAccions = 0
        
        for y in accions.keys():
            contadorValorAccions += empresari[x][1][y] * accions[y]
            
        if contadorValorAccions > riquesa:
            mesRic = x
            riquesa = contadorValorAccions
    
    # Printem els valors que ens ha donat
    
    print("\nEl millonari més ric es ", end = "")
    
    for x in mesRic:
        print(x, end = "", flush = True)
        time.sleep(0.3)
    
    print(" amb un valor total d'accions valorat en ", end = "")
    
    for x in str(f"{riquesa:.2f}"):
        print(x, end = "", flush = True)
        time.sleep(0.3)
    
    print(" Euros.\n")
    
    time.sleep(1)