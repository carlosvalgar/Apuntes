import funcioLogIn
import funcioMenu
import funcioArrelQuadrada
import funcioDivisioDosNumeros
import funciof

# Fem una llista amb els usuaris amb les contrasenyes que poden entrar
usuaris = {
    "Carlos": "Aws1"
}

# Fem el menu que fa referencia a les funcions, a aquest menu nomes es pot entrar si hi ha un login

if funcioLogIn.login(usuaris) == True:
    flagMenu = False
    while not flagMenu:
        opcioMenu = funcioMenu.menu()
        
        if opcioMenu == 1:
            funcioArrelQuadrada.arrelQuadrada()
        
        elif opcioMenu == 2:
            funcioDivisioDosNumeros.divisioDosNumeros()
        
        elif opcioMenu == 3:
            funciof.f()
            
        elif opcioMenu == 4:
            flagMenu = True
        
        
