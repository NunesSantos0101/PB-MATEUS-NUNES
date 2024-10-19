lista = ['maça', 'arara', 'audio', 'radio', 'radar', 'moto']

def palindromo(pali):

    for palavra in pali:
        if palavra == palavra[::-1]:
            print(f"A palavra: {palavra} é um palíndromo")
        else:
         print(f"A palavra: {palavra} não é um palíndromo")
        
palindromo(lista)