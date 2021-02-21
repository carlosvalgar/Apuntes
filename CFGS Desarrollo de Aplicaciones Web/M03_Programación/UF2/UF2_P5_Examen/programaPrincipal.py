import mis_funciones.funciones as funciones

flagMenu = False

# El menú con sus opciones y las funciones que llama hay algunos calculos para intentar implementar funciones

while not flagMenu:
    opcioMenu0 = funciones.menus(funciones.tupla_menu0, funciones.cabecera0)

    if opcioMenu0 == 1:
        while opcioMenu0 == 1:
            opcioMenu01 = funciones.menus(funciones.tupla_menu01, funciones.cabecera01)
            
            if opcioMenu01 == 1:
                while opcioMenu01 == 1:
                    opcioMenu011 = funciones.menus(funciones.tupla_menu011, funciones.cabecera011)
                    
                    if opcioMenu011 == 1:
                        print("WIP Ordenats per ID")
                        
                    elif opcioMenu011 == 2:
                        orden = funciones.ordenar_diccionario_por_valor(funciones.dict_articles, "asc", "Nom_article")
                        datos = []

                        for x in range(len(orden)):
                            datos.append((orden[x], funciones.dict_articles[orden[x]]["Nom_article"], funciones.dict_articles[orden[x]]["stock"], funciones.dict_articles[orden[x]]["preu"]))
                        
                        funciones.imprimir_datos(("ID", "Nombre", "Stock", "Precio"), datos, titulo = "Artículos ordenados por nombre"  )
                        print()
                        
                    elif opcioMenu011 ==3:
                        opcioMenu01 = 0
                    
            elif opcioMenu01 == 2:
                print("WIP cerca article per id")
                
            elif opcioMenu01 == 3:
                print("WIP cerca article per nom")
            
            elif opcioMenu01 == 4:
                funciones.dict_articles[funciones.nuevo_id_articulo()] = {"Nom_article":funciones.nuevo_nombre_articulo(), "stock": funciones.nuevo_stock_articulo(), "preu": funciones.nuevo_precio_articulo()}
            
            elif opcioMenu01 == 5:
                opcioMenu0 = 0
            
    elif opcioMenu0 == 2:
        print("WIP")
    
    elif opcioMenu0 == 3:
        while opcioMenu0 == 3:
            opcioMenu03 = funciones.menus(funciones.tupla_menu03, funciones.cabecera03)
            
            if opcioMenu03 == 1:
                while opcioMenu03 == 1:
                    opcioMenu031 = funciones.menus(funciones.tupla_menu031, funciones.cabecera031)
                    
                    if opcioMenu031 == 1:
                        print("WIP per nom")
                        
                    elif opcioMenu031 == 2:
                        while opcioMenu031 == 2:
                            opcioMenu0312 = funciones.menus(funciones.tupla_menu0312, funciones.cabeceraMenu0312)
                            
                            if opcioMenu0312 == 1:
                                try:
                                    print(funciones.cliente_compra[funciones.peticion_nif()])
                                
                                except KeyError:
                                    print("ERROR: El NIF no existe en nuestra base de datos")
                                
                            elif opcioMenu0312 == 2:
                                print("WIP mostrar compres detallades")
                                
                            elif opcioMenu0312 == 3:
                                opcioMenu031 = 0
                    
                    elif opcioMenu031 == 3:
                        opcioMenu03 = 0
                    
            elif opcioMenu03 == 2:
                print("WIP Cerca 5 clients amb mes despesa")
                
            elif opcioMenu03 == 3:
                print("WIP cerca els 5 clients amb mes despesa en un mes en concret")
                
            elif opcioMenu03 == 4:
                while opcioMenu03 == 4:
                    opcioMenu034 = funciones.menus(funciones.tupla_menu034, funciones.cabecera_menu034)
                    
                    if opcioMenu034 == 1:
                        print("WIP Modificar Nombre")
                    
                    elif opcioMenu034 == 2:
                        print("El nuevo DNI es igual a: " + str(funciones.nuevo_nif()))
                        print("WIP Modificar DNI")                        
                        
                    elif opcioMenu034 == 3:
                        print("El nuevo teléfono es igual a: " + str(funciones.nuevo_telefono()))
                        print("WIP Modificar Telefono")
                    
                    elif opcioMenu034 == 4:
                        opcioMenu03 = 0
                        
            elif opcioMenu03 == 5:
                opcioMenu0 = 0
    
    elif opcioMenu0 == 4:
        flagMenu = True
