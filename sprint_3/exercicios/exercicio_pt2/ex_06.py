a = [1, 1, 2, 3, 5, 8, 14, 21, 34, 55, 89]
b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]



conjunto_a = set(b)
conjunto_b = set(a)

conjunto_unico = conjunto_a & conjunto_b
lista = list(conjunto_unico)



print(lista)