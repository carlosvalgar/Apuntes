import pickle

lista= [["Pepe", "Garcia", 89], ["Armin", "Garcia", "89"], ["Sasha", "Garcia", "89"], ["Eren", "Garcia", "89"]]

with open ("datosBinarios.txt", "wb") as binario:
    # Te guarda los archivos en binario
    pickle.dump(lista, binario)

with open ("datosBinarios.txt", "rb") as binario:
    # Cargamos los archivos en binario
    print(pickle.load(binario))