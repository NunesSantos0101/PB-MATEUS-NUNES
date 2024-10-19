lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

resultado = []
def my_map(lista, f):
    for elemento in lista:
        resultado.append(f(elemento))
    return resultado
def potencia(f):
    return f ** 2
    
resultado = my_map(lista, potencia)

print(resultado)
