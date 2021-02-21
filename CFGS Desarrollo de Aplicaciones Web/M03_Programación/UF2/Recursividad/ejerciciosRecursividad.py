import random
# 1.- Método Rus
# def rus(a, b):
#     if a == 1:
#         return b
    
#     if a%2 == 1:
#         return b + rus(int(a / 2) ,(b * 2))
    
#     elif a%2 == 0:
#         return rus(int(a / 2) ,(b * 2))

# print(rus(27, 82))

# 2.- Curiositat matemàtica
# def curiositat(num):
#     uno = "1" * num
#     if num == 1:
#         print(int(uno) ** 2)
#         return
    
#     curiositat(num -1)
#     print(int(uno) ** 2)

# curiositat(8)

#3.- Endevina el número

def endevina(num = random.randint(0, 1000), min=0, max= 1000):
    if min == 0 and max == 1000:
        adivina = int(input("El programa ha generat un número entre " + str(min) + " i " + str(max) + ".\nQuin creus que és?\n    > "))
        
        if num == adivina:
            print("CORRECTE. Has endevinat el número en el 1 intent.")
        
        elif num < adivina:
            print("CORRECTE. Has endevinat el número en el " + str(1 + endevina(num, min, adivina)) + " intent.")
        
        elif num > adivina:
            print("CORRECTE. Has endevinat el número en el " + str(1 + endevina(num, adivina, max)) + " intent.")
        
    else: 
        adivina = (int(input("El número es troba entre " + str(min) + " i " + str(max) + ".\nQuin creus que és?\n    > " )))
    
        if num == adivina:
            return 1
        
        else:
            if num < adivina:
                return 1 + endevina(num, min, adivina)
            
            elif num > adivina:
                return 1 + endevina(num, adivina, max)
            
endevina()

