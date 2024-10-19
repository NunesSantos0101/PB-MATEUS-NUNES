lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

divisao = len(lista) // 3

primeira_parte = lista[:divisao]
segunda_parte = lista[divisao:8]
terceira_parte = lista[8:]

print(primeira_parte, segunda_parte, terceira_parte)