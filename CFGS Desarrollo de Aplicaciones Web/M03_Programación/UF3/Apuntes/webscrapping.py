import requests # Libreria para extraer la pagina
from bs4 import BeautifulSoup # Libreria para tratar la pagina

# url = "https://www.muyinteresante.es/ciencia/fotos/las-diez-mujeres-mas-influyentes-en-la-historia-de-la-ciencia/mariecurie"
# page = requests.get(url).text # Le pasamos la pagina en formato texto
# soup = BeautifulSoup(page, "lxml") # Creamos la clase soup a partir de la Beautiful soup

# for nom_mujeres in soup.find_all(class_="item--title"):
#     print(nom_mujeres.get_text())

# url = "https://www.tripadvisor.es/Restaurants-g187497-zfp58-Barcelona_Catalonia.html"
# page = requests.get(url).text
# soupRestaurant = BeautifulSoup(page, "lxml")

# for restaurante in soupRestaurant.find_all(class_="_15_ydu6b"):
#     print(restaurante.get_text())

# url = "https://www.borsabcn.es/esp/aspx/Indices/Resumen.aspx"
# page = requests.get(url).text
# soup = BeautifulSoup(page, "lxml")

# tabla = soup.find(class_="TblPort")

# for fila in tabla.find_all("tr"):
#     numCelda = 0
#     for celda in fila.find_all("td"):
#         if numCelda == 0:
#             print("Índice: ", celda.text.ljust(50), end = "")
        
#         elif numCelda == 2:
#             print(" Último: ", celda.text.ljust(20), end = "")
        
#         elif numCelda == 8:
#             print(" % Dif. Año 2021: ", celda.text)
        
#         numCelda += 1

# nombre equipo y puntos que lleva

url = "http://www.ligafemenina2.es/clasificacion.aspx"
page = requests.get(url).text
ligaFemeninaSoup = BeautifulSoup(page, "lxml")

tabla = ligaFemeninaSoup.find(class_="tabla-estadistica")

tabla = tabla.find("tbody")
tablaAux = []

for row in tabla.find_all("tr"):
    numCelda = 0
    for column in row.find_all("td"):
        if numCelda == 1:
            tablaAux = column.text.split("\n")
            tablaAux = [x for x in tablaAux if x]
            print("Equipo: ",tablaAux[0].ljust(35), end = "")
        elif numCelda == 7:
            print(" Puntos: ", column.text)
        
        numCelda += 1