import funcioMenu
import funcioNouMillonari
import funcioMillonariMesRic
import funcioInformacioMillonaris
import funcioAfegirEmpresa
import funcioModificarMillonari
import time

# Aquí es on es conecten totes les funcions per a aquest programa. Durant el programa he mirat d'utilitzar la funcio time.sleep() per que no printesi tot de cop.

empresari = {
    "Carlos": [28, {"MicroSopa": 1, "AireTel": 2, "AmenizaDos": 3, "IbemePorUvas": 4, "MacChiton": 5}], 
    "Guillermo": [28, {"MicroSopa": 5, "AireTel": 4, "AmenizaDos": 3, "IbemePorUvas": 2, "MacChiton": 1}],
    "Javier": [45, {"MicroSopa": 9, "AireTel": 5, "AmenizaDos": 8, "IbemePorUvas": 3, "MacChiton": 1}],
    "Julieta": [23, {"MicroSopa": 4, "AireTel": 1, "AmenizaDos": 0, "IbemePorUvas": 5, "MacChiton": 3}],
    "Fernando": [30, {"MicroSopa": 7, "AireTel": 8, "AmenizaDos": 9, "IbemePorUvas": 5, "MacChiton": 5}]
}

accions = {"MicroSopa": 2.67, "AireTel": 1.2, "AmenizaDos": 0.98, "IbemePorUvas": 5.3, "MacChiton": 0.25}

flagMenu = False

while not flagMenu:
    opcioMenuPrincipal = funcioMenu.menuPrincipal()
    
    if opcioMenuPrincipal == 1:
        funcioNouMillonari.nouMillonari(empresari, accions)

    elif opcioMenuPrincipal == 2:
        funcioMillonariMesRic.millonariMesRic(empresari, accions)

    elif opcioMenuPrincipal == 3:
        funcioInformacioMillonaris.informacioMillonaris(empresari)

    elif opcioMenuPrincipal == 4:
        funcioAfegirEmpresa.afegirEmpresa(empresari, accions)
        
    elif opcioMenuPrincipal == 5:
        funcioModificarMillonari.modificarMillonari(empresari, accions)

    elif opcioMenuPrincipal == 6:
        flagMenu = True
        print("\nEl programa es tancarà en:")
        for x in range(5, 0, -1):
            print(str(x), end = "", flush = True)
            time.sleep(0.25)
            for y in range(3):
                print(".", end = "", flush = True)
                time.sleep(0.25)