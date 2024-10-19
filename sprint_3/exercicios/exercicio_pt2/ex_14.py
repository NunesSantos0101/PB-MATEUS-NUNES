def parametro(*args, **kwargs):

    for arg in args:
        print(arg)
    
    for chave, valor in kwargs.items():
        print(f"{valor}")
parametro(1, 3, 4, 'hello', parametro_nomeado='alguma coisa', x=20)