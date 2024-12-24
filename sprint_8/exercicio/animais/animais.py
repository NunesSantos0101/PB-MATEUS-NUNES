animais = ["Cachorro", "Gato", "Hiena", "Avestruz", "Gamba", "Macaco", "Zebra", 
           "Hipopotamo", "Lobo", "Capivara", "Veado", "Crocodilo", "Orangotango", "Tigre", 
           "Tucano", "Aguia", "Urubu", "Elefante", "Girafa", "Ovelha"]

# Ordenar a lista de animais
animais_ordenados = sorted(animais)

# Imprimir os animais ordenados (com list comprehension)
[print(animal) for animal in animais_ordenados]

# Salvar os animais ordenados em um arquivo CSV
with open("animais.csv", "w") as file:
    file.writelines([f"{animal}\n" for animal in animais_ordenados])
