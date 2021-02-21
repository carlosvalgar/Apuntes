def numEntreValores(num1, num2):
    numUsuario = int(input("Introduce tu número: "))
    
    if numUsuario >= num1 and numUsuario <= num2:
        return True
    else:
        return numEntreValores(num1, num2)
    
print(numEntreValores(0, 10))