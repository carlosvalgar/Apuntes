import random

def experimentoRata():
    num = random.randint(1, 3)
    if num == 1:
        return 3 + experimentoRata()
        # 3+ y vuelve
    elif num == 2:
        return 5 + experimentoRata()
        # 5+ y vuelve
    elif num == 3:
        return 7
        # 7 minutos y sale


print(experimentoRata())