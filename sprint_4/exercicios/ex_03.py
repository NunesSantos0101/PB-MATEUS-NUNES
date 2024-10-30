from functools import reduce

def calcula_saldo(lancamentos) -> float:
    valores = map(lambda x: x[0] if x[1] == 'C' else -x[0], lancamentos)
    saldo_final = reduce(lambda acc, val: acc + val, valores)
    return saldo_final


lancamentos = [
    (200, 'D'),
    (300, 'C'),
    (100, 'C')
]

print(calcula_saldo(lancamentos)) 
