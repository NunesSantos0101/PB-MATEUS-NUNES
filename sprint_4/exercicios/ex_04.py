def calcular_valor_maximo(operadores, operandos) -> float:
    
    def aplicar_operacao(op, x, y):
        if op == '+':
            return x + y
        elif op == '-':
            return x - y
        elif op == '*':
            return x * y
        elif op == '/':
            return x / y if y != 0 else float('inf')  
        elif op == '%':
            return x % y if y != 0 else float('inf')  
        else:
            return None 

   
    resultados = map(lambda pair: aplicar_operacao(pair[0], pair[1][0], pair[1][1]),
                     zip(operadores, operandos))

  
    return max(resultados)


operadores = ['+', '-', '*', '/', '+']
operandos  = [(3, 6), (-7, 4.9), (8, -8), (10, 2), (8, 4)]

maior_valor = calcular_valor_maximo(operadores, operandos)
print(maior_valor)  
