def processar_estudantes(nome_arquivo):
    with open(nome_arquivo, 'r') as arquivo:
        linhas = arquivo.readlines()
    
    estudantes = []
    
    for linha in linhas:
        partes = linha.strip().split(',')
        nome = partes[0]
        notas = list(map(int, partes[1:]))
        
        
        tres_maiores_notas = sorted(notas, reverse=True)[:3]
        
       
        media = round(sum(tres_maiores_notas) / len(tres_maiores_notas), 2)
        
        estudantes.append((nome, tres_maiores_notas, media))
    
   
    estudantes.sort(key=lambda x: x[0])
    

    for estudante in estudantes:
        nome, notas, media = estudante
        print(f'Nome: {nome} Notas: {notas} Média: {media}')


processar_estudantes('estudantes.csv')
