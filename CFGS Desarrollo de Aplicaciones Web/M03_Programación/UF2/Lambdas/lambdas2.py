# Exercici 2
# tuplesCotxes = [
#     ("Vermell", "4859-A", "A"),
#     ("Blau", "2901-Z", "M"),
#     ("Gris", "1892-B", "M")
# ]

# print(sorted(tuplesCotxes, key = lambda x: x[1], reverse = True))

# diccionariCotxes = [
#     {"color": "Vermell", "matricula": "4859-A", "canvi": "A"},
#     {"color": "Blau", "matricula": "2901-Z", "canvi": "M"},
#     {"color": "Gris", "matricula": "1892-B", "canvi": "M"}
# ]

# print(sorted(diccionariCotxes, key = lambda x : x["color"]))

# graus = {
#     "Londres" : (295, 22),
#     "Madrid": (309, 36),
#     "Barcelona": (293, 20),
#     "Sevilla": (299, 26),
#     "Cádiz": (303, 30),
#     "Lima": (311, 38)
# }

# print(sorted(graus.items(), key = lambda x : x[1][1]))

def ordenarEdatCotxeManual(diccionari_cotxes, dic_compradors):
    listaMatricula = []
    for i in diccionari_cotxes:
        if i["canvi"] == "M":
            listaMatricula.append(i["matricula"])
            
    listaCotxeManual = []
    for i in dic_compradors.items():
        if i[1]["matricula"] in listaMatricula:
            listaCotxeManual.append(i)
    
    print(sorted(listaCotxeManual, key = lambda x : x[1]["edat"]))

diccionari_cotxes = [
    {"color": "Vermell", "matricula": "4859-A", "canvi": "A"},
    {"color": "Blau", "matricula": "2901-Z", "canvi": "M"},
    {"color": "Gris", "matricula": "1892-B", "canvi": "M"},
    {"color": "Blanc", "matricula": "3392-R", "canvi": "M"}
]

dic_compradors = {
"12345678Z": {"nom": "Anna", "matricula": "4859-A", "edat": 33},

"98765432M": {"nom": "Carolina", "matricula": "2901-Z", "edat": 55},

"23456789D": {"nom": "Aaron", "matricula": "1892-B", "edat": 38},
"33356789G": {"nom": "Pol", "matricula": "3392-R", "edat": 21},
}

ordenarEdatCotxeManual(diccionari_cotxes, dic_compradors)