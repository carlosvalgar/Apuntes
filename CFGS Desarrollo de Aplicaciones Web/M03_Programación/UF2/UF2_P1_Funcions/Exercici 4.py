def desglossamentBilletsMonedes(euros):
    tuplaDiners = (500, 200, 100, 50, 20, 10, 5, 2, 1)
    llistaCuantitatBillets = []
    
    for x in tuplaDiners:
        desglosament = euros / x
        
        if desglosament > 0:
            llistaCuantitatBillets.append(int(desglosament))
            euros = euros % x
            
        else:
            llistaCuantitatBillets.append(int(desglosament))
    
    for x in range(len(tuplaDiners)):
        if x < 6:
            if llistaCuantitatBillets[x] > 0:
                print(str(llistaCuantitatBillets[x]) + " billets de " + str(tuplaDiners[x]) + " euros.")
        else:
            if llistaCuantitatBillets[x] > 0:
                print(str(llistaCuantitatBillets[x]) + " monedes de " + str(tuplaDiners[x]) + " euros.")
                
desglossamentBilletsMonedes(434)