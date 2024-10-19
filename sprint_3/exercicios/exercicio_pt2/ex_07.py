a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

def nova_lista(lista):
    resultado = []
    for numero in lista:
     if numero % 2 != 0:
        resultado.append(numero)
    return resultado
    
print(nova_lista(a))