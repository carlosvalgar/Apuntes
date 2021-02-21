def llegeixNum():
    while True:
        try:
            x = int(input("NUM: "))
            
            if x < 0 or x > 10:
                raise Exception
            
            y = 14 / x

        except ValueError:
            print("ERROR: Introduce un numero entero.")
            
        except ZeroDivisionError:
            print("ERROR: No se puede dividir por 0.")
        
        except Exception:
            if x < 0:
                print("ERROR: No podemos calcular negativos")
            
            elif x > 10:
                print("ERROR: No podemos calcular con numeros mayor que 10.")
        
        else:
            print("Division finalizada")
        
        finally:
            print("Una vuelta mas.")
            
        return y
            
    
print(llegeixNum())