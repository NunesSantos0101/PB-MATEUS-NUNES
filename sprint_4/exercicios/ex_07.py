def pares_ate(n: int):
    for i in range(2, n + 1): 
        if i % 2 == 0: 
            yield i  


for par in pares_ate(10):
    print(par)  