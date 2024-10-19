string = "1,3,4,6,10,76"

lista_string = string.split(',')

numeros = map(int, lista_string)


print(sum(numeros))