speed = {'jan':47, 'feb':52, 'march':47, 'April':44, 'May':52, 'June':53, 'july':54, 'Aug':44, 'Sept':54}

resultado = []
for valores in speed.values():
    resultado.append(valores)

conjunto = set(resultado)
lista = list(conjunto)

print(lista)