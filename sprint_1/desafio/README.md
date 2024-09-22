# Desafio
Para começar o desafio, a primeira coisa que fiz foi a preparação como pedido
baixar o aquivo .csv e a criação do diretorio ecommerce e mover o aquivo para o diretorio criado.

logo em seguida usando o comando **touch** criamos o arquivo **processamento_de_vendas.sh**


e dentro do arquivo .sh ja criado comecei a codar dentro do VS code para as demais tarefas, primeiro coisa que fiz foi 
guardar tudo dentro de variáveis.

e em seguida criei o diretorio vendas, movi o arquivo.csv para dentro dele, criei o subdiretorio backup e dentro de backup movi e renomeei o arquivo.csv como foi pedido.

em seguida geramos um relatorio.txt que é salvo as seguintes informações:
1. Exibe a data e hora atuais
2. Extrai a data da primeira venda 
3. Extrai a data da última venda
4. exibe quantidade total de itens diferentes vendidos 
5. imprime as primeiras 10 linhas do arquivo de backup 
E no final da linha do código  tudo isso é incluido no relatorio.


logo em seguida voltamos a backup e compactamos o arquivo.csv para arquivo.zip

Depois de tudo isso feito removemos os arquivos .csv de backup e vendas.

ainda usando o terminal do VS code criamos o comando **crontab** e dentro do editor de texto 
configuramos o mesmo para que durante 4 dias as 15:27 o arquivo.sh criasse o relatorio.txt e o arquivo.zip

passado os 4 dias criamos o **consolidador_de_vendas.sh**
e dentro dele configurei para criar um relatorio_final.txt que junta todos os outros relatorios em um só.

Claro tive varios erros e acertos pois havian coisas que desconheciam, porém com bastante pesquisa consegui finalizar o desafio.

### obervação

**No README da SPRINT encontra-se todas as imagens de cada passo**

