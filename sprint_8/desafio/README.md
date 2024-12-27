# Desafio

para executar o desafio pruimeiros vamos comentar sobre como foi feito dentro da aws com o glue e o S3 e em seguida iremos ver como funciona o código usado dentro do jobs do glues, tanto para processar os dados csv como os json.

## Criando jobs

### job para os arquivos csv

para iniciar, dentro do console do aws acessamos o aws glue e fizemos os jobs para limpeza dos dados

1. dentro do glue studio clicamos em script editor, e em seguida clicamos em create script escolhendo spark, como na imagem a baixo:

![jobs glue](../evidencias/desafio/ex_001.png)

2. em seguida vamos em 'job details' e configuramos os detalhes do job como descritos na Udemy ultilizando python como linguagem para ultilizar o spark

![detalhes job](../evidencias/desafio/ex_002.png)

![detalhes job](../evidencias/desafio/ex_003.png)

![detalhes job](../evidencias/desafio/ex_004.png)

3. na aba de 'script' copio e colo o script previamente desenvolvido localmente no VScode.

![script](../evidencias/desafio/ex_005.png)

![script](../evidencias/desafio/ex_006.png)

![script](../evidencias/desafio/ex_007.png)

4. antes de rodarmos o job vamos até o s3 para verificar que ainda nao temos a trusted zone dentro do bucket.

![navegando até o s3](../evidencias/desafio/ex_008.png)

![navegando até o s3](../evidencias/desafio/ex_009.png)

5. como vimos na etapa anterior nao temos a trusted zone, agora vamos salvar e rodar nosso script dentro do job o qual fara a limpeza dos dados e salvara dentro do s3 no caminho da trusted zone.

![rodando job](../evidencias/desafio/ex_010.png)

![rodando job](../evidencias/desafio/ex_011.png)

6. com nosso job rodou com sucesso, agora navegaremos até o s3 para verificar se está tudo ok.


![navegando até o s3](../evidencias/desafio/ex_012.png)

![navegando até o s3](../evidencias/desafio/ex_013.png)

![navegando até o s3](../evidencias/desafio/ex_014.png)

![navegando até o s3](../evidencias/desafio/ex_015.png)

![navegando até o s3](../evidencias/desafio/ex_016.png)

![navegando até o s3](../evidencias/desafio/ex_017.png)

![navegando até o s3](../evidencias/desafio/ex_018.png)

### job para os arquivos json

como vimos nosso job para os aquivos csv foram um sucesso!
agora iremos criar um outro job para processar os arquivos json, os mesmo processos e configuracoes foram feitos igual ao job anterior, com isso vou mostrar apenas a parte do script em diante.

1. com o job ja criado e configurado, copiei e colei o script previamnete feito localmente no VS code, e coloquei dentro do job para rodar.

![job json](../evidencias/desafio/ex_019.png)

![job json](../evidencias/desafio/ex_020.png)

2. ja com o script dentro do job, salvamos e rodamos o script

![job json](../evidencias/desafio/ex_021.png)

3. vimos que o script roudou com sucesso, vimos também no passo anteriormente so tinhamos a caminho para os aqruivos csv, entao vamos navegar até o bucket para ver se deu certo.

![job json](../evidencias/desafio/ex_022.png)

![job json](../evidencias/desafio/ex_023.png)

![job json](../evidencias/desafio/ex_024.png)

![job json](../evidencias/desafio/ex_025.png)
 
![job json](../evidencias/desafio/ex_026.png)

![job json](../evidencias/desafio/ex_027.png)

## catalogando dados de filmes com glue crawler.

### Bom vimos que nosso jobs foram um sucesso, agora vamos usar o glue crawler para catalogar os dados? bom, vamos lá.

1. dentro do aws glue, vamos em crawler e damos uma nome para o crawler, e apertamos em next.

![crawler](../evidencias/desafio/ex_028.png)

2. depois, vamos adcionar o caminho dos dados dentro do s3 que queremos catalogar, nesse caso o caminho dos antigos csv que agora sao parquet

![crawler](../evidencias/desafio/ex_029.png)

![crawler](../evidencias/desafio/ex_030.png)

3. depois de adiciopnar os dados que vamso catalogar, agora iremos colocar um role, como ja havia uma criada do exercicio, decidi usar ela para dar acesso ao nosso s3, e apertamnos em next.

![crawler](../evidencias/desafio/ex_031.png)

4. em seguida, escolhemos uma database previamente criado, e  apertamos em next.

![crawler](../evidencias/desafio/ex_032.png)

5. revisamos tudo, e clicamos em creat crawler

![crawler](../evidencias/desafio/ex_033.png)

6. com nosso crawler criado rodamos o mesmo.

![crawler](../evidencias/desafio/ex_034.png)

7. como vimos o crawler foi um sucesso, com isso navegamod ate a aba de tabelas oara ver se os dados realmente foram catalogados

![crawler](../evidencias/desafio/ex_035.png)

![crawler](../evidencias/desafio/ex_36.png)

8. esse foi o primeiro crawler para os antigos arquivos csv, agora vamos criar outro para os antigos json. foram usados as mesmas configuracoes e o mesmo database para catalogar os dados, apenas mudamos os nomes, diante disso rodamos o crawler e vnavegamos para ver se realmente foram catalogados

![crawler](../evidencias/desafio/ex_037.png) 

![crawler](../evidencias/desafio/ex_038.png)

![crawler](../evidencias/desafio/ex_039.png)

como vistos os dois crawler foram um sucesso, agora vamos ver o que cada script faz

## explicando os scripts usados 

1. script job csv

    ````python
            # Importação das bibliotecas necessárias para o Glue e PySpark
    import sys
    from awsglue.transforms import *
    from awsglue.utils import getResolvedOptions
    from pyspark.context import SparkContext
    from awsglue.context import GlueContext
    from awsglue.job import Job
    from pyspark.sql.types import StructType, StructField, StringType, IntegerType, FloatType
    from pyspark.sql import functions as F
    from datetime import datetime


    # Inicializando o contexto Spark e Glue
    args = getResolvedOptions(sys.argv, ['JOB_NAME'])
    sc = SparkContext()
    glueContext = GlueContext(sc)
    spark = glueContext.spark_session
    job = Job(glueContext)
    job.init(args['JOB_NAME'], args)

    # Definição do schema para os dados de filmes
    movies_schema = StructType([
        StructField("id", StringType(), True),
        StructField("tituloPincipal", StringType(), True),
        StructField("tituloOriginal", StringType(), True),
        StructField("anoLancamento", IntegerType(), True),
        StructField("tempoMinutos", IntegerType(), True),
        StructField("genero", StringType(), True),
        StructField("notaMedia", FloatType(), True),
        StructField("numeroVotos", IntegerType(), True),
        StructField("generoArtista", StringType(), True),
        StructField("personagem", StringType(), True),
        StructField("nomeArtista", StringType(), True),
        StructField("anoNascimento", IntegerType(), True),
        StructField("anoFalecimento", IntegerType(), True),
        StructField("profissao", StringType(), True),
        StructField("titulosMaisConhecidos", StringType(), True)
    ])

    # Definição do schema para os dados de séries
    series_schema = StructType([
        StructField("id", StringType(), True),
        StructField("tituloPincipal", StringType(), True),
        StructField("tituloOriginal", StringType(), True),
        StructField("anoLancamento", IntegerType(), True),
        StructField("anoTermino", IntegerType(), True),
        StructField("tempoMinutos", IntegerType(), True),
        StructField("genero", StringType(), True),
        StructField("notaMedia", FloatType(), True),
        StructField("numeroVotos", IntegerType(), True),
        StructField("generoArtista", StringType(), True),
        StructField("personagem", StringType(), True),
        StructField("nomeArtista", StringType(), True),
        StructField("anoNascimento", IntegerType(), True),
        StructField("anoFalecimento", IntegerType(), True),
        StructField("profissao", StringType(), True),
        StructField("titulosMaisConhecidos", StringType(), True)
    ])

    # Obtendo a data atual para gerar o caminho dinâmico de saída
    current_date = datetime.now().strftime('%Y-%m-%d')

    # Caminhos para o raw zone (dados brutos) e trusted zone (dados tratados) no S3
    RAW_ZONE_PATH = "s3://data-lake-mateus/Raw/Local/CSV"
    TRUSTED_ZONE_PATH = "s3://data-lake-mateus/Trusted/Local/PARQUET"

    # Função para processar os dados
    def process_data(entity, schema):
        # Construção do caminho para o arquivo de dados raw (bruto) com base na entidade (Movies ou Series)
        raw_path = f"{RAW_ZONE_PATH}/{entity}/2024/11/28/{entity.lower()}.csv"
        # Construção do caminho para salvar os dados processados (trusted)
        trusted_path = f"{TRUSTED_ZONE_PATH}/{entity}/{current_date}/"
        
        # Leitura do arquivo CSV com os dados, aplicando o schema para estruturar os dados
        df_raw = spark.read.option("delimiter", "|").csv(raw_path, header=True, schema=schema)
        
        # Limpeza dos dados: remoção de duplicatas e valores nulos
        df_clean = (
            df_raw
            .dropDuplicates()  # Remove duplicatas
            .dropna(how="all")  # Remove linhas com todos os valores nulos
            .select([  # Processamento de cada coluna para garantir que valores inválidos sejam convertidos para None
                F.when(F.col(col) == "\\N", None).otherwise(F.col(col)).alias(col)  # Substitui "\\N" por None
                for col in df_raw.columns
            ])
            .withColumn("id", F.regexp_replace(F.col("id"), "[^0-9]", "").cast(IntegerType()))  # Limpeza do campo "id" removendo caracteres não numéricos e convertendo para inteiro
            .withColumn(  # Processamento da coluna "titulosMaisConhecidos" para tratar a string separada por vírgulas
                "titulosMaisConhecidos",
                F.when(
                    F.col("titulosMaisConhecidos").isNotNull(),  # Verifica se a coluna não é nula
                    F.concat_ws(
                        ",",  # Junta os valores com uma vírgula
                        F.expr("transform(split(titulosMaisConhecidos, ','), x -> cast(regexp_replace(x, '[^0-9]', '') as int))")  # Converte os valores para inteiros e remove caracteres não numéricos
                    )
                ).otherwise(None)  # Se for nulo, deixa como nulo
            )
        )
        
        # Salvando os dados limpos no formato Parquet na trusted zone do S3
        df_clean.write.mode("overwrite").format("parquet").save(trusted_path)
        print(f"Dados do {entity} processados e salvos em: {trusted_path}")

    # Processando os dados de filmes e séries
    process_data("Movies", movies_schema)  # Processa os dados de filmes com o schema de filmes
    process_data("Series", series_schema)  # Processa os dados de séries com o schema de séries

    # Finaliza o job
    job.commit()








2. script job json

    ````python
        # Importação de bibliotecas necessárias para o AWS Glue e PySpark
    import sys
    from awsglue.transforms import *
    from awsglue.utils import getResolvedOptions
    from pyspark.context import SparkContext
    from awsglue.context import GlueContext
    from awsglue.job import Job
    from pyspark.sql.types import StructType, StructField, IntegerType, StringType, ArrayType, LongType
    from pyspark.sql.functions import format_number, col, explode
    from datetime import datetime

    # @params: [JOB_NAME]
    # Captura o nome do job que foi passado como argumento
    args = getResolvedOptions(sys.argv, ['JOB_NAME'])

    # Inicialização do contexto Spark e Glue
    sc = SparkContext()
    glueContext = GlueContext(sc)
    spark = glueContext.spark_session
    job = Job(glueContext)
    job.init(args['JOB_NAME'], args)

    # Definição do schema para estruturar os dados de entrada
    schema = StructType([
        StructField("id", IntegerType(), True),  # ID do filme
        StructField("titulo", StringType(), True),  # Título do filme
        StructField("ano_lancamento", StringType(), True),  # Ano de lançamento
        StructField("estudio", StringType(), True),  # Estúdio responsável pelo filme
        StructField("genero", ArrayType(StringType()), True),  # Gêneros do filme em formato de array
        StructField("diretores", StringType(), True),  # Diretores do filme
        StructField("orcamento", LongType(), True),  # Orçamento do filme
        StructField("arrecadacao", LongType(), True)  # Arrecadação do filme
    ])

    # Data atual para uso no caminho de saída
    current_date = datetime.now().strftime('%Y-%m-%d')

    # Caminhos para a zona de dados brutos (RAW) e zona confiável (TRUSTED) no S3
    RAW_ZONE_PATH = "s3://data-lake-mateus/Raw/TMDB/JSON/2024/12/15/"
    TRUSTED_ZONE_PATH = "s3://data-lake-mateus/Trusted/TMDB/PARQUET"

    # Função para processar os dados
    def process_data(schema):
        # Caminho para os arquivos JSON de entrada
        raw_path = f"{RAW_ZONE_PATH}*.json"
        # Caminho para salvar os dados processados
        trusted_path = f"{TRUSTED_ZONE_PATH}/{current_date}/"

        # Leitura dos dados JSON com schema definido, considerando que o arquivo sao multiline
        df = spark.read.option("multiline", "true").schema(schema).json(raw_path)

        # Explosão da coluna "genero", que é um array, transformando cada elemento em uma linha
        df_exploded = df.withColumn("genero_nome", explode(col("genero"))).drop("genero")

        # Formatação das colunas "orcamento" e "arrecadacao" para exibir valores sem casas decimais
        df_formatted = df_exploded.withColumn("orcamento", format_number(col("orcamento"), 0)) \
                                .withColumn("arrecadacao", format_number(col("arrecadacao"), 0))

        # Reorganização das colunas na ordem desejada
        column_order = ["id", "titulo", "ano_lancamento", "estudio", "diretores", "genero_nome", "orcamento", "arrecadacao"]
        df_final = df_formatted.select(*column_order)

        # Escrita dos dados processados no formato Parquet na zona confiável do S3
        df_final.write.mode("overwrite").format("parquet").save(trusted_path)

    # Chamando a função para processar os dados
    process_data(schema)

    # Finalização do job
    job.commit()







